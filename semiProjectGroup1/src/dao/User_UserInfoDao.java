package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JDBCUtil;
import vo.User_UserInfoVo;

public class User_UserInfoDao {
	public int lvCalc(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		ResultSet rs2=null;
		HashMap<String, Integer> list=new HashMap<String, Integer>();
		try {
			con=JDBCUtil.getConn();
			String sql="select nvl(count(userid),0) from freeboard where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			int write=0;
			if(rs.next()) {
				write=rs.getInt(1);
				list.put("write", write);
			}
			String sql2="select nvl(count(userid),0) from freeboardComm where userId=?";
			pstmt2=con.prepareStatement(sql2);
			pstmt2.setString(1, userId);
			rs2=pstmt2.executeQuery();
			int comm=0;
			if(rs2.next()) {
				comm=rs2.getInt(1);
				list.put("comm", comm);
			}
			int writeExp=(list.get("write")*5);
			int commExp=(list.get("comm")*3);
			int exp=writeExp+commExp;
			return exp;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt2,rs2);
			JDBCUtil.close(con, pstmt,rs);
		}
	}
	public int ExpCalc(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt3=null;
		ResultSet rs=null;
		ResultSet rs2=null;
		HashMap<String, Integer> list=new HashMap<String, Integer>();
		try {
			con=JDBCUtil.getConn();
			String sql="select nvl(count(userid),0) from freeboard where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			int write=0;
			if(rs.next()) {
				write=rs.getInt(1);
				list.put("write", write);
			}
			String sql2="select nvl(count(userid),0) from freeboardComm where userId=?";
			pstmt2=con.prepareStatement(sql2);
			pstmt2.setString(1, userId);
			rs2=pstmt2.executeQuery();
			int comm=0;
			if(rs2.next()) {
				comm=rs2.getInt(1);
				list.put("comm", comm);
			}
			int writeExp=(list.get("write")*5);
			int commExp=(list.get("comm")*3);
			int exp=writeExp+commExp;
			String sql3="update userinfo set userExp=? where userId=?";
			pstmt3=con.prepareStatement(sql3);
			pstmt3.setInt(1, exp);
			pstmt3.setString(2, userId);
			pstmt3.executeUpdate();
			return exp;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt3,null);
			JDBCUtil.close(null, pstmt2,rs2);
			JDBCUtil.close(con, pstmt,rs);
		}
	}
	//회원가입
	public int insert(User_UserInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="INSERT INTO USERINFO VALUES(?,?,?,1,0,sysdate,2)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,vo.getUserId());
			pstmt.setString(2, vo.getUserPwd());
			pstmt.setString(3,vo.getUserNickName());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt,null);
		}
	}
	
	//회원리스트
	public ArrayList<User_UserInfoVo> listAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<User_UserInfoVo> list=new ArrayList<User_UserInfoVo>();
		try {
			con=JDBCUtil.getConn();
			String sql="SELECT * FROM USERINFO";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String userId=rs.getString("userId");
				String userPwd=rs.getString("userPwd");
				String userNickName=rs.getString("userNickName");
				int userLev = rs.getInt("userLev");
				int userExp = rs.getInt("userExp");
				Date userJdate=rs.getDate("userJdate");
				int userPower=rs.getInt("userPower");
				User_UserInfoVo vo=new User_UserInfoVo(userId, userPwd, userNickName, userLev, userExp, userJdate, userPower);
				list.add(vo);
			}
			return list;		
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JDBCUtil.close(con, pstmt, rs);
		}		
	}
	
	//마이페이지
	public User_UserInfoVo detail(String userId){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="SELECT * FROM USERINFO WHERE USERID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				userId=rs.getString("userId");
				String userPwd=rs.getString("userPwd");
				String userNickName=rs.getString("userNickName");
				int userLev = rs.getInt("userLev");
				int userExp = rs.getInt("userExp");
				Date userJdate=rs.getDate("userJdate");
				int userPower=rs.getInt("userPower");
				User_UserInfoVo vo=new User_UserInfoVo(userId, userPwd, userNickName, userLev, userExp, userJdate, userPower);
				return vo;
			}
			return null;	
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	
	//회원삭제
	public int update1(User_UserInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="UPDATE USERINFO SET USERPOWER=3 WHERE USERID=? AND USERPWD=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,vo.getUserId());
			pstmt.setString(2,vo.getUserPwd());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt,null);
		}
	}
	
	//회원정보 수정(이것도 생각을 좀더 ...일단 기본 수정 쿼리문을 작성!)
	public int update(User_UserInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="UPDATE USERINFO SET USERPWD=?,USERNICKNAME=? WHERE USERID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,vo.getUserPwd());
			pstmt.setString(2, vo.getUserNickName());
			pstmt.setString(3,vo.getUserId());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt,null);
		}
	}
}
