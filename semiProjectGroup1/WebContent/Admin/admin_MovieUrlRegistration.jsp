<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<form method="post" action="${pageContext.request.contextPath }/admin/teamRegistration.do" enctype="multipart/form-data">
	영화명<input type="text" id="movieInfo" name="movieInfo" /><input type="button" value="검색" onclick=""><br>
	<label>URL유형
	<select name="urlType">
		<option value="1">예고편</option>
		<option value="2">하이라이트</option>
	</select></label><br>
	URL주소<textarea rows="5" cols="100%" id="urlAddr" name="urlAddr"></textarea><br>
	<input type="submit" value="등록" /><input type="reset" value="취소" />
</form>
</body>