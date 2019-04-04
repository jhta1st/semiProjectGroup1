<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div>
		<h2>인기영화</h2>
		<div></div>
	</div>
	<c:forEach var="vo" items="list"></c:forEach>
	<div>
		<h2>${vo.genreName }</h2>
		<div></div>
	</div>
</div>