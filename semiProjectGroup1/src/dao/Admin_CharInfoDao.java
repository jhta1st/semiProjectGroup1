package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import vo.Admin_charInfoVo;
import vo.Movie_CharInfoVo;


public class Admin_CharInfoDao {
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT NVL(MAX(charnum),0) MAXNUM FROM charInfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int maxnum = rs.getInt(1);
			return maxnum;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}

	public int getCount(String field, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT NVL(COUNT(charnum),0) CNT FROM charInfo ";
			if(field!=null && !field.equals("")) {
				sql +="WHERE "+field + " LIKE '%" + keyword +"%'";
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			return cnt;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	
	public ArrayList<Movie_CharInfoVo> list(int startRow, int endRow, String field, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
	      if(field==null || field.equals("")) {
				sql="select * from(" 
				+ "    select AA.*, rownum rnum from" 
				+ "    (" 
				+ "    select * from charInfo"
				+ "    order by charNum desc" 
				+ "    )AA" 
				+ ")" 
				+ "where rnum>=? and rnum<=?";
	      }else {
	    	    sql="SELECT * FROM ( " +
					   "  SELECT AA.*,ROWNUM RNUM FROM ( " 
	    	    	+"	SELECT * FROM charInfo WHERE " 
				    + field + " LIKE '%" + keyword +"%'"
	    	    	+" ORDER BY charNum DESC" 
	    	    	+"   )AA " 
				    +")WHERE RNUM>=? AND RNUM<=?";
	      }
		try {
			con = JDBCUtil.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			ArrayList<Movie_CharInfoVo> list = new ArrayList<Movie_CharInfoVo>();
			while (rs.next()) {
				int charNum = rs.getInt("charNum");
				String charName=rs.getString("charName");
				String charOrgFileName=rs.getString("charOrgFileName");
				String charSavFileName=rs.getString("charSavFileName");
				Movie_CharInfoVo vo = new Movie_CharInfoVo(charNum, charName, charOrgFileName, charSavFileName);
				list.add(vo);
			}
			return list;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	
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
