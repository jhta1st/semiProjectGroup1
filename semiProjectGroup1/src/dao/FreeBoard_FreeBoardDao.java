package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import vo.FreeBoard_FreeBoardImageVo;
import vo.FreeBoard_FreeBoardVo;

public class FreeBoard_FreeBoardDao {
	public int contentDelete(int freeBoardNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="delete freeBoard where freeBoardNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, freeBoardNum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public int contentUpdate(FreeBoard_FreeBoardVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="update freeBoard set freeBoardTitle=?, freeBoardContent=? where freeBoardNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getFreeBoardTitle());
			pstmt.setString(2, vo.getFreeBoardContent());
			pstmt.setInt(3, vo.getFreeBoardNum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}	
	public FreeBoard_FreeBoardVo getContentInfo(int freeBoardNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select * from freeBoard where freeBoardNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, freeBoardNum);
			rs=pstmt.executeQuery();			
			if(rs.next()) {
				String freeBoardTitle=rs.getString("freeBoardTitle");
				String freeBoardContent=rs.getString("freeBoardContent");
				Date freeBoardWdate=rs.getDate("freeBoardWdate");
				String userId=rs.getString("userId");
				FreeBoard_FreeBoardVo vo=new FreeBoard_FreeBoardVo(freeBoardNum, freeBoardTitle, freeBoardContent, freeBoardWdate, userId);
				return vo;
			}else {
				return null;
			}
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JDBCUtil.close(con,pstmt,rs);
		}
	}
	public int getCountList(String freeBoardSearchField , String freeBoardSearchKeyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=JDBCUtil.getConn();
			if(freeBoardSearchKeyword==null || freeBoardSearchKeyword.equals("")) {
				sql="select NVL(count(freeBoardNum),0) from freeBoard";
			}else if(freeBoardSearchField.equals("0")) {
				sql="select NVL(count(freeBoardNum),0) from freeBoard where freeBoardTitle Like '%" + freeBoardSearchKeyword + "%' or freeBoardContent Like '%" + freeBoardSearchKeyword + "%'";
			}else if(freeBoardSearchField.equals("1")) {
				sql="select NVL(count(freeBoardNum),0) from freeBoard where freeBoardTitle Like '%" + freeBoardSearchKeyword + "%'";
			}else if(freeBoardSearchField.equals("2")) {
				sql="select NVL(count(freeBoardNum),0) from freeBoard where freeBoardContent Like '%" + freeBoardSearchKeyword + "%'";
			}else if(freeBoardSearchField.equals("3")) {
				sql="select NVL(count(freeBoardNum),0) from freeBoard where UserId Like '%" + freeBoardSearchKeyword + "%'";
			}
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}else {
				return -1;
			}
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,rs);
		}
	}
	public ArrayList<FreeBoard_FreeBoardVo> list(int startRow, int endRow, String freeBoardSearchField , String freeBoardSearchKeyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=JDBCUtil.getConn();
			if(freeBoardSearchKeyword==null || freeBoardSearchKeyword.equals("")) {
				sql="select * from(select AA.*, rownum rnum from(select * from freeBoard order by freeBoardNum desc)AA) where rnum>=? and rnum<=?";
			}else if(freeBoardSearchField.equals("0")){
				sql="select * from(select AA.*, rownum rnum from(select * from freeBoard where freeBoardTitle Like '%" + freeBoardSearchKeyword + "%' or freeBoardContent Like '%" + freeBoardSearchKeyword + "%' order by freeBoardNum desc)AA) where rnum>=? and rnum<=?";
			}else if(freeBoardSearchField.equals("1")){
				sql="select * from(select AA.*, rownum rnum from(select * from freeBoard where freeBoardTitle Like '%" + freeBoardSearchKeyword + "%' order by freeBoardNum desc)AA) where rnum>=? and rnum<=?";
			}else if(freeBoardSearchField.equals("2")){
				sql="select * from(select AA.*, rownum rnum from(select * from freeBoard where freeBoardContent Like '%" + freeBoardSearchKeyword + "%' order by freeBoardNum desc)AA) where rnum>=? and rnum<=?";
			}else if(freeBoardSearchField.equals("3")){
				sql="select * from(select AA.*, rownum rnum from(select * from freeBoard where UserId Like '%" + freeBoardSearchKeyword + "%' order by freeBoardNum desc)AA) where rnum>=? and rnum<=?";
			}
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<FreeBoard_FreeBoardVo> list=new ArrayList<FreeBoard_FreeBoardVo>();
			while(rs.next()) {
				int freeBoardNum=rs.getInt("freeBoardNum");
				String freeBoardTitle=rs.getString("freeBoardTitle");
				String freeBoardContent=rs.getString("freeBoardContent");
				Date freeBoardWdate=rs.getDate("freeBoardWdate");
				String userId=rs.getString("userId");
				FreeBoard_FreeBoardVo vo=new FreeBoard_FreeBoardVo(freeBoardNum, freeBoardTitle, freeBoardContent, freeBoardWdate, userId);
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JDBCUtil.close(con,pstmt,rs);
		}
	}
	public int write(FreeBoard_FreeBoardVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into freeBoard values(FREEBOARD_SEQ.nextval,?,?,sysdate,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getFreeBoardTitle());
			pstmt.setString(2, vo.getFreeBoardContent());
			pstmt.setString(3, vo.getUserId());
			pstmt.executeUpdate();
			String sql2="select FREEBOARD_SEQ.currval as freeBoardNum from dual";
			pstmt2=con.prepareStatement(sql2);
			rs=pstmt2.executeQuery();
			if(rs.next()) {
				int freeBoardNum=rs.getInt("freeBoardNum");
				return freeBoardNum;
			}
			return -1;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(null,pstmt2,null);
			JDBCUtil.close(con,pstmt,rs);
		}
	}
	public static FreeBoard_FreeBoardDao instance=new FreeBoard_FreeBoardDao();
	private FreeBoard_FreeBoardDao() {}
	public static FreeBoard_FreeBoardDao getInstance() {
		return instance;
	}
}
