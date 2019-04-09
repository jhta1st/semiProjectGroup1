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
import vo.FreeBoard_FreeBoardImageVo;

public class FreeBoard_FreeBoardImageDao {
	public HashMap<Integer, Integer> imgCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select freeboardnum,NVL(count(freeBoardNum),0) from freeboardimage group by freeboardnum order by freeboardnum";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			HashMap<Integer, Integer> map=new HashMap<Integer, Integer>();
			while(rs.next()) {
				int freeBoardNum=rs.getInt(1);
				int imgCount=rs.getInt(2);
				map.put(freeBoardNum, imgCount);
			}
			return map;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JDBCUtil.close(con,pstmt,rs);
		}
	}
	public int contentImgDelete(int freeBoardImgNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="delete freeBoardImage where freeBoardImgNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, freeBoardImgNum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public int writeImg(FreeBoard_FreeBoardImageVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into freeBoardImage values(FREEBOARDIMAGE_SEQ.nextval,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getFreeBoardOrgImgName());
			pstmt.setString(2, vo.getFreeBoardSavImgName());
			pstmt.setInt(3, vo.getFreeBoardNum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public ArrayList<FreeBoard_FreeBoardImageVo> getContentImageInfo(int freeBoardNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select * from freeBoardImage where freeBoardNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, freeBoardNum);
			rs=pstmt.executeQuery();
			ArrayList<FreeBoard_FreeBoardImageVo> list=new ArrayList<FreeBoard_FreeBoardImageVo>();
			while(rs.next()) {
				int freeBoardImgNum=rs.getInt("freeBoardImgNum");
				String freeBoardOrgImgName=rs.getString("freeBoardOrgImgName");
				String freeBoardSavImgName=rs.getString("freeBoardSavImgName");
				FreeBoard_FreeBoardImageVo vo=new FreeBoard_FreeBoardImageVo(freeBoardImgNum, freeBoardOrgImgName, freeBoardSavImgName, freeBoardNum);
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
	public static FreeBoard_FreeBoardImageDao instance=new FreeBoard_FreeBoardImageDao();
	private FreeBoard_FreeBoardImageDao() {}
	public static FreeBoard_FreeBoardImageDao getInstance() {
		return instance;
	}
}
