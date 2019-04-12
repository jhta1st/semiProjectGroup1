package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JDBCUtil;

public class Movie_favTableDao {
	public int favDelete(String userId, int movieNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="delete favTable where userId=? and movieNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, movieNum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally{
			JDBCUtil.close(con, pstmt, null);
		}
	}
	public int favInsert(String userId, int movieNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into favTable values(?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, movieNum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally{
			JDBCUtil.close(con, pstmt, null);
		}
	}
	public int favCheck(String userId, int movieNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select * from favTable where userId=? and movieNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, movieNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			}else {
				return 0;
			}
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally{
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	public static Movie_favTableDao instance=new Movie_favTableDao();
	private Movie_favTableDao() {}
	public static Movie_favTableDao getInstance() {
		return instance;
	}
}
