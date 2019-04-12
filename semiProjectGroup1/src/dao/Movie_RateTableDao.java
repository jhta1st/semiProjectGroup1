package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JDBCUtil;
import vo.Movie_RateTableVo;

public class Movie_RateTableDao {
	private static Movie_RateTableDao instance = new Movie_RateTableDao();

	public static Movie_RateTableDao getInstance() {
		return instance;
	}

	private Movie_RateTableDao() {
	}

	public int insert(Movie_RateTableVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "INSERT INTO RATETABLE VALUES(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setDouble(1, vo.getRate());
			pstmt.setString(2, vo.getRateComm());
			pstmt.setString(3, vo.getUserId());
			pstmt.setInt(4, vo.getMovieNum());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, null);
		}
	}

	public ArrayList<HashMap<String, Object>> list(int movieNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT * FROM RATETABLE WHERE MOVIENUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("rate", rs.getDouble("rate"));
				map.put("rateComm", rs.getString("rateComm"));
				map.put("userId", rs.getString("userId"));
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

	public int delete(int movieNum, String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "DELETE FROM RATETABLE WHERE MOVIENUM=? AND USERID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);
			pstmt.setString(2, userId);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, null);
		}
	}

	public double rateAve(int movieNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT ROUND(AVG(RATE),2)  FROM RATETABLE GROUP BY MOVIENUM HAVING MOVIENUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getDouble(1);
			}
			return 0;
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
			return 0;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
}
