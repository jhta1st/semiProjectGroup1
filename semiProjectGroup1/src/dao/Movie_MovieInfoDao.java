package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import vo.Movie_MovieInfoVo;

public class Movie_MovieInfoDao {
	private static Movie_MovieInfoDao instance = new Movie_MovieInfoDao();

	public static Movie_MovieInfoDao getInstance() {
		return instance;
	}

	private Movie_MovieInfoDao() {
	}

	public ArrayList<Movie_MovieInfoVo> getSearchList(String keyword, int genreNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Movie_MovieInfoVo> list = new ArrayList<Movie_MovieInfoVo>();
		String sql = "SELECT * FROM MOVIE_VIEW WHERE MOVIENAME LIKE '%' || ? || '%'";
		try {
			con = JDBCUtil.getConn();
			if (genreNum != 0) {
				sql = sql.concat(" AND GENRENUM=" + genreNum);
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int movieNum = rs.getInt("movieNum");
				String movieName = rs.getString("movieName");
				String movieIntro = rs.getString("movieIntro");
				Date movieReleaseDate = rs.getDate("movieReleaseDate");
				int movieRunTime = rs.getInt("movieRunTime");
				String movieProduction = rs.getString("movieProduction");
				String movieDistributer = rs.getString("movieDistributer");
				String nation = rs.getString("nation");
				int movieAge = rs.getInt("movieAge");
				Movie_MovieInfoVo vo = new Movie_MovieInfoVo(movieNum, movieName, movieIntro, movieReleaseDate,
						movieRunTime, movieProduction, movieDistributer, nation, movieAge);
				list.add(vo);
			}
			return list;
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}

}
