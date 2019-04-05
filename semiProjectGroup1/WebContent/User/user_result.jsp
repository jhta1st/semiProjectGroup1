<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/User/user_result.jsp</title>
</head>
<body>
	<c:choose>
		<c:when test="${code=='success' }">
			<h1>요청하신 작업을 성공적으로 수행했습니다.</h1>
		</c:when>
		<c:otherwise>
			<h1>요청하신 작업을 오류로 인해 수행하지 못하였습니다.</h1>
		</c:otherwise>
	</c:choose>
	<a href="${pageContext.request.contextPath }/main/home.do">홈으로</a>
</body>
</html>