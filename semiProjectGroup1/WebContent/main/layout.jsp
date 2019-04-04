<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/main/layout.jsp</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/main/header.jsp" />
		</div>
		<div id="content">
			<jsp:include page="${pages }" />
		</div>
		<div id="footer">
			<jsp:include page="/main/footer.jsp" />
		</div>
	</div>
	<div>
	<!-- 로그인 유무 -->
		<c:choose>
			<c:when test="">
				<a href="">로그인</a>
			</c:when>
			<c:otherwise>
				<a href="">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>