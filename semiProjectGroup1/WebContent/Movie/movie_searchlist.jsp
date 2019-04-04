<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/JS/movie_listScript.js"></script>
<div>
	<div>
		<form method="get" action="${cp }/Movie/moviesearch.do">
			<label for="keyword">영화검색</label><input type="text" id="keyword" name="keyword"><input type="submit" value="검색">
			<br>
			<input type="checkbox" name="genreName" id="0" value="0" <c:if test="${genreNum[0]=='0' }"> checked="checked"</c:if> onclick="checkAll()"><label for="0">전체</label>
			<c:forEach var="vo" items="${genreNamelist }">
				<input type="checkbox" name="genreName" id="${vo.genreNum }" value="${vo.genreNum }" 
				<c:forEach var="va" items="${genreNum }"><c:if test="${va==vo.genreNum }"> checked="checked"</c:if></c:forEach> onclick="checkAllch()">

				<label for="${vo.genreNum }">${vo.genreName }</label>
			</c:forEach>
		</form>
	</div>
	<div>
		<h2>${keyword }의검색결과</h2>
		<div></div>
	</div>
</div>