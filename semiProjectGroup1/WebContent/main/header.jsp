<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<ul>
		<li><a href="${cp }/main/home.do">홈</a></li>
		<li><a href="${cp }/Movie/movielist.do">영화정보</a></li>
		<li><a href="">영화추천</a></li>
		<li><a href="${cp }/FreeBoard/list.do">자유게시판</a></li>
	</ul>
	<div>
		<!-- 로그인 유무 -->
		<c:choose>
			<c:when test="${sessionScope.id==null }">
				<a href="${cp }/main/login.do">로그인</a>
				<a href="${cp }/user/registration.do">회원가입</a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/main/login.do">로그아웃</a>
				<a href="${cp }/user/detail.do?userId=${id}">마이페이지</a>
				<a href="${cp }/user/myMsgList.do?userId=${id}">쪽지</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>