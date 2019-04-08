<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div>
		<c:forEach var="map" items="${movieInfolist }" varStatus="st">
			<c:if test="${st.index==0 }">
				<img alt="대표이미지" src="${cp }/Movie/images/${map.imageSavName}">
				<h3>${map.movieName }</h3>
			</c:if>
			<div>${map.genreName }</div>
			<c:if test="${map.index==0 }">
				<div>${map.movieAge }</div>
				<div>${map.rate }</div>
			</c:if>
		</c:forEach>
		<%-- <h3>test1</h3>
		<div>드라마</div>
		<div>15</div>
		<div>4.1</div>
		<div>--%>
		<input type="button" value="좋아요">
	</div>
	<div>
		<ul>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=info">소개</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=crew">제작진</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=actor">출연배우</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=photo">스틸샷</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=vedio">예고편</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=rate">평점</a></li>
		</ul>
	</div>
	<c:forEach var="map" items="${movieInfolist }" varStatus="st">
		<div>
			<c:choose>
				<c:when test="${detail eq info&&st.index eq 0 }">${map.movieIntro}</c:when>
				<c:when test="${detail eq crew }">${detail }</c:when>
				<c:when test="${detail eq actor }">${detail }</c:when>
				<c:when test="${detail eq photo }">${detail }</c:when>
				<c:when test="${detail eq vedio }">${detail }</c:when>
				<c:when test="${detail eq rate }">${detail }</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</div>
	</c:forEach>
</div>