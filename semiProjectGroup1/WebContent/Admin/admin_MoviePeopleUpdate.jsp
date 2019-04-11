<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.User_UserInfoVo"%>
<%@page import="dao.User_UserInfoDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Admin/admin_MoviePeopleUpdate.jsp</title>
</head>
<body>
<h1>인물정보 수정</h1>
<form method="post" action="${pageContext.request.contextPath }/admin/MoviePeopleUpdate.do?charNum=${vo.charNum }" enctype="multipart/form-data">
	<input type="hidden" name="charNum" value="${vo.charNum }">
	인물번호 <input type="text" id="charNum"  value="${vo.charNum }" disabled="disabled"><br>
	인물명 <input type="text" id="charName" name="charName" value="${vo.charName }"><br>
	기존파일 <input type="text" disabled="disabled" id="charOrgFileName" value="${ vo.charOrgFileName}"><br>
	수정할파일 <input type="file" name="file2"><br>
	<input type="submit" value="수정">
</form>
</body>
</html>