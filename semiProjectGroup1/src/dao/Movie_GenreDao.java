package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JDBCUtil;
import vo.Admin_CharInfoVo;
import vo.Movie_GenreVo;
import vo.Movie_MovieInfoVo;
import vo.Movie_ReviewImageVo;

public class Movie_GenreDao {
	private static Movie_GenreDao instance = new Movie_GenreDao();

	public static Movie_GenreDao getInstance() {
		return instance;
	}

	private Movie_GenreDao() {
	}

	public ArrayList<Movie_GenreVo> getGenreName() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Movie_GenreVo> list = new ArrayList<Movie_GenreVo>();
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT * FROM GENRE ORDER BY GENRENUM";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Movie_GenreVo(rs.getInt("genreNum"), rs.getString("genreName")));
			}
			return list;
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
			return null;
		} finally {
			// TODO: handle finally clause
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	public int genreWrite(Movie_GenreVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into genre values(genre_SEQ.nextval,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getGenreName());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	
	public ArrayList<Movie_GenreVo> listAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Movie_GenreVo> list=new ArrayList<Movie_GenreVo>();
		try {
			con=JDBCUtil.getConn();
			String sql="select * from genre order by GENRENUM desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int genreNum=rs.getInt("genreNum");
				String genreName=rs.getString("genreName");
				Movie_GenreVo vo=new Movie_GenreVo(genreNum, genreName);
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
	
	public int delete(int genreNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="delete from genre where genreNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,genreNum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt,null);
		}
	}
	
	public int update(Movie_GenreVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="update genre set genreName=? where genreNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,vo.getGenreName());
			pstmt.setInt(2,vo.getGenreNum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt,null);
		}
	}
	
	public Movie_GenreVo getinfo(int genreNum){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select * from genre where genreNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,genreNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				genreNum=rs.getInt("genreNum");
				String genreName=rs.getString("genreName");
				Movie_GenreVo vo=new Movie_GenreVo(genreNum, genreName);
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
}
