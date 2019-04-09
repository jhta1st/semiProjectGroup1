package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.JDBCUtil;
import vo.Admin_charInfoVo;

public class Admin_CharInfoDao {
	public int charWrite(Admin_charInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into charInfo values(charinfo_SEQ.nextval,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getCharName());
			pstmt.setString(2, vo.getCharOrgFileName());
			pstmt.setString(3, vo.getCharSavFileName());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public static Admin_CharInfoDao instance=new Admin_CharInfoDao();
	private Admin_CharInfoDao() {}
	public static Admin_CharInfoDao getInstance() {
		return instance;
	}
}
