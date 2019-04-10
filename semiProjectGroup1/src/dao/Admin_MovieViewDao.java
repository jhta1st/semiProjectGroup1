package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import vo.Admin_MovieViewVo;

public class Admin_MovieViewDao {
	
	public ArrayList<Admin_MovieViewVo> detail(int movieNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from movie_view where movieNum=?";
		try {
			con = JDBCUtil.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);
			rs = pstmt.executeQuery();
			ArrayList<Admin_MovieViewVo> detail = new ArrayList<Admin_MovieViewVo>();
			while (rs.next()) {
				String movieName=rs.getString("movieName");
				String movieIntro=rs.getString("movieIntro");
				Date movieReleaseDate=rs.getDate("movieReleaseDate");
				int movieRunTime = rs.getInt("movieRunTime");
				String movieProduction=rs.getString("movieProduction");
				String movieDistributer=rs.getString("movieDistributer");
				String nation=rs.getString("nation");
				int movieAge = rs.getInt("movieAge");
				int genreNum = rs.getInt("genreNum");
				String genreName=rs.getString("genreName");
				Admin_MovieViewVo vo = new Admin_MovieViewVo(movieNum, movieName, movieIntro, movieReleaseDate, movieRunTime, movieProduction, movieDistributer, nation, movieAge, genreNum, genreName);
				detail.add(vo);
			}
			return detail;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT NVL(MAX(movieNum),0) MAXNUM FROM movie_view";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int maxnum = rs.getInt(1);
			return maxnum;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}

	public int getCount(String field, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT NVL(COUNT(movieNum),0) CNT FROM movie_view ";
			if(field!=null && !field.equals("")) {
				sql +="WHERE "+field + " LIKE '%" + keyword +"%'";
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			return cnt;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	
	public ArrayList<Admin_MovieViewVo> list(int startRow, int endRow, String field, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
	      if(field==null || field.equals("")) {
				sql="select * from(" 
				+ "    select AA.*, rownum rnum from" 
				+ "    (" 
				+ "    select * from movie_view"
				+ "    order by movieNum desc" 
				+ "    )AA" 
				+ ")" 
				+ "where rnum>=? and rnum<=?";
	      }else {
	    	    sql="SELECT * FROM ( " +
					   "  SELECT AA.*,ROWNUM RNUM FROM ( " 
	    	    	+"	SELECT * FROM movie_view WHERE " 
				    + field + " LIKE '%" + keyword +"%'"
	    	    	+" ORDER BY movieNum DESC" 
	    	    	+"   )AA " 
				    +")WHERE RNUM>=? AND RNUM<=?";
	      }
		try {
			con = JDBCUtil.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			ArrayList<Admin_MovieViewVo> list = new ArrayList<Admin_MovieViewVo>();
			while (rs.next()) {
				int movieNum = rs.getInt("movieNum");
				String movieName=rs.getString("movieName");
				String movieIntro=rs.getString("movieIntro");
				Date movieReleaseDate=rs.getDate("movieReleaseDate");
				int movieRunTime = rs.getInt("movieRunTime");
				String movieProduction=rs.getString("movieProduction");
				String movieDistributer=rs.getString("movieDistributer");
				String nation=rs.getString("nation");
				int movieAge = rs.getInt("movieAge");
				int genreNum = rs.getInt("genreNum");
				String genreName=rs.getString("genreName");
				Admin_MovieViewVo vo = new Admin_MovieViewVo(movieNum, movieName, movieIntro, movieReleaseDate, movieRunTime, movieProduction, movieDistributer, nation, movieAge, genreNum, genreName);
				list.add(vo);
			}
			return list;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	
	public static Admin_MovieViewDao instance=new Admin_MovieViewDao();
	private Admin_MovieViewDao() {}
	public static Admin_MovieViewDao getInstance() {
		return instance;
	}
}
