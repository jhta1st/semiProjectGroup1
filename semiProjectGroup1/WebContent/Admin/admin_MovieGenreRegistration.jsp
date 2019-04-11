<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<form method="post" action="${cp }/admin/movieGenreRegistration.do">
		장르명<input type="text" id="genreName" name="genreName" /><br>
		<input type="submit" value="등록" /><input type="button" value="취소" onclick="javascript:history.go(-1);">
	</form>
	<div id="result">${errMsg }</div>
</div>