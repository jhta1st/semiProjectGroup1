package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JDBCUtil;

public class Movie_ReviewImageDao {
	private static Movie_ReviewImageDao instance = new Movie_ReviewImageDao();

	public static Movie_ReviewImageDao getInstance() {
		return instance;
	}

	private Movie_ReviewImageDao() {
	}

	public ArrayList<HashMap<String, Object>> getImages(int movieNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT * FROM REVIEWIMAGE WHERE MOVIENUM=? ORDER BY IMAGETYPE";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("ImageSavName", rs.getString("ImageSavName"));
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
