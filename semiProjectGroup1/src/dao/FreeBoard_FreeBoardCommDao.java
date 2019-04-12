package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JDBCUtil;
import vo.FreeBoard_FreeBoardCommVo;
import vo.FreeBoard_FreeBoardVo;

public class FreeBoard_FreeBoardCommDao {
	public ArrayList<FreeBoard_FreeBoardCommVo> getCommListAll(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<FreeBoard_FreeBoardCommVo> fbcList=new ArrayList<FreeBoard_FreeBoardCommVo>();
		try {
			con=JDBCUtil.getConn();
			String sql="select * from freeBoardComm where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();			
			while(rs.next()) {
				int freeBoardCommNum=rs.getInt("freeBoardCommNum");
				String freeBoardCommContent=rs.getString("freeBoardCommContent");
				Date freeBoardCommWdate=rs.getDate("freeBoardCommWdate");
				int freeBoardNum=rs.getInt("freeBoardNum");
				FreeBoard_FreeBoardCommVo vo=new FreeBoard_FreeBoardCommVo(freeBoardCommNum, freeBoardCommContent, freeBoardCommWdate, freeBoardNum, userId);
				fbcList.add(vo);
			}
			return fbcList;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JDBCUtil.close(con,pstmt,rs);
		}
	}
	public HashMap<Integer, Integer> commCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select freeboardnum,NVL(count(freeBoardNum),0) from freeboardcomm group by freeboardnum order by freeboardnum";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			HashMap<Integer, Integer> map=new HashMap<Integer, Integer>();
			while(rs.next()) {
				int freeBoardNum=rs.getInt(1);
				int commCount=rs.getInt(2);
				map.put(freeBoardNum, commCount);
			}
			return map;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JDBCUtil.close(con,pstmt,rs);
		}
	}
	public int contentCommUpdate(FreeBoard_FreeBoardCommVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="update freeBoardComm set freeBoardCommContent=? where freeBoardCommNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getFreeBoardCommContent());
			pstmt.setInt(2, vo.getFreeBoardCommNum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public FreeBoard_FreeBoardCommVo getCommContentInfo(int freeBoardCommNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select * from freeBoardComm where freeBoardCommNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, freeBoardCommNum);
			rs=pstmt.executeQuery();			
			if(rs.next()) {
				String freeBoardCommContent=rs.getString("freeBoardCommContent");
				Date freeBoardCommWdate=rs.getDate("freeBoardCommWdate");
				int freeBoardNum=rs.getInt("freeBoardNum");
				String userId=rs.getString("userId");
				FreeBoard_FreeBoardCommVo vo=new FreeBoard_FreeBoardCommVo(freeBoardCommNum, freeBoardCommContent, freeBoardCommWdate, freeBoardNum, userId);
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
	public int commDelete(int freeBoardCommNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="delete from freeBoardComm where freeBoardCommNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, freeBoardCommNum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public int getCountCommList(int freeBoardNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select NVL(count(freeBoardCommNum),0) from freeBoardComm where freeBoardNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, freeBoardNum);
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
	public ArrayList<FreeBoard_FreeBoardCommVo> commList(int freeBoardNum, int startRow, int endRow) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select * from(select AA.*, rownum rnum from(select * from freeBoardComm where freeBoardNum=? order by freeBoardCommNum)AA) where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, freeBoardNum);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			ArrayList<FreeBoard_FreeBoardCommVo> list=new ArrayList<FreeBoard_FreeBoardCommVo>();
			while(rs.next()) {
				int freeBoardCommNum=rs.getInt("freeBoardCommNum");
				String freeBoardCommContent=rs.getString("freeBoardCommContent");
				Date freeBoardCommWdate=rs.getDate("freeBoardCommWdate");
				String userId=rs.getString("userId");
				FreeBoard_FreeBoardCommVo vo=new FreeBoard_FreeBoardCommVo(freeBoardCommNum, freeBoardCommContent, freeBoardCommWdate, freeBoardNum, userId);
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
	public int commWrite(FreeBoard_FreeBoardCommVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into freeBoardComm values(FREEBOARDCOMM_SEQ.nextval,?,sysdate,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getFreeBoardCommContent());
			pstmt.setInt(2, vo.getFreeBoardNum());
			pstmt.setString(3, vo.getUserId());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public static FreeBoard_FreeBoardCommDao instance=new FreeBoard_FreeBoardCommDao();
	private FreeBoard_FreeBoardCommDao() {}
	public static FreeBoard_FreeBoardCommDao getInstance() {
		return instance;
	}
}
