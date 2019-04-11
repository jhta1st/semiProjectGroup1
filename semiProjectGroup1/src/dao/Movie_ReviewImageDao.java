package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JDBCUtil;
import vo.Admin_CharInfoVo;
import vo.Movie_ReviewImageVo;

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
				map.put("ImageNum", rs.getString("ImageNum"));
				map.put("ImageSavName", rs.getString("ImageSavName"));
				map.put("ImageType", rs.getInt("ImageType"));
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

	public int reviewImgWrite(Movie_ReviewImageVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "insert into reviewImage values(reviewimage_seq.nextval,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getImageType());
			pstmt.setString(2, vo.getImageOrgName());
			pstmt.setString(3, vo.getImageSavName());
			pstmt.setInt(4, vo.getMovieNum());
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, null);
		}
	}
	
	public int delete(int imageNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="delete from reviewImage where imageNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,imageNum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt,null);
		}
	}

	public int update(Movie_ReviewImageVo vo) {
		Connection con =null;
		PreparedStatement pstmt =null;
		try {
		con=JDBCUtil.getConn();
		String sql="update reviewImage set imageType=?,imageOrgName=?,imageSavName=? where imageNum=? and movieNum=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, vo.getImageType());
		pstmt.setString(2, vo.getImageOrgName());
		pstmt.setString(3, vo.getImageSavName());
		pstmt.setInt(4, vo.getImageNum());
		pstmt.setInt(4, vo.getMovieNum());
		return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt, null);
		}
	}
	
	public Movie_ReviewImageVo detail(int imageNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from reviewImage where imageNum=?";
		try {
			con = JDBCUtil.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, imageNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				imageNum=rs.getInt("imageNum");
				int imageType=rs.getInt("imageType");
				String imageOrgName=rs.getString("imageOrgName");
				String imageSavName=rs.getString("imageSavName");
				int movieNum=rs.getInt("movieNum");
				Movie_ReviewImageVo vo = new Movie_ReviewImageVo(imageNum, imageType, imageOrgName, imageSavName, movieNum);
				return vo;
			}
			return null;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
}
