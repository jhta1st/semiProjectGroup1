<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.User_UserInfoVo"%>
<%@page import="dao.User_UserInfoDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/User/user_update.jsp</title>
</head>
<body>
<h1>장르 정보 수정</h1>
<form method="post" action="${pageContext.request.contextPath }/admin/movieGenreUpdate.do?genreNum=${vo.genreNum }">
	<input type="hidden" name="genreNum" value="${vo.genreNum }">
	<label for="genreNum">장르번호</label><input type="text" id="genreNum" value="${vo.genreNum }" disabled="disabled"><br>
	<label for="genreName">장르명</label>
	<input type="text" name="genreName" id="genreName" value="${vo.genreName}"><br>
	<input type="submit" value="수정">
</form>
</body>
</html>