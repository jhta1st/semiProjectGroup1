<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Admin/admin_MoviePeopleList.jsp</title>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<h1>인물목록</h1>
<table border="1" width="600">
	<tr>
		<th>인물번호</th><th>인물명</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.charNum}</td>
			<td><a href="${cp }/admin/MoviePeopDetail.do?charNum=${vo.charNum}&field=${field}&keyword=${keyword}&pageNum=${pageNum }">${vo.charName}</a></td>
		</tr>
	</c:forEach>
</table>
<div>
	<c:choose>
		<c:when test="${startPage>10 }">
			<a href="${cp }/admin/MoviePeopleList.do?pageNum=${startPage-1}">[이전]</a>
		</c:when>
		<c:otherwise>
			[이전]
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
			<c:when test="${pageNum==i }">
				<a href="${cp }/admin/MoviePeopleList.do?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:pink">[${i }]</span></a>	
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/MoviePeopleList.do?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:#999">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${endPage<pageCount}">
			<a href="${cp }/admin/MoviePeopleList.do?pageNum=${endPage+1}">[다음]</a>
		</c:when>
		<c:otherwise>
			[다음]
		</c:otherwise>
	</c:choose>
</div>
<!-- 검색창 -->
<div>
	<form method="post" action="${cp }/admin/MoviePeopleList.do">
		<select name="field">
			<option value="charName"
			<c:if test="${field=='charName' }">
				selected='selected'
			</c:if>
			>인물명</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>	
</div>
</body>
</html>













