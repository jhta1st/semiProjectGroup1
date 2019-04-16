package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JDBCUtil;

public class LoginDao {
	private static LoginDao instance = new LoginDao();

	private LoginDao() {
	}

	public static LoginDao getInstance() {
		return instance;
	}

	public boolean isMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT * FROM USERINFO WHERE USERID=? AND USERPWD=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt("UserPower") != 3) {
					return true;
				}
			}
			return false;
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}

	public int getUserPower(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT * FROM USERINFO WHERE USERID=? AND USERPWD=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("UserPower");
			}
			return -1;
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
}
