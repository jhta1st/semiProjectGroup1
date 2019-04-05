package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JDBCUtil;
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

	public ArrayList<ArrayList<HashMap<String, Object>>> getMovieList() {
		Connection con = null;
		PreparedStatement[] pstmt = new PreparedStatement[getGenreName().size()];
		ResultSet rs = null;
		ArrayList<ArrayList<HashMap<String, Object>>> setList = new ArrayList<ArrayList<HashMap<String, Object>>>();
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT * FROM (SELECT AA.*,ROWNUM RNUM FROM ("
					+ "SELECT M.*,R.IMAGENUM,R.IMAGETYPE,R.IMAGESAVNAME,R.MOVIENUM MNUM "
					+ "FROM MOVIE_VIEW M,REVIEWIMAGE R WHERE M.MOVIENUM=R.MOVIENUM AND M.GENRENUM=? ORDER BY M.MOVIENUM DESC)AA) "
					+ "WHERE RNUM>=20";
			for (int i = 0; i < getGenreName().size(); i++) {
				pstmt[i] = con.prepareStatement(sql);
				pstmt[i].setInt(1, getGenreName().get(i).getGenreNum());
				rs = pstmt[i].executeQuery();
				ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
				if (rs.next()) {
					int movieNum = rs.getInt("movieNum");
					String movieName = rs.getString("movieName");
					int imageNum = rs.getInt("imageNum");
					int imageType = rs.getInt("imageType");
					String imageSavName = rs.getString("imageSavName");
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("movieNum", movieNum);
					map.put("movieName", movieName);
					map.put("imageNum", imageNum);
					map.put("imageType", imageType);
					map.put("imageSavName", imageSavName);
					list.add(map);
				}
				setList.add(list);
			}
			return setList;
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
	}
}
