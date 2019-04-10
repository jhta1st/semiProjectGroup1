<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<th>영화번호</th>
			<th>영화제목</th>
			<th>영화소개</th>
			<th>개봉일자</th>
			<th>상영시간</th>
			<th>제작사</th>
			<th>배급사</th>
			<th>국가</th>
			<th>관람나이</th>
			<th>장르명</th>
		</tr>
		<tr>
			<td>${vo.movieNum}</td>
			<td>${vo.movieName }</td>
			<td>${vo.movieIntro}</td>
			<td>${vo.movieReleaseDate }</td>
			<td>${vo.movieRunTime}</td>
			<td>${vo.movieProduction }</td>
			<td>${vo.movieDistributer}</td>
			<td>${vo.nation }</td>
			<td>
				<c:choose>
					<c:when test="${vo.movieAge==0 }">
						전체 관람가
					</c:when>
					<c:when test="${vo.movieAge==1 }">
						12세 관람가
					</c:when>
					<c:when test="${vo.movieAge==2 }">
						15세 관람가
					</c:when>
					<c:when test="${vo.movieAge==3 }">
						청소년관람불가
					</c:when>
					<c:when test="${vo.movieAge==4 }">
						제한상영가
					</c:when>
				</c:choose>
			</td>
			<td>${vo.genreName}</td>
		</tr>
	</table>
	<br>
	<hr>
	<a href="${pageContext.request.contextPath }/admin/MovieViewDelete.do">삭제</a>
	<hr>
	<a href="${cp }/admin/MovieInfoUpdate.do?movieNum=${movieNum }">영화정보수정</a><br>
	<a href="${pageContext.request.contextPath }/admin/MovieInfoList.do">영화정보리스트로</a>
</body>
</html>