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

	public ArrayList<HashMap<String, Object>> getSearchList(String keyword, String[] genreNum, int startRow,
			int endRow) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT DISTINCT(MOVIENUM),MOVIENAME,IMAGESAVNAME FROM (SELECT AA.*,ROWNUM RNUM FROM ("
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
			sql = sql.concat(") WHERE RNUM>=? AND RNUM<=?");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int movieNum = rs.getInt("movieNum");
				String movieName = rs.getString("movieName");
				String imageSavName = rs.getString("imageSavName");
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("movieNum", movieNum);
				map.put("movieName", movieName);
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

	public ArrayList<HashMap<String, Object>> getInfo(int movieNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT M.*,R.IMAGENUM,R.IMAGETYPE,R.IMAGESAVNAME,R.MOVIENUM MNUM "
					+ "FROM MOVIE_VIEW M,REVIEWIMAGE R WHERE M.MOVIENUM=R.MOVIENUM AND M.MOVIENUM=? AND R.IMAGETYPE=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String movieName = rs.getString("movieName");
				String movieIntro = rs.getString("movieIntro");
				Date movieReleaseDate = rs.getDate("movieReleaseDate");
				int movieRunTime = rs.getInt("movieRunTime");
				String movieProduction = rs.getString("movieProduction");
				String movieDistributer = rs.getString("movieDistributer");
				String nation = rs.getString("nation");
				int movieAge = rs.getInt("movieAge");
				String genreName = rs.getString("genreName");
				int imageNum = rs.getInt("imageNum");
				String imageSavName = rs.getString("imageSavName");
				HashMap<String, Object> map = new HashMap<String, Object>();

				map.put("movieNum", movieNum);
				map.put("movieName", movieName);
				map.put("movieIntro", movieIntro);
				map.put("movieReleaseDate", movieReleaseDate);
				map.put("movieRunTime", movieRunTime);
				map.put("movieProduction", movieProduction);
				map.put("movieDistributer", movieDistributer);
				map.put("nation", nation);
				map.put("movieAge", movieAge);
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

	public int getCountNum(String keyword, String[] genreNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT NVL(*),0) FROM MOVIE_VIEW M,REVIEWIMAGE R "
					+ "WHERE M.MOVIENUM=R.MOVIENUM AND M.MOVIENAME LIKE '%'|| ? ||'%' AND R.IMAGETYPE=1";
			if (genreNum != null && Integer.parseInt(genreNum[0]) != 0) {
				sql = sql.concat(" OR ");
				for (int i = 0; i < genreNum.length; i++) {
					sql = sql.concat("GENRENUM=" + genreNum[i]);
					if (genreNum.length - 1 != i) {
						sql = sql.concat(" OR ");
					}
				}
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}

}
