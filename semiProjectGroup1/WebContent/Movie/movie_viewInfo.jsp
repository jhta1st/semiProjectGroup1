<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/JS/movie_listScript.js"></script>
<script type="text/javascript">
	var favXhr = null;
	function fav() {
		if ('${sessionScope.id}' == null || '${sessionScope.id}' == "") {
			location.href = "${cp}/main/login.do?pages=/main/login.jsp"
			return;
		}
		favXhr = new XMLHttpRequest();
		favXhr.onreadystatechange = favOk;
		favXhr.open("post", "${cp}/Admin/favTableInsert.do", true);
		favXhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		var param = "userId=" + '${sessionScope.id }' + "&movieNum="
				+ '${movieNum}';
		favXhr.send(param);
	}
	function favOk() {
		if (favXhr.readyState == 4 && favXhr.status == 200) {
			var data = favXhr.responseText;
			var check = eval("(" + data + ")");
			var favCheck = document.getElementById("favCheck");
			if (check.result == 'delete') {
				favCheck.value = "♡";
			} else {
				favCheck.value = "♥";
			}
		}
	}
	var favCheckXhr = null;
	function favCheck() {
		favCheckXhr = new XMLHttpRequest();
		favCheckXhr.onreadystatechange = favCheckOk;
		favCheckXhr
				.open(
						"get",
						"${cp}/Admin/favTableInsert.do?userId=${sessionScope.id }&movieNum=${movieNum}",
						true);
		favCheckXhr.send();
	}
	function favCheckOk() {
		if ('${sessionScope.id}' == null || '${sessionScope.id}' == "") {
			var favCheck = document.getElementById("favCheck");
			favCheck.value = "♡";
			return;
		}
		if (favCheckXhr.readyState == 4 && favCheckXhr.status == 200) {
			var data = favCheckXhr.responseText;
			var check = eval("(" + data + ")");
			var favCheck = document.getElementById("favCheck");
			if (check.result == 'false') {
				favCheck.value = "♡";
			} else {
				favCheck.value = "♥";
			}
		}
	}
	window.onload = function() {
		favCheck();
	}
