<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<form method="post" action="${pageContext.request.contextPath }/admin/teamRegistration.do" enctype="multipart/form-data">
	영화명<input type="text" id="movieInfo" name="movieInfo" /><input type="button" value="검색" onclick=""><br>
	인물명<input type="text" id="charName" name="charName" /><input type="button" value="검색" onclick=""><br>
	<label>역할
	<select name="castDoNum">
		<option value="1">주연</option>
		<option value="2">조연</option>
		<option value="3">엑스트라</option>
		<option value="4">카메오</option>
		<option value="11">감독</option>
		<option value="12">조감독</option>
		<option value="13">각본</option>
		<option value="14">음악</option>
		<option value="15">미술</option>
		<option value="16">소품</option>
		<option value="17">촬영</option>
	</select></label><br>
	캐릭터이름<input type="text" id="castDoName" name="castDoName" /><br>
	<input type="submit" value="등록" /><input type="reset" value="취소" />
</form>
</body>