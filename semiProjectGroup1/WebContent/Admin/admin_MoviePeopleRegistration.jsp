<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<form method="post" action="${pageContext.request.contextPath }/admin/moviePeopleRegistration.do" enctype="multipart/form-data">
	배우명<input type="text" id="charName" name="charName" /><br>
	이미지첨부파일<input type="file" name="file"><br/>
	<input type="submit" value="등록" /><input type="button" value="취소" onclick="javascript:history.go(-1);">
</form>
<div id="result">${errMsg }</div>
</body>