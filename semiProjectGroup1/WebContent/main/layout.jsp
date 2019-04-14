<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/main/layout.jsp</title>
<link rel="stylesheet" type="text/css" href="${cp }/CSS/mainCSS.css"/>
<link rel="stylesheet" type="text/css" href="${cp }/CSS/movieCSS.css"/>
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
</body>
</html>