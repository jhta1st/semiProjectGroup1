package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import vo.User_UserInfoVo;

public class Admin_adminDao {
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = JDBCUtil.getConn();
			String sql = "SELECT NVL(MAX(USERID),0) MAXNUM FROM USERINFO";
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
			String sql = "SELECT NVL(COUNT(USERID),0) CNT FROM USERINFO ";
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

	
	public ArrayList<User_UserInfoVo> list(int startRow, int endRow, String field, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
	      if(field==null || field.equals("")) {
				sql="select * from(" 
				+ "    select AA.*, rownum rnum from" 
				+ "    (" 
				+ "    select * from UserInfo"
				+ "    order by USERJDATE desc" 
				+ "    )AA" 
				+ ")" 
				+ "where rnum>=? and rnum<=?";
	      }else {
	    	    sql="SELECT * FROM ( " +
					   "  SELECT AA.*,ROWNUM RNUM FROM ( " 
	    	    	+"	SELECT * FROM UserInfo WHERE " 
				    + field + " LIKE '%" + keyword +"%'"
	    	    	+" ORDER BY USERJDATE DESC" 
	    	    	+"   )AA " 
				    +")WHERE RNUM>=? AND RNUM<=?";
	      }
		try {
			con = JDBCUtil.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			ArrayList<User_UserInfoVo> list = new ArrayList<User_UserInfoVo>();
			while (rs.next()) {
				String userId=rs.getString("userId");
				String userPwd=rs.getString("userPwd");
				String userNickName=rs.getString("userNickName");
				int userLev = rs.getInt("userLev");
				int userExp = rs.getInt("userExp");
				Date userJdate=rs.getDate("userJdate");
				int userPower=rs.getInt("userPower");
				User_UserInfoVo vo = new User_UserInfoVo(userId, userPwd, userNickName, userLev, userExp, userJdate, userPower);
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
	public User_UserInfoVo detail(String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from UserInfo where userId=?";
		try {
			con = JDBCUtil.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userId=rs.getString("userId");
				String userPwd=rs.getString("userPwd");
				String userNickName=rs.getString("userNickName");
				int userLev = rs.getInt("userLev");
				int userExp = rs.getInt("userExp");
				Date userJdate=rs.getDate("userJdate");
				int userPower=rs.getInt("userPower");
				User_UserInfoVo vo = new User_UserInfoVo(userId, userPwd, userNickName, userLev, userExp, userJdate, userPower);
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
	
	public int update1(User_UserInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="UPDATE USERINFO SET USERPOWER=3 WHERE USERID=? AND USERPOWER=2";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,vo.getUserId());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt,null);
		}
	}
}