package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JDBCUtil;
import vo.Movie_GoodVo;


public class Movie_GoodDao {
	public Movie_GoodVo getinfo(String userId){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select * from good where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				userId=rs.getString("userId");
				int movienum=rs.getInt("movienum");
				Date movieReleaseDate=rs.getDate("movieReleaseDate");
				int rate=rs.getInt("rate");
				int genreNum=rs.getInt("genreNum");
				Movie_GoodVo vo=new Movie_GoodVo(userId, movienum, movieReleaseDate, rate, genreNum);
				return vo;
			}
			return null;	
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	
	public static Movie_GoodDao instance=new Movie_GoodDao();
	private Movie_GoodDao() {}
	public static Movie_GoodDao getInstance() {
		return instance;
	}
}
