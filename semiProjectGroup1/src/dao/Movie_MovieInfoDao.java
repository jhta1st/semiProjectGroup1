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

public class Movie_MovieInfoDao {
	private static Movie_MovieInfoDao instance = new Movie_MovieInfoDao();

	public static Movie_MovieInfoDao getInstance() {
		return instance;
	}

	private Movie_MovieInfoDao() {
	}

	public ArrayList<HashMap<String, Object>> getSearchList(String keyword, String[] genreNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT * FROM (SELECT AA.*,ROWNUM RNUM FROM ("
				+ "SELECT M.*,R.IMAGENUM,R.IMAGETYPE,R.IMAGESAVNAME,R.MOVIENUM MNUM "
				+ "FROM MOVIE_VIEW M,REVIEWIMAGE R "
				+ "WHERE M.MOVIENUM=R.MOVIENUM AND M.MOVIENAME LIKE '%'|| ? ||'%' AND R.IMAGETYPE=1 "
				+ "ORDER BY M.MOVIENUM DESC)AA ";
		try {
			con = JDBCUtil.getConn();
			if (genreNum != null && Integer.parseInt(genreNum[0]) != 0) {
				sql = sql.concat("WHERE ");
				for (int i = 0; i < genreNum.length; i++) {
					sql = sql.concat("GENRENUM=" + genreNum[i]);
					if (genreNum.length - 1 != i) {
						sql = sql.concat(" OR ");
					}
				}
			}
			sql = sql.concat(") WHERE RNUM<=20");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int movieNum = rs.getInt("movieNum");
				String movieName = rs.getString("movieName");
				String genreName = rs.getString("genreName");
				int imageNum = rs.getInt("imageNum");
				String imageSavName = rs.getString("imageSavName");
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("movieNum", movieNum);
				map.put("movieName", movieName);
				map.put("genreName", genreName);
				map.put("imageNum", imageNum);
				map.put("imageSavName", imageSavName);
				list.add(map);
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

	public ArrayList<ArrayList<HashMap<String, Object>>> getMovieList(ArrayList<Movie_GenreVo> genreNamelist) {
		Connection con = null;
		PreparedStatement[] pstmt = new PreparedStatement[genreNamelist.size()];
		ResultSet rs = null;
		ArrayList<ArrayList<HashMap<String, Object>>> setList = new ArrayList<ArrayList<HashMap<String, Object>>>();
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT * FROM (SELECT AA.*,ROWNUM RNUM FROM ("
					+ "SELECT M.*,R.IMAGENUM,R.IMAGETYPE,R.IMAGESAVNAME,R.MOVIENUM MNUM "
					+ "FROM MOVIE_VIEW M,REVIEWIMAGE R " + "WHERE M.MOVIENUM=R.MOVIENUM AND M.GENRENUM=? "
					+ "ORDER BY M.MOVIENUM DESC)AA" + ") WHERE RNUM<=20";
			for (int i = 0; i < genreNamelist.size(); i++) {
				pstmt[i] = con.prepareStatement(sql);
				pstmt[i].setInt(1, genreNamelist.get(i).getGenreNum());
				rs = pstmt[i].executeQuery();
				ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
				while (rs.next()) {
					int movieNum = rs.getInt("movieNum");
					String movieName = rs.getString("movieName");
					String genreName = rs.getString("genreName");
					int imageNum = rs.getInt("imageNum");
					String imageSavName = rs.getString("imageSavName");
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("movieNum", movieNum);
					map.put("movieName", movieName);
					map.put("genreName", genreName);
					map.put("imageNum", imageNum);
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
			for (int i = 0; i < genreNamelist.size(); i++) {
				JDBCUtil.close(pstmt[i]);
			}
			JDBCUtil.close(con);
		}
	}

}
