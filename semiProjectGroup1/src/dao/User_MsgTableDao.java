package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONObject;

import db.JDBCUtil;
import vo.User_MsgTableVo;

public class User_MsgTableDao {
	
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "select NVL(max(msgNum), 0) from MsgTable";
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
	public int getCnt(String[] field, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "select NVL(count(msgNum), 0) from MsgTable ";
			if(field != null && keyword != null) {
				for(int i = 0 ; i < field.length ; i++) {
					if(field[i] != null && !field[i].equals("")) {
						if(i == 0) {
							sql += "where ";
						}else{
							sql += "or ";
						}
						sql += field[i] + " like '%" + keyword + "%' ";
					}
				}
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			return cnt;
		}catch(SQLException se){
			se.printStackTrace();
			return -1;
		}finally {
			JDBCUtil.close(con, pstmt, rs);
		}
	}
	
	//쪽지 작성
	
	
	
	
		public int insert(User_MsgTableVo vo) {
			Connection con=null;
			PreparedStatement pstmt1=null;
			PreparedStatement pstmt2=null;
			ResultSet rs=null;
			JSONObject json=new JSONObject();
			String receiveUserId=request.getParameter("userId");
			try {
				con=JDBCUtil.getConn();
				String sql="INSERT INTO MsgTable VALUES(MsgTable_SEQ,?,?,?,sysdate,1)";
				pstmt2=con.prepareStatement(sql);
				pstmt2.setString(1,vo.getMsgContent());
				pstmt2.setString(2,vo.getSendUserId());
				pstmt2.setString(3, vo.getReceiveUserId());
				return pstmt2.executeUpdate();
			}catch(SQLException se) {
				se.printStackTrace();
				return -1;
			}finally {
				JDBCUtil.close(pstmt1);
				JDBCUtil.close(con, pstmt2,null);
			}
		}
}
