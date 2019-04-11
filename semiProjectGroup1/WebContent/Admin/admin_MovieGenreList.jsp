<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<h1>전체장르목록</h1>
	<table border="1">
		<tr>
			<th>장르번호</th>
			<th>장르명</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<c:forEach var="vo" items="${requestScope.list }">
			<tr>
				<td>${vo.genreNum }</td>
				<td>${vo.genreName }</td>
				<td>
					<a href="${pageContext.request.contextPath}/admin/movieGenreDelete.do?genreNum=${vo.genreNum}">삭제</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/admin/movieGenreUpdate.do?genreNum=${vo.genreNum}">수정</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<a href="${pageContext.request.contextPath }/main/layout.jsp">홈으로</a>
	<hr>
</div>
