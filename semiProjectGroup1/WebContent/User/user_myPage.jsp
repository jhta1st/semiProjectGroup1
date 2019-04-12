<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
<h1>마이페이지</h1>
<hr>
<table border="1">
	<tr>
		<th>회원아이디</th><th>비밀번호</th><th>닉네임</th><th>레벨</th><th>경험치</th>
		<th>가입일</th>
	</tr>
		<tr>
			<td>${vo.userId}</td>
			<td>${vo.userPwd }</td>
			<td>${vo.userNickName }</td>
			<td>${lev}</td>
			<td>${exp}</td>
			<td>${vo.userJdate }</td>	
		</tr>
</table>
<div>
	<div>
		<p>내가 좋아하는 영화</p>
		<c:forEach var="map" items="${list }">
			<p>map.get("moviName")</p>
		</c:forEach>
	</div>
</div>
<br>
<hr>
<a href="${pageContext.request.contextPath}/delete.do?userId=${vo.userId}">회원 탈퇴</a> |
<a href="${pageContext.request.contextPath}/update.do?userId=${vo.userId}">회원정보 수정</a>
<hr>
<a href="${pageContext.request.contextPath }/main/layout.jsp">홈으로</a>
</div>
