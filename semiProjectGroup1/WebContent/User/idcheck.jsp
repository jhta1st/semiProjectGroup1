<%@page import="db.JDBCUtil"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	JSONObject json=new JSONObject();
	try{
		con=JDBCUtil.getConn();
		String sql="select * from myuser where id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			json.put("msg", "사용중인 아이디입니다.");
		}else{
			json.put("msg", "사용이 가능한 아이디입니다.");
		}
	}catch(SQLException se){
		se.printStackTrace();
	}finally{
		JDBCUtil.close(con, pstmt, rs);
	}
	response.setContentType("text/plain;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.print(json.toString());
%>