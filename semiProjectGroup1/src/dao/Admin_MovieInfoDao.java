package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JDBCUtil;
import vo.Admin_CharInfoVo;
import vo.Admin_MovieInfoVo;

public class Admin_MovieInfoDao {
	public int movieInfoWrite(Admin_MovieInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into movieInfo values(movieinfo_SEQ.nextval,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getMovieName());
			pstmt.setString(2, vo.getMovieIntro());
			pstmt.setString(3, vo.getMovieReleaseDate());
			pstmt.setInt(4, vo.getMovieRunTime());
			pstmt.setString(5, vo.getMovieProduction());
			pstmt.setString(6, vo.getMovieDistributer());
			pstmt.setString(7, vo.getNation());
			pstmt.setInt(8, vo.getMovieAge());
			pstmt.executeUpdate();
			String sql2="select movieinfo_SEQ.currval as movieNum from dual";
			pstmt2=con.prepareStatement(sql2);
			rs=pstmt2.executeQuery();
			if(rs.next()) {
				int movieNum=rs.getInt("movieNum");
				return movieNum;
			}
			return -1;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(null,pstmt2,null);
			JDBCUtil.close(con,pstmt,rs);
		}
	}
	public static Admin_MovieInfoDao instance=new Admin_MovieInfoDao();
	private Admin_MovieInfoDao() {}
	public static Admin_MovieInfoDao getInstance() {
		return instance;
	}
}
