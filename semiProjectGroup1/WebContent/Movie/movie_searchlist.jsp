<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/JS/movie_listScript.js"></script>
<div>
	<div>
		<form method="get" action="${cp }/Movie/moviesearch.do">
			<label for="keyword">영화검색</label><input type="text" id="keyword" name="keyword" value="${keyword }"><input type="submit" value="검색">
			<br>
			<input type="checkbox" name="genreName" id="0" value="0" <c:if test="${genreNum[0]=='0' }"> checked="checked"</c:if> onclick="checkAll()"><label for="0">전체</label>
			<c:forEach var="vo" items="${genreNamelist }">
				<input type="checkbox" name="genreName" id="${vo.genreNum }" value="${vo.genreNum }" <c:forEach var="va" items="${genreNum }">
				<c:if test="${va==vo.genreNum }"> checked="checked"</c:if>
				</c:forEach> onclick="checkAllch()">
				<label for="${vo.genreNum }">${vo.genreName }</label>
			</c:forEach>
		</form>
	</div>
	<div>
		<h2>${keyword }의검색결과(${resultCount }건 검색됨)</h2>
		<c:forEach var="result" items="${serchList }">
			<div>
				<div>
					<a href="${cp }/Movie/review.do?movieNum=${result.get('movieNum')}&keyword=${keyword}${search}"><img alt="이미지" src="${cp }/Movie/images/photo/${result.imageSavName}"></a>
					<br>
					<a href="${cp }/Movie/review.do?movieNum=${result.get('movieNum')}&keyword=${keyword}${search}">${result.movieName }</a>
				</div>
			</div>
		</c:forEach>
		<div>
			<c:if test="${startPage>10 }">
				<a href="${cp }/Movie/moviesearch.do?pageNum=${startPage-1 }&keyword=${keyword}${search}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${pageNum==i }">[${i }]</c:when>
					<c:otherwise>
						<a href="${cp }/board/list.do?pageNum=${i}&keyword=${keyword}${search}">[${i }]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${endPage<pageCount }">
				<a href="${cp }/board/list.do?pageNum=${endPage+1}&keyword=${keyword}${search}">[다음]</a>
			</c:if>
		</div>
	</div>
</div>