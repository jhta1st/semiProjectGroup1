package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JDBCUtil;
import vo.Movie_GoodVo;


public class Movie_GoodDao {
	public ArrayList<HashMap<String, Object>> getMovieList(int genreNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HashMap<String, Object>> list=new ArrayList<HashMap<String, Object>>();
		try {
			con = JDBCUtil.getConn();
			String sql="";
			if(genreNum==0) {
				sql = "select i.movieNum, i.movieName, g.genreNum, i.movieReleaseDate, r.imageSavName from movieInfo i, movieGenre g, reviewImage r where i.movieNum=g.movieNum and r.movieNum=i.movieNum and imagetype=1";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}else {
				sql = "select i.movieNum, i.movieName, g.genreNum, i.movieReleaseDate, r.imageSavName from movieInfo i, movieGenre g, reviewImage r where i.movieNum=g.movieNum and r.movieNum=i.movieNum and imagetype=1 and genreNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, genreNum);
				rs = pstmt.executeQuery();
			}
			while(rs.next()) {
				int movieNum = rs.getInt("movieNum");
				String movieName = rs.getString("movieName");
				int genreNum1 = rs.getInt("genreNum");
				Date movieReleaseDate = rs.getDate("movieReleaseDate");
				String imageSavName = rs.getString("imageSavName");
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("movieNum", movieNum);
				map.put("movieName", movieName);
				map.put("genreNum1", genreNum1);
				map.put("movieReleaseDate", movieReleaseDate);
				map.put("imageSavName", imageSavName);
				list.add(map);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	public ArrayList<HashMap<String, Object>> getLikeGenre(String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HashMap<String, Object>> list=new ArrayList<HashMap<String, Object>>();
		try {
			con = JDBCUtil.getConn();
			String sql = "select userid, movieReleaseDate, genreNum, count(genreNum) from good group by userid,  movieReleaseDate, genreNum having userId=? order by Count(genreNum) desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Date movieReleaseDate = rs.getDate("movieReleaseDate");
				int genreNum = rs.getInt("genreNum");
				int likeGenre=rs.getInt(4);
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("userId", userId);
				map.put("movieReleaseDate", movieReleaseDate);
				map.put("genreNum", genreNum);				
				map.put("likeGenre", likeGenre);
				list.add(map);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	public ArrayList<Movie_GoodVo> getinfo(String userId){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Movie_GoodVo> list=new ArrayList<Movie_GoodVo>();
		try {
			con=JDBCUtil.getConn();
			String sql="select * from good where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				userId=rs.getString("userId");
				int movienum=rs.getInt("movienum");
				Date movieReleaseDate=rs.getDate("movieReleaseDate");
				int genreNum=rs.getInt("genreNum");
				Movie_GoodVo vo=new Movie_GoodVo(userId, movienum, movieReleaseDate, genreNum);
				list.add(vo);
			}
			return list;	
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
