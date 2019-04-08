package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JDBCUtil;

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
}
