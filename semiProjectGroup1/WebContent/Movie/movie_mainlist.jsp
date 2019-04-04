<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div>
		<form method="get" action="${cp }/Movie/movielist.do">
			<label for="keyword">영화검색</label><input type="text" id="keyword" name="keyword"><input type="submit" value="검색">
			<br>
			<input type="radio" name="genreName" id="0" value="0" checked="checked"><label for="0">전체</label>
			<c:forEach var="vo" items="${genreNamelist }">
				<input type="radio" name="genreName" id="${vo.genreNum }" value="${vo.genreNum }">
				<label for="${vo.genreNum }">${vo.genreName }</label>
			</c:forEach>
		</form>
		<div>
			<h2>인기영화</h2>
			<div></div>
		</div>
		<c:forEach var="vo" items="${genreNamelist }">
			<div>
				<h2>${vo.genreName }</h2>
				<div></div>
			</div>
		</c:forEach>

	</div>
</div>