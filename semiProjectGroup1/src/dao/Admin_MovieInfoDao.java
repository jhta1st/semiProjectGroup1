package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import vo.Admin_CharInfoVo;
import vo.Admin_MovieInfoVo;

public class Admin_MovieInfoDao {
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT NVL(MAX(movieNum),0) MAXNUM FROM movieInfo";
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
			String sql = "SELECT NVL(COUNT(movieNum),0) CNT FROM movieInfo ";
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
	
	public ArrayList<Admin_MovieInfoVo> list(int startRow, int endRow, String field, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
	      if(field==null || field.equals("")) {
				sql="select * from(" 
				+ "    select AA.*, rownum rnum from" 
				+ "    (" 
				+ "    select * from movieInfo"
				+ "    order by movieNum desc" 
				+ "    )AA" 
				+ ")" 
				+ "where rnum>=? and rnum<=?";
	      }else {
	    	    sql="SELECT * FROM ( " +
					   "  SELECT AA.*,ROWNUM RNUM FROM ( " 
	    	    	+"	SELECT * FROM movieInfo WHERE " 
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
			ArrayList<Admin_MovieInfoVo> list = new ArrayList<Admin_MovieInfoVo>();
			while (rs.next()) {
				int movieNum = rs.getInt("movieNum");
				String movieName=rs.getString("movieName");
				String movieIntro=rs.getString("movieIntro");
				String movieReleaseDate=rs.getString("movieReleaseDate");
				int movieRunTime = rs.getInt("movieRunTime");
				String movieProduction=rs.getString("movieProduction");
				String movieDistributer=rs.getString("movieDistributer");
				String nation=rs.getString("nation");
				int movieAge = rs.getInt("movieAge");
				Admin_MovieInfoVo vo = new Admin_MovieInfoVo(movieNum, movieName, movieIntro, movieReleaseDate, movieRunTime,
						movieProduction, movieDistributer, nation, movieAge);
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
	
	
	public int movieInfoWrite(Admin_MovieInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into movieInfo values(movieinfo_SEQ.nextval,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getMovieName());
			pstmt.setString(2, vo.getMovieIntro());
			pstmt.setString(3, vo.getMovieReleaseDate());
			pstmt.setInt(4, vo.getMovieRunTime());
			pstmt.setString(5, vo.getMovieProduction());
			pstmt.setString(6, vo.getMovieDistributer());
			pstmt.setString(7, vo.getNation());
			pstmt.setInt(8, vo.getMovieAge());
			pstmt.executeUpdate();
			String sql2="select movieinfo_SEQ.currval as movieNum from dual";
			pstmt2=con.prepareStatement(sql2);
			rs=pstmt2.executeQuery();
			if(rs.next()) {
				int movieNum=rs.getInt("movieNum");
				return movieNum;
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
	public static Admin_MovieInfoDao instance=new Admin_MovieInfoDao();
	private Admin_MovieInfoDao() {}
	public static Admin_MovieInfoDao getInstance() {
		return instance;
	}
}
