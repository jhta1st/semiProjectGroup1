package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JDBCUtil;

public class Movie_CharInfoDao {
	private static Movie_CharInfoDao instance = new Movie_CharInfoDao();

	public static Movie_CharInfoDao getInstance() {
		return instance;
	}

	private Movie_CharInfoDao() {
	}

	public ArrayList<HashMap<String, Object>> getCharinfo(int movieNum) {
		// TODO 자동 생성된 메소드 스텁
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT CH.*,CAST.CASTNUM,CAST.CASTDONUM,CAST.CASTDONAME FROM CHARINFO CH,CASTINFO CAST "
					+ "WHERE CH.CHARNUM=CAST.CHARNUM AND CAST.MOVIENUM=? ORDER BY CAST.CASTDONUM";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("charNum", rs.getInt("charNum"));
				System.out.println(rs.getInt("charNum"));
				map.put("charName", rs.getString("charName"));
				map.put("charSavFileName", rs.getString("charSavFileName"));
				map.put("castNum", rs.getInt("castNum"));
				map.put("castDoNum", rs.getInt("castDoNum"));
				map.put("castDoName", rs.getString("castDoName"));
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
