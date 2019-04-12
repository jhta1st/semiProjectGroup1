<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.User_UserInfoVo"%>
<%@page import="dao.User_UserInfoDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>회원 정보 수정</h1>
<form method="post" action="${pageContext.request.contextPath }/user/update.do?userId=${vo.userId }">
	<input type="hidden" name="userId" value="${vo.userId }"> <label for="userId">아이디</label><input type="text" id="userId" value="${vo.userId }" disabled="disabled">
	<br>
	<label for="userPwd">비밀번호</label> <input type="text" name="userPwd" id="userPwd" value="${vo.userPwd}">
	<br>
	<label for="userNickName">닉네임</label> <input type="text" name="userNickName" id="userNickName" value="${vo.userNickName }">
	<br>
	<input type="submit" value="수정">
</form>