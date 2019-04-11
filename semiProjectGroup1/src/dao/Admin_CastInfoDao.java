package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JDBCUtil;
import vo.Movie_CastInfoVo;

public class Admin_CastInfoDao {
	public int castInfoDelete(int castNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="delete castInfo where castNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, castNum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public int castInfoUpdate(Movie_CastInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="update castInfo set charNum=?, castDoNum=?, castDoName=? where castNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getCharNum());
			pstmt.setInt(2, vo.getCastDoNum());
			pstmt.setString(3, vo.getCastDoName());
			pstmt.setInt(4, vo.getCastNum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public Movie_CastInfoVo getInfo(int movieNum, int charNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from castInfo where movieNum=? and charNum=?";
		try {
			con = JDBCUtil.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);
			pstmt.setInt(2, charNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int castNum=rs.getInt("castNum");
				int castDoNum=rs.getInt("castDoNum");
				String castDoName=rs.getString("castDoName");
				Movie_CastInfoVo vo=new Movie_CastInfoVo(castNum, charNum, castDoNum, castDoName, movieNum);
				return vo;
			}
			return null;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	public int castInfoWrite(Movie_CastInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into castInfo values(castinfo_seq.nextval,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getCharNum());
			pstmt.setInt(2, vo.getCastDoNum());
			pstmt.setString(3, vo.getCastDoName());
			pstmt.setInt(4, vo.getMovieNum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public static Admin_CastInfoDao instance=new Admin_CastInfoDao();
	private Admin_CastInfoDao() {}
	public static Admin_CastInfoDao getInstance() {
		return instance;
	}
}
