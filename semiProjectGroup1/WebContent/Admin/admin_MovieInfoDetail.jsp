<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#adminMovieInfoDetailDiv{
		margin-left : 15%;
	    margin-right : 15%;
		padding-left: 150px;
		border-collapse: collapse;
		border: 2px solid gray;
		background-color: white;
}
.adminMovieInfoDetail
	{
		margin: auto;
		margin-top: 50px;
		text-align:center;
		width: 80%;
		height: 100px;
		background-color: white; 
		text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.1); 
	}
.adminMovieInfoDetail tr td a:link
	{
		color: black;
	}
.adminMovieInfoDetail tr td a:visited
	{
		color: silver;
	}
.adminMovieInfoDetail tr th
	{
		border-bottom: 2px dotted silver;
	}
.adminMovieInfoDetail tr td
	{
		border-bottom: 2px dotted silver;
	}
.adminMovieInfoDetailContent
	{
		text-align:left;
		padding-left:50px;
		vertical-align: top;
	}
.thisPage
	{
		font-size: 20px;
		box-shadow: 3px 4px 1.25px 3.75px rgba(0, 0, 0, 0); 
		text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.15); 
	}
	
#adminMovieInfoDetail1Div{
		margin-left : 15%;
	    margin-right : 15%;
		padding-left: 150px;
		border-collapse: collapse;
		border: 2px solid gray;
		background-color: white;
}
.adminMovieInfoDetail1
	{
		margin: auto;
		margin-top: 50px;
		text-align:center;
		width: 50%;
		height: 100px;
		background-color: white; 
		text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.1); 
	}
.adminMovieInfoDetail1 tr td a:link
	{
		color: black;
	}
.adminMovieInfoDetail1 tr td a:visited
	{
		color: silver;
	}
.adminMovieInfoDetail1 tr th
	{
		border-bottom: 2px dotted silver;
	}
.adminMovieInfoDetail1 tr td
	{
		border-bottom: 2px dotted silver;
	}
.adminMovieInfoDetail1Content
	{
		text-align:left;
		padding-left:50px;
		vertical-align: top;
	}
.thisPage
	{
		font-size: 20px;
		box-shadow: 3px 4px 1.25px 3.75px rgba(0, 0, 0, 0); 
		text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.15); 
	}
	
	#adminMovieInfoDetail2Div{
		margin-left : 15%;
	    margin-right : 15%;
		padding-left: 150px;
		border-collapse: collapse;
		border: 2px solid gray;
		background-color: white;
}
.adminMovieInfoDetail2
	{
		margin: auto;
		margin-top: 50px;
		text-align:center;
		width: 50%;
		height: 100px;
		background-color: white; 
		text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.1); 
	}
.adminMovieInfoDetail2 tr td a:link
	{
		color: black;
	}
.adminMovieInfoDetail2 tr td a:visited
	{
		color: silver;
	}
.adminMovieInfoDetail2 tr th
	{
		border-bottom: 2px dotted silver;
	}
.adminMovieInfoDetail2 tr td
	{
		border-bottom: 2px dotted silver;
	}
.adminMovieInfoDetail2Content
	{
		text-align:left;
		padding-left:50px;
		vertical-align: top;
	}
.thisPage
	{
		font-size: 20px;
		box-shadow: 3px 4px 1.25px 3.75px rgba(0, 0, 0, 0); 
		text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.15); 
	}

