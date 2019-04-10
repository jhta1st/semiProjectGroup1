package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.JDBCUtil;
import vo.Admin_CharInfoVo;
import vo.Admin_MovieGenreVo;
import vo.Movie_CastInfoVo;

public class Admin_CastInfoDao {
	public int castInfoWrite(Movie_CastInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into castInfo values(castinfo_seq.nextval,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getCharNum());
			pstmt.setInt(2, vo.getCastDoNum());
			pstmt.setString(3, vo.getCastDoName());
			pstmt.setInt(4, vo.getMovieNum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con,pstmt,null);
		}
	}
	public static Admin_CastInfoDao instance=new Admin_CastInfoDao();
	private Admin_CastInfoDao() {}
	public static Admin_CastInfoDao getInstance() {
		return instance;
	}
}
