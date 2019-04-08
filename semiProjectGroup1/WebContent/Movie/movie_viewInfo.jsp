<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div>
		<c:forEach var="map" items="${movieInfolist }" varStatus="st">
			<c:if test="${st.index==0 }">
				<img alt="대표이미지" src="${cp }/Movie/images/photo/${map.imageSavName}">
				<h3>${map.movieName }</h3>
			</c:if>
			<div>${map.genreName }</div>
			<c:if test="${st.index==0 }">
				<div>${map.movieAge }</div>
				<div>${map.rate }</div>
			</c:if>
		</c:forEach>
		<input type="button" value="좋아요">
	</div>
	<div>
		<ul>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=info">소개</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=crew">제작진/출연진</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=photo">스틸샷</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=vedio">예고편</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=rate">평점</a></li>
		</ul>
	</div>
	<c:set var="tmp" value="1" />
	<c:forEach var="map" items="${movieotherList }" varStatus="st">
		<div>
			<c:choose>
				<c:when test="${detail eq 'info' && st.index eq 0 }">${map.get('movieIntro')}</c:when>
				<c:when test="${detail eq 'crew' }">
					<c:choose>
						<c:when test="${map.get('castDoNum')== 1}">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>주연</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div>
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
									<div>배역:${map.castDoName }</div>
								</div>
							</div>
						</c:when>
						<c:when test="${map.get('castDoNum') == 2}">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>조연</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div>
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
									<div>배역:${map.castDoName }</div>
								</div>
							</div>
						</c:when>
						<c:when test="${map.get('castDoNum') == 3 }">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>엑스트라</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div>
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
									<div>배역:${map.castDoName }</div>
								</div>
							</div>
						</c:when>
						<c:when test="${map.get('castDoNum') == 4 }">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>까메오</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div>
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
									<div>배역:${map.castDoName }</div>
								</div>
							</div>
						</c:when>
						<c:when test="${map.get('castDoNum') == 11 }">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>감독</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div>
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
								</div>
							</div>
						</c:when>
						<c:when test="${map.get('castDoNum') == 12 }">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>조감독</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div>
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
								</div>
							</div>
						</c:when>
						<c:when test="${map.get('castDoNum') == 13 }">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>각본</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div>
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
								</div>
							</div>
						</c:when>
						<c:when test="${map.get('castDoNum') == 14 }">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>음악</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div>
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
								</div>
							</div>
						</c:when>
						<c:when test="${map.get('castDoNum') == 15 }">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>미술</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div>
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
								</div>
							</div>
						</c:when>
						<c:when test="${map.get('castDoNum') == 16 }">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>소품</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div>
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
								</div>
							</div>
						</c:when>
						<c:when test="${map.get('castDoNum') == 17 }">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>촬영</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div>
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
								</div>
							</div>
						</c:when>
					</c:choose>

				</c:when>
				<c:when test="${detail eq 'photo' }">${detail }</c:when>
				<c:when test="${detail eq 'vedio' }">${detail }</c:when>
				<c:when test="${detail eq 'rate' }">${detail }</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</div>
	</c:forEach>
</div>