.adminMovieInfoDetailBtn {
	font-weight:bold;
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	background:#787878;
	background:-o-linear-gradient(90deg, #787878, #454545);
	background:-moz-linear-gradient( center top, #787878 5%, #454545 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #787878), color-stop(1, #454545) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#787878', endColorstr='#454545');
	background:-webkit-linear-gradient(#787878, #454545);
	background:-ms-linear-gradient(#787878, #454545);
	background:linear-gradient(#787878, #454545);
	text-indent:0px;
	line-height:0px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:12px;
	color:#f7f7f7;
	width:63px;
	height:0px;
	padding:13px;
	border-color:#2e2e2e;
	border-width:1px;
	border-style:solid;
}

.adminMovieInfoDetailBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.adminMovieInfoDetailBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}


.adminMovieInfoDeleteBtn {
	font-weight:bold;
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	background:#787878;
	background:-o-linear-gradient(90deg, #787878, #454545);
	background:-moz-linear-gradient( center top, #787878 5%, #454545 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #787878), color-stop(1, #454545) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#787878', endColorstr='#454545');
	background:-webkit-linear-gradient(#787878, #454545);
	background:-ms-linear-gradient(#787878, #454545);
	background:linear-gradient(#787878, #454545);
	text-indent:0px;
	line-height:0px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:12px;
	color:#f7f7f7;
	width:63px;
	height:0px;
	padding:13px;
	border-color:#2e2e2e;
	border-width:1px;
	border-style:solid;
}

.adminMovieInfoDeleteBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.adminMovieInfoDeleteBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}

.adminMovieInfoUpdateBtn {
	font-weight:bold;
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	background:#787878;
	background:-o-linear-gradient(90deg, #787878, #454545);
	background:-moz-linear-gradient( center top, #787878 5%, #454545 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #787878), color-stop(1, #454545) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#787878', endColorstr='#454545');
	background:-webkit-linear-gradient(#787878, #454545);
	background:-ms-linear-gradient(#787878, #454545);
	background:linear-gradient(#787878, #454545);
	text-indent:0px;
	line-height:0px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:12px;
	color:#f7f7f7;
	width:63px;
	height:0px;
	padding:13px;
	border-color:#2e2e2e;
	border-width:1px;
	border-style:solid;
}

.adminMovieInfoUpdateBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.adminMovieInfoUpdateBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}

.adminMovieInfoCBBtn {
	font-weight:bold;
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	background:#787878;
	background:-o-linear-gradient(90deg, #787878, #454545);
	background:-moz-linear-gradient( center top, #787878 5%, #454545 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #787878), color-stop(1, #454545) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#787878', endColorstr='#454545');
	background:-webkit-linear-gradient(#787878, #454545);
	background:-ms-linear-gradient(#787878, #454545);
	background:linear-gradient(#787878, #454545);
	text-indent:0px;
	line-height:0px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:12px;
	color:#f7f7f7;
	width:63px;
	height:0px;
	padding:13px;
	border-color:#2e2e2e;
	border-width:1px;
	border-style:solid;
}

.adminMovieInfoCBBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.adminMovieInfoCBBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}

.adminMovieInfoDetail1Div .adminMovieInfoDetail1 #adminMovieDetailImg {
	width: 300px;
	height: 300px;
	float: left;
	margin-right: 20px;
}
.adminMovieInfoDetail2Div .adminMovieInfoDetail2 #adminMovieDetailImg {
	width: 300px;
	height: 300px;
	float: left;
	margin-right: 20px;
}
</style>
<div>
<div class="adminMovieInfoDetailDiv">
	<h1>영화정보상세</h1>
	<hr>
	<table class="adminMovieInfoDetail">
		<tr>
	<th>영화번호</th>
	<td>${vo.movieNum}</td>
</tr>
<tr>
	<th>영화제목</th>
	<td>${vo.movieName }</td>
</tr>
<tr>
	<th>영화소개</th>
	<td>${vo.movieIntro}</td>
</tr>
<tr>
	<th>개봉일자</th>
	<td>${vo.movieReleaseDate }</td>
</tr>
<tr>
	<th>상영시간</th>
	<td>${vo.movieRunTime}</td>
</tr>
<tr>
	<th>제작사</th>
	<td>${vo.movieProduction }</td>
</tr>
<tr>
	<th>배급사</th>
	<td>${vo.movieDistributer}</td>
</tr>
<tr>
	<th>국가</th>
	<td>${vo.nation }</td>
</tr>
<tr>
	<th>관람나이</th>
	<td><c:choose>
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
		</c:choose></td>
</tr>
<tr>
	<th>장르명</th>
	<td>${vo.genreName}</td>
</tr>
	</table>
	</div>
	<hr/>
	<br/>
	<div class="adminMovieInfoDetail1Div">
	<c:set var="tmp" value="0" />
	<table class="adminMovieInfoDetail1">
		<tr>
			<th rowspan="6">이미지</th>
			<th rowspan="2">대표이미지</th>
			<c:forEach var="vo" items="${imgList }">
				<c:if test="${vo.get('ImageType')==1 }">
					<td>
						<img alt="영화대표이미지" src="${cp}/Movie/images/photo/${vo.get('ImageSavName')}" id="adminMovieDetailImg">
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
						<a class="adminMovieInfoDetailBtn" href="${pageContext.request.contextPath}/admin/MovieImgUpdate.do?ImageNum=${vo1.ImageNum}&movieNum=${vo.movieNum}">수정</a> <a class="adminMovieInfoDetailBtn" href="${pageContext.request.contextPath}/admin/MovieImgDelete.do?ImageNum=${vo1.ImageNum}&movieNum=${vo.movieNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">포스터</th>
			<c:forEach var="vo" items="${imgList }">
				<c:if test="${vo.get('ImageType')==2 }">
					<td>
						<img alt="영화포스터이미지" src="${cp}/Movie/images/photo/${vo.get('ImageSavName')}" id="adminMovieDetailImg">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${imgList }">
				<c:if test="${vo1.get('ImageType')==2 }">
					<td>
						<a class="adminMovieInfoDetailBtn" href="${pageContext.request.contextPath}/admin/MovieImgUpdate.do?ImageNum=${vo1.ImageNum}&movieNum=${vo.movieNum}">수정</a> <a class="adminMovieInfoDetailBtn" href="${pageContext.request.contextPath}/admin/MovieImgDelete.do?ImageNum=${vo1.ImageNum}&movieNum=${vo.movieNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">스틸샷</th>
			<c:forEach var="vo" items="${imgList }">
				<c:if test="${vo.get('ImageType')==3 }">
					<td>
						<img alt="영화스틸샷이미지" src="${cp}/Movie/images/photo/${vo.get('ImageSavName')}" id="adminMovieDetailImg">
					</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${imgList }">
				<c:if test="${vo1.get('ImageType')==3 }">
					<td>
						<a class="adminMovieInfoDetailBtn" href="${pageContext.request.contextPath}/admin/MovieImgUpdate.do?ImageNum=${vo1.ImageNum}&movieNum=${vo.movieNum}">수정</a> <a class="adminMovieInfoDetailBtn" href="${pageContext.request.contextPath}/admin/MovieImgDelete.do?ImageNum=${vo1.ImageNum}&movieNum=${vo.movieNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="4">동영상</th>
			<th rowspan="2">예고편</th>
			<c:forEach var="vo1" items="${urlList }">
				<c:if test="${vo1.get('urlType')==1 }">
					<td>${vo1.get('urlAddr') }</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${urlList }">
				<c:if test="${vo1.get('urlType')==1 }">
					<td>
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieUrlUpdate.do?urlNum=${vo1.get('urlNum') }&movieNum=${vo.movieNum}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/MovieUrlDelete.do?urlNum=${vo1.get('urlNum') }&movieNum=${vo.movieNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">하이라이트</th>
			<c:forEach var="vo1" items="${urlList }">
				<c:if test="${vo1.get('urlType')==2 }">
					<td>${vo1.get('urlAddr') }</td>
				</c:if>
			</c:forEach>
			<td>
				<a href="">추가</a>
			</td>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${urlList }">
				<c:if test="${vo1.get('urlType')==2 }">
					<td>
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieUrlUpdate.do?urlNum=${vo1.get('urlNum') }&movieNum=${vo.movieNum}">수정</a> <a href="">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
	</table>
	</div>
	<div >
	<div class="adminMovieInfoDetail2Div">
	<table class="adminMovieInfoDetail2">
		<tr>
			<th rowspan="12">출연진</th>
			<th rowspan="3">주연</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==1 }">
					<td>
						<img alt="주연이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}" id="adminMovieDetailImg">
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
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="3">조연</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==2 }">
					<td>
						<img alt="조연이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}" id="adminMovieDetailImg">
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
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="3">엑스트라</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==3 }">
					<td>
						<img alt="엑스트라이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}" id="adminMovieDetailImg">
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
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="3">까메오</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==4 }">
					<td>
						<img alt="까메오이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}" id="adminMovieDetailImg">
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
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="21">제작진</th>
			<th rowspan="3">감독</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==11 }">
					<td>
						<img alt="감독이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}" id="adminMovieDetailImg">
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
						<span>${vo1.get('charName') }</span>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==11 }">
					<td>
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">조감독</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==12 }">
					<td>
						<img alt="조감독이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}" id="adminMovieDetailImg">
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
						<span>${vo1.get('charName') }</span>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==12 }">
					<td>
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">각본</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==13 }">
					<td>
						<img alt="각본이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}" id="adminMovieDetailImg">
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
						<span>${vo1.get('charName') }</span>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==13 }">
					<td>
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">음악</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==14 }">
					<td>
						<img alt="음악이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}" id="adminMovieDetailImg">
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
						<span>${vo1.get('charName') }</span>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==14 }">
					<td>
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">미술</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==15 }">
					<td>
						<img alt="미술이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}" id="adminMovieDetailImg">
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
						<span>${vo1.get('charName') }</span>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==15 }">
					<td>
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">소품</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==16 }">
					<td>
						<img alt="소품이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}" id="adminMovieDetailImg">
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
						<span>${vo1.get('charName') }</span>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==16 }">
					<td>
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th rowspan="2">촬영</th>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==17 }">
					<td>
						<img alt="촬영이미지" src="${cp}/Movie/images/char/${vo1.get('charSavFileName')}" id="adminMovieDetailImg">
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
						<span>${vo1.get('charName') }</span>
					</td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="vo1" items="${crewList }">
				<c:if test="${vo1.get('castDoNum')==17 }">
					<td>
						<a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamUpdate.do?movieNum=${vo.movieNum}&charNum=${vo1.get('charNum')}">수정</a> <a class="adminMovieInfoDetailBtn" href="${cp }/admin/movieTeamDelete.do?movieNum=${vo.movieNum}&castNum=${vo1.castNum}">삭제</a>
					</td>
				</c:if>
			</c:forEach>
		</tr>
	</table>
	</div>
	<br>
	<hr>
	<a class="adminMovieInfoDeleteBtn" href="${pageContext.request.contextPath }/admin/MovieViewDelete.do">삭제</a>
	<hr>
	<a class="adminMovieInfoUpdateBtn" href="${cp }/admin/MovieInfoUpdate.do?movieNum=${movieNum }">정보수정</a>
	|
	<a class="adminMovieInfoCBBtn" href="${pageContext.request.contextPath }/admin/MovieInfoList.do">정보리스트</a>
</div>
</div>
