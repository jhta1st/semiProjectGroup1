package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import vo.Movie_GenreVo;
import vo.Movie_MovieInfoVo;

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

	public ArrayList<ArrayList<Movie_MovieInfoVo>> getMovieList() {
		Connection con = null;
		PreparedStatement[] pstmt = new PreparedStatement[getGenreName().size()];
		ResultSet rs = null;
		ArrayList<ArrayList<Movie_MovieInfoVo>> setList = new ArrayList<ArrayList<Movie_MovieInfoVo>>();
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT * FROM (SELECT AA.*,ROWNUM RNUM FROM (SELECT * FROM MOVIE_VIEW WHERE GENRENUM=? ORDER BY MOVIENUM DESC)AA) WHERE RNUM>=20";
			for (int i = 0; i < getGenreName().size(); i++) {
				pstmt[i] = con.prepareStatement(sql);
				pstmt[i].setInt(1, getGenreName().get(i).getGenreNum());
				rs = pstmt[i].executeQuery();
				if (rs.next()) {
					int movieNum=rs.getInt("movieNum");
					String movieName
					String movieIntro
					Date movieReleaseDate
					int movieRunTime
					String movieProduction
					String movieDistributer
					String nation
					int movieAge
					Movie_MovieInfoVo vo=new Movie_MovieInfoVo(movieNum, movieName, movieIntro, movieReleaseDate, movieRunTime, movieProduction, movieDistributer, nation, movieAge);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.close(rs);
			for (int i = 0; i < getGenreName().size(); i++) {
				JDBCUtil.close(pstmt[i]);
			}
			JDBCUtil.close(con);
		}
		ArrayList<Movie_MovieInfoVo> getlist = new ArrayList<Movie_MovieInfoVo>();
	}
}
