<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Admin/admin_MovieInfoDetail.jsp</title>
</head>
<body>
	<h1>영화정보상세</h1>
	<hr>
	<table border="1">
		<tr>
			<th>영화번호</th>
			<th>영화제목</th>
			<th>영화소개</th>
			<th>개봉일자</th>
			<th>상영시간</th>
			<th>제작사</th>
			<th>배급사</th>
			<th>국가</th>
			<th>관람나이</th>
			<th>장르명</th>
		</tr>
		<tr>
			<td>${vo.movieNum}</td>
			<td>${vo.movieName }</td>
			<td>${vo.movieIntro}</td>
			<td>${vo.movieReleaseDate }</td>
			<td>${vo.movieRunTime}</td>
			<td>${vo.movieProduction }</td>
			<td>${vo.movieDistributer}</td>
			<td>${vo.nation }</td>
			<td>
				<c:choose>
					<c:when test="${vo.movieAge==0 }">
						전체 관람가
					</c:when>
					<c:when test="${vo.movieAge==1 }">
						12세 관람가
					</c:when>
					<c:when test="${vo.movieAge==2 }">
						15세 관람가
					</c:when>
					<c:when test="${vo.movieAge==3 }">
						청소년관람불가
					</c:when>
					<c:when test="${vo.movieAge==4 }">
						제한상영가
					</c:when>
				</c:choose>
			</td>
			<td>${vo.genreName}</td>
		</tr>
	</table>
	<c:set var="tmp" value="0" />
	<table border="1">
		<tr>
			<th rowspan="6">이미지</th>
			<th rowspan="2">대표이미지</th>
			<c:forEach var="vo" items="${imgList }">
				<c:if test="${vo.get('ImageType')==1 }">
					<td>
						<img alt="영화대표이미지" src="${cp}/Movie/images/photo/${vo.get('ImageSavName')}">
						<c:set var="tmp" value="${tmp=tmp+1 }" />
					</td>
				</c:if>
				<c:if test="${tmp==0 }">
					<td>
						<a href="">추가</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${imgList }">
				<c:if test="${vo1.get('ImageType')==1 }">
					<td>
						<a href="${pageContext.request.contextPath}/admin/MovieImgUpdate.do?ImageNum=${vo1.ImageNum}&movieNum=${vo.movieNum}">수정</a> <a href="${pageContext.request.contextPath}/admin/MovieImgDelete.do?movieNum=${vo.movieNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">포스터</th>
			<c:forEach var="vo" items="${imgList }">
				<c:if test="${vo.get('ImageType')==2 }">
					<td>
						<img alt="영화포스터이미지" src="${cp}/Movie/images/photo/${vo.get('ImageSavName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo" items="${imgList }">
				<c:if test="${vo.get('ImageType')==2 }">
					<td>
						<a href="">수정</a> <a href="${pageContext.request.contextPath}/admin/MovieImgDelete.do?ImageNum=${vo1.ImageNum}&movieNum=${vo.movieNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">스틸샷</th>
			<c:forEach var="vo" items="${imgList }">
				<c:if test="${vo.get('ImageType')==3 }">
					<td>
						<img alt="영화스틸샷이미지" src="${cp}/Movie/images/photo/${vo.get('ImageSavName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo" items="${imgList }">
				<c:if test="${vo.get('ImageType')==3 }">
					<td>
						<a href="">수정</a> <a href="${pageContext.request.contextPath}/admin/MovieImgDelete.do?ImageNum=${vo1.ImageNum}&movieNum=${vo.movieNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="4">동영상</th>
			<th rowspan="2">예고편</th>
			<c:forEach var="vo" items="${urlList }">
				<c:if test="${vo.get('urlType')==1 }">
					<td>${vo.get('urlAddr') }</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo" items="${urlList }">
				<c:if test="${vo.get('urlType')==1 }">
					<td>
						<a href="">수정</a> <a href="">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">하이라이트</th>
			<c:forEach var="vo" items="${urlList }">
				<c:if test="${vo.get('urlType')==2 }">
					<td>${vo.get('urlAddr') }</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo" items="${urlList }">
				<c:if test="${vo.get('urlType')==2 }">
					<td>
						<a href="">수정</a> <a href="">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
	</table>
	<table border="1">
		<tr>
			<th rowspan="12">출연진</th>
			<th rowspan="3">주연</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==1 }">
					<td>
						<img alt="주연이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==1 }">
					<td>
						<span>${vo1.get('castDoName') }(${vo1.get('charName') })</span>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==1 }">
					<td>
						<a href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="3">조연</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==2 }">
					<td>
						<img alt="조연이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==2 }">
					<td>
						<span>${vo1.get('castDoName') }(${vo1.get('charName') })</span>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==2 }">
					<td>
						<a href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="3">엑스트라</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==3 }">
					<td>
						<img alt="엑스트라이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==3 }">
					<td>
						<span>${vo1.get('castDoName') }(${vo1.get('charName') })</span>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==3 }">
					<td>
						<a href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="3">까메오</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==4 }">
					<td>
						<img alt="까메오이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==4 }">
					<td>
						<span>${vo1.get('castDoName') }(${vo1.get('charName') })</span>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==4 }">
					<td>
						<a href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="14">제작진</th>
			<th rowspan="2">감독</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==11 }">
					<td>
						<img alt="감독이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==11 }">
					<td>
						<a href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">조감독</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==12 }">
					<td>
						<img alt="조감독이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==12 }">
					<td>
						<a href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">각본</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==13 }">
					<td>
						<img alt="각본이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==13 }">
					<td>
						<a href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">음악</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==14 }">
					<td>
						<img alt="음악이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==14 }">
					<td>
						<a href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">미술</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==15 }">
					<td>
						<img alt="미술이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==15 }">
					<td>
						<a href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">소품</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==16 }">
					<td>
						<img alt="소품이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==16 }">
					<td>
						<a href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">촬영</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==17 }">
					<td>
						<img alt="촬영이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==17 }">
					<td>
						<a href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
	</table>
	<br>
	<hr>
	<a href="${pageContext.request.contextPath }/admin/MovieViewDelete.do">삭제</a>
	<hr>
	<a href="${cp }/admin/MovieInfoUpdate.do?movieNum=${movieNum }">영화정보수정</a>
	<br>
	<a href="${pageContext.request.contextPath }/admin/MovieInfoList.do">영화정보리스트로</a>
</body>
</html>