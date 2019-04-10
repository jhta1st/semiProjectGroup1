<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Admin/admin_MovieInfoDetail.jsp</title>
</head>
<body>
<h1>영화정보상세</h1>
<hr>
<table border="1">
	<tr>
		<th>영화번호</th><th>영화제목</th><th>영화소개</th><th>개봉일자</th><th>상영시간</th>
		<th>제작사</th><th>배급사</th><th>국가</th><th>관람나이</th>
		<th>장르번호</th><th>장르명</th>
	</tr>
	<c:forEach var="list" items="${vo }">
		<tr>
			<td>${list.movieNum}</td>
			<td>${list.movieName }</td>
			<td>${list.movieIntro}</td>
			<td>${list.movieReleaseDate }</td>
			<td>${list.movieRunTime}</td>
			<td>${list.movieProduction }</td>
			<td>${list.movieDistributer}</td>
			<td>${list.nation }</td>
			<td>${list.movieAge}</td>
			<td>${list.genreNum }</td>
			<td>${list.genreName}</td>
		</tr>
		</c:forEach>
</table>
<br>
<hr>
<hr>
<a href="${cp }/admin/MovieInfoUpdate.do?movieNum="+${movieNum }>영화정보수정</a><br>
<a href="${pageContext.request.contextPath }/admin/MovieInfoList.do">영화정보리스트로</a>
</body>
</html>