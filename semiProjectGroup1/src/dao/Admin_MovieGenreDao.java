package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.JDBCUtil;
import vo.Admin_CharInfoVo;
import vo.Admin_MovieGenreVo;

public class Admin_MovieGenreDao {
	public int movieGenreWrite(Admin_MovieGenreVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into movieGenre values(?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getGenreNum());
			pstmt.setInt(2, vo.getMovieNum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public static Admin_MovieGenreDao instance=new Admin_MovieGenreDao();
	private Admin_MovieGenreDao() {}
	public static Admin_MovieGenreDao getInstance() {
		return instance;
	}
}
