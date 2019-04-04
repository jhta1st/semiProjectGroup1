package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import vo.User_UserInfoVo;

public class User_UserInfoDao {
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
	
	//회원삭제(이건 좀더 생각을 일단 기본 삭제 쿼리만 작성!)
	public int delete(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="DELETE FROM USERINFO WHERE USERID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
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
