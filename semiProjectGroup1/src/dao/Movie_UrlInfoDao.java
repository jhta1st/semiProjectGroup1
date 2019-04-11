package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JDBCUtil;
import oracle.net.aso.p;
import vo.Movie_UrlInfoVo;

public class Movie_UrlInfoDao {
	private static Movie_UrlInfoDao instance = new Movie_UrlInfoDao();

	public static Movie_UrlInfoDao getInstance() {
		return instance;
	}

	private Movie_UrlInfoDao() {
	}

	public ArrayList<HashMap<String, Object>> getVedioUrl(int movieNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT * FROM URLINFO WHERE MOVIENUM=? ORDER BY URLTYPE";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("urlNum", rs.getInt("urlNum"));
				map.put("urlType", rs.getInt("urlType"));
				map.put("urlAddr", rs.getString("urlAddr"));
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

	public int urlInfoWrite(Movie_UrlInfoVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "insert into urlInfo values(urlinfo_seq.nextval,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getUrlType());
			pstmt.setString(2, vo.getUrlAddr());
			pstmt.setInt(3, vo.getMovieNum());
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, null);
		}
	}

	public int urlInfoUpdate(Movie_UrlInfoVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "UPDATE URLINFO SET urlType=?,urlAddr=? where urlNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getUrlType());
			pstmt.setString(2, vo.getUrlAddr());
			pstmt.setInt(3, vo.getUrlNum());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, null);
		}
	}

	public int urlInfoDelete(int urlNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "DELETE FROM URLINFO WHERE URLNUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, urlNum);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, null);
		}
	}

	public Movie_UrlInfoVo getVedioInfo(int urlNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Movie_UrlInfoVo vo = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT * FROM URLINFO WHERE URLNUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, urlNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new Movie_UrlInfoVo(urlNum, rs.getInt("urlType"), rs.getString("urlAddr"), rs.getInt("movieNum"));
				return vo;
			}
			return null;
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
}
