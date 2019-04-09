<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/User/user_myPage.jsp</title>
</head>
<body>
<h1>인물상세</h1>
<hr>
<table border="1">
	<tr>
		<th>인물번호</th><th>인물명</th><th>인물사진</th>
	</tr>
		<tr>
			<td>${vo.charNum}</td>
			<td>${vo.charName }</td>
			<td>
			<img src="${cp }/Admin/AdminMoviePeopleImageUpload/${vo.charSavFileName }" style="width: 200px; height: 200px;">
			</td>
		</tr>
</table>
<br>
<hr>

<hr>
<a href="${pageContext.request.contextPath }/main/layout.jsp">홈으로</a>
</body>
</html>