</script>
<div id="movieReview">
	<div class="movieTop">
		<div class="movieSearchView">
			<form method="get" action="${cp }/Movie/moviesearch.do">
				<label for="keyword">영화검색</label><input type="text" id="keyword" name="keyword" value="${keyword }"><input type="submit" value="검색">
				<div class="movieSearchCheckbox">
					<input type="checkbox" name="genreName" id="0" value="0" <c:if test="${genreNum[0]=='0' }"> checked="checked"</c:if> onclick="checkAll()"><label for="0">전체</label>
					<c:forEach var="vo" items="${genreNamelist }">
						<input type="checkbox" name="genreName" id="${vo.genreNum }" value="${vo.genreNum }" <c:forEach var="va" items="${genreNum }">
				<c:if test="${va==vo.genreNum }"> checked="checked"</c:if>
				</c:forEach> onclick="checkAllch()">
						<label for="${vo.genreNum }">${vo.genreName }</label>
					</c:forEach>
				</div>
			</form>
		</div>
	</div>
	<div id="movieViewBriefIntro">
		<c:forEach var="map" items="${movieInfolist }" varStatus="st">
			<c:if test="${st.index==0 }">
				<img alt="대표이미지" src="${cp }/Movie/images/photo/${map.imageSavName}" id="movieReviewRepImg">
				<h3>${map.movieName }</h3>
			</c:if>
			<div>${map.genreName }</div>
		</c:forEach>
		<c:forEach var="map" items="${movieInfolist }" varStatus="st">
			<c:if test="${st.index==0 }">
				<div id="movieReviewAge">
					<c:choose>
						<c:when test="${map.movieAge==0 }">
							전체 관람가
						</c:when>
						<c:when test="${map.movieAge==1 }">
							12세 관람가
						</c:when>
						<c:when test="${map.movieAge==2 }">
							15세 관람가
						</c:when>
						<c:when test="${map.movieAge==3 }">
							청소년관람불가
						</c:when>
						<c:when test="${map.movieAge==4 }">
							제한상영가
						</c:when>
					</c:choose>
				</div>
				<div id="movieReviewRate">
					<c:choose>
						<c:when test="${rateAve>=4.5 }">★★★★★</c:when>
						<c:when test="${rateAve>=3.5 }">☆★★★★</c:when>
						<c:when test="${rateAve>=2.5 }">☆☆★★★</c:when>
						<c:when test="${rateAve>=1.5 }">☆☆☆★★</c:when>
						<c:when test="${rateAve>=0.5 }">☆☆☆☆★</c:when>
						<c:otherwise>☆☆☆☆☆</c:otherwise>
					</c:choose>
					${rateAve }
				</div>
			</c:if>
		</c:forEach>
		<input type="button" id="favCheck" onclick="fav();">
	</div>
	<div id="movieRevieMoreInfo">
		<ul>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=info">소개</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=crew">제작진/출연진</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=photo">스틸샷</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=vedio">예고편</a></li>
			<li><a href="${cp }/Movie/review.do?movieNum=${movieNum}&detail=rate">회원평점</a></li>
		</ul>
	</div>
	<c:set var="tmp" value="1" />
	<c:if test="${movieotherList.size()==0 }">
		<div>
			<form method="post" action="${cp }/Movie/rate/insertRate.do">
				<input type="hidden" name="movieNum" value="${movieNum }">
				<div id="rateAdd">
					<select name="rate">
						<option value="5" <c:if test="${rate==5 }">selected</c:if>>★★★★★</option>
						<option value="4" <c:if test="${rate==4 }">selected</c:if>>☆★★★★</option>
						<option value="3" <c:if test="${rate==3 }">selected</c:if>>☆☆★★★</option>
						<option value="2" <c:if test="${rate==2 }">selected</c:if>>☆☆☆★★</option>
						<option value="1" <c:if test="${rate==1 }">selected</c:if>>☆☆☆☆★</option>
					</select>
					<input type="text" name="rateComm" id="rateComm" value="${rateComm }"> <input type="submit" value="입력">
				</div>
			</form>
		</div>

	</c:if>
	<c:forEach var="map" items="${movieotherList }" varStatus="st">
		<div>
			<c:choose>
				<c:when test="${detail eq 'info' && st.index eq 0 }">
					<div id="movieRevieInfoInfo">${map.get('movieIntro')}</div>
				</c:when>
				<c:when test="${detail eq 'crew' }">
					<c:choose>
						<c:when test="${map.get('castDoNum')== 1}">
							<c:if test="${tmp<=map.get('castDoNum') }">
								<h3>주연</h3>
								<c:set var="tmp" value="${tmp+1 }" />
							</c:if>
							<div class="movieReviewCrewInfo">
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
							<div class="movieReviewCrewInfo">
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
							<div class="movieReviewCrewInfo">
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
							<div class="movieReviewCrewInfo">
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
							<div class="movieReviewCrewInfo">
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
							<div class="movieReviewCrewInfo">
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
							<div class="movieReviewCrewInfo">
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
							<div class="movieReviewCrewInfo">
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
							<div class="movieReviewCrewInfo">
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
							<div class="movieReviewCrewInfo">
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
							<div class="movieReviewCrewInfo">
								<img alt="제작/출연진 사진" src="${cp }/Movie/images/char/${map.charSavFileName}">
								<div>
									<div>이름:${map.charName }</div>
								</div>
							</div>
						</c:when>
					</c:choose>

				</c:when>
				<c:when test="${detail eq 'photo' }">
					<img src="${cp}/Movie/images/photo/${map.get('ImageSavName')}" class="movieReviewPhoto">
				</c:when>
				<c:when test="${detail eq 'vedio' }">${map.urlAddr }</c:when>
				<c:when test="${detail eq 'rate' }">
					<c:if test="${st.index==0 }">
						<div>
							<form method="post" action="${cp }/Movie/rate/insertRate.do">
								<input type="hidden" name="movieNum" value="${movieNum }">
								<div id="rateAdd">
									<select name="rate">
										<option value="5" <c:if test="${rate==5 }">selected</c:if>>★★★★★</option>
										<option value="4" <c:if test="${rate==4 }">selected</c:if>>☆★★★★</option>
										<option value="3" <c:if test="${rate==3 }">selected</c:if>>☆☆★★★</option>
										<option value="2" <c:if test="${rate==2 }">selected</c:if>>☆☆☆★★</option>
										<option value="1" <c:if test="${rate==1 }">selected</c:if>>☆☆☆☆★</option>
									</select>
									<input type="text" name="rateComm" id="rateComm" value="${rateComm }"> <input type="submit" value="입력">
								</div>
							</form>
						</div>
						<div style="font-size: 9px; font-weight: bold; color: red;">
							<c:if test="${code=='fail' }">변경 실패!</c:if>
						</div>
						<div id="rateList">
							<c:forEach var="maps" items="${movieotherList }">
								<div class="movieReviewRateCommAll">
									<div class="movieReviewRateScore">
										<c:choose>
											<c:when test="${maps.rate==5 }">★★★★★ (5) </c:when>
											<c:when test="${maps.rate==4 }">☆★★★★ (4) </c:when>
											<c:when test="${maps.rate==3 }">☆☆★★★ (3) </c:when>
											<c:when test="${maps.rate==2 }">☆☆☆★★ (2) </c:when>
											<c:when test="${maps.rate==1 }">☆☆☆☆★ (1) </c:when>
										</c:choose>
										<br>
										${maps.userId }
									</div>
									<div class="movieReviewRateComm">${maps.rateComm }
										<a href="${cp }/Movie/rate/deleteRate.do?movieNum=${movieNum}&userId=${maps.userId }">삭제</a>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:if>
				</c:when>
			</c:choose>
		</div>
	</c:forEach>
</div>