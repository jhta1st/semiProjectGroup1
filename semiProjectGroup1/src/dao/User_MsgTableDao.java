package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import vo.User_MsgTableVo;

public class User_MsgTableDao {
	
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "select NVL(MAX(MSGNUM), 0) from MSGTABLE";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int max = rs.getInt(1);
			return max;
		}catch(SQLException se){
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	
	public int getCount(String msgType, String userId, String field, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "select NVL(COUNT(MSGNUM),0) COUNT from MSGTABLE";
			sql += " where "+msgType+"USERID='"+userId+"'";
			//sql += " and DELETEUSERID not like '%"+userId+"%'";
			if(field!=null && !field.equals("")) {//�˻������� �ִ� ���
				sql +=" and "+field + " like '%" + keyword +"%'";
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	
	public ArrayList<User_MsgTableVo> getList(String msgType, String userId, int startRow, int endRow,String field, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		try {
			con = JDBCUtil.getConn();
			sql += "select * from (";
			sql += " select AA.*, ROWNUM RNUM from (";
			sql += "  select * from MSGTABLE";
			sql += "   where "+msgType+"USERID='"+userId+"'";
			//sql += " and DELETEUSERID not like '%"+userId+"%'";
			if(field!=null && !field.equals("")) {//�˻������� �ִ� ���
				sql +=" and "+field + " like '%" + keyword +"%'";
			}
			sql += " order by MSGWDATE desc) AA";
			sql += ") where RNUM>=? and RNUM<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			ArrayList<User_MsgTableVo> list = new ArrayList<User_MsgTableVo>();
			while (rs.next()) {
				User_MsgTableVo vo = new User_MsgTableVo();
				vo.setMsgNum(rs.getInt("MSGNUM"));
				vo.setMsgContent(rs.getString("MSGCONTENT"));
				vo.setReceiveUserId(rs.getString("RECEIVEUSERID"));
				vo.setSendUserId(rs.getString("SENDUSERID"));
				vo.setMsgWdate(rs.getDate("MSGWDATE"));
				vo.setMsgCheck(rs.getInt("MSGCHECK"));
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
	
	public User_MsgTableVo detail(int msgNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MSGTABLE WHERE MSGNUM=?";
		try {
			con = JDBCUtil.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, msgNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				User_MsgTableVo vo = new User_MsgTableVo();
				vo.setMsgNum(rs.getInt("MSGNUM"));
				vo.setMsgContent(rs.getString("MSGCONTENT"));
				vo.setReceiveUserId(rs.getString("RECEIVEUSERID"));
				vo.setSendUserId(rs.getString("SENDUSERID"));
				vo.setMsgWdate(rs.getDate("MSGWDATE"));
				vo.setMsgCheck(rs.getInt("MSGCHECK"));
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
	
	public int updateMsgCheck(int msgNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="update MSGTABLE set MSGCHECK=1 where MSGNUM=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,msgNum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt,null);
		}
	}
	
	public int updateDeleteUser(int msgNum, String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="update MSGTABLE set DELETEUSERID=CONCAT(DELETEUSERID,?) where MSGNUM=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId+"|");
			pstmt.setInt(2,msgNum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt,null);
		}
	}
	
	//���� �ۼ�
	public int insert(User_MsgTableVo vo) {
		Connection con=null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into MSGTABLE values(MsgTable_SEQ.nextval,?,?,?,sysdate,0)";
			pstmt2=con.prepareStatement(sql);
			pstmt2.setString(1,vo.getMsgContent());
			pstmt2.setString(2,vo.getReceiveUserId());
			pstmt2.setString(3,vo.getSendUserId());
			return pstmt2.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(pstmt1);
			JDBCUtil.close(con, pstmt2,null);
		}
	}
	
	public int delete(int msgNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="delete from MSGTABLE where where MSGNUM=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,msgNum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt,null);
		}
	}
}
