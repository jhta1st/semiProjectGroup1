<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<ul>
		<li><a href="${cp }/main/home.do">홈</a></li>
		<li><a href="${cp }/Movie/movielist.do">영화정보</a></li>
		<li><a href="">자유게시판</a></li>
	</ul>
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
</div>