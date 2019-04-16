<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#mypage {
		width: 100%;
		margin: auto;
		margin-top: 25px;
		border-collapse: collapse;
		border: 1px solid #E7E7E7;
		background-color: gray;
	}
	#mypage #mypageForm {
	    margin-left : 15%;
	    margin-right : 15%;
		padding-left: 150px;
		border-collapse: collapse;
		border: 2px solid gray;
		background-color: white;
		border-radius:25px;
	}
	#mypage #mypageForm #set {
	     margin-left : 150px;
	}
	#mypage #mypageForm #set1 {
	     margin-right : 150px;
	}

.userMypageDeleteBtn {
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

.userMypageDeleteBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.userMypageDeleteBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}

.userMypageUpdateBtn {
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
	width:100px;
	height:0px;
	padding:13px;
	border-color:#2e2e2e;
	border-width:1px;
	border-style:solid;
}

.userMypageUpdateBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.userMypageUpdateBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}
</style>
<div id="mypage">
<div id="mypageForm">
<h1>마이페이지</h1>
<hr>
<table border="1">
	<tr>
		<th>회원아이디</th><th>비밀번호</th><th>닉네임</th><th>레벨</th><th>경험치</th>
		<th>가입일</th>
	</tr>
		<tr>
			<td>${vo.userId}</td>
			<td>${vo.userPwd }</td>
			<td>${vo.userNickName }</td>
			<td>${lev}</td>
			<td>${exp}</td>
			<td>${vo.userJdate }</td>	
		</tr>
</table>
<div>
	<div>
		<p>내가 좋아하는 영화</p>
		<ol type="1">
			<c:if test="${favList==''}">
				좋아하는 영화가 없습니다.<br>좋아하는 영화를 찾아 ♡ 버튼을 눌러주세요.
			</c:if>
			<c:forEach var="map" items="${favList }">
				<li><a href="${cp }/Movie/review.do?movieNum=${map.get('movieNum') }">${map.get("movieName")}</a></li>
			</c:forEach>
		</ol>
	</div>
</div>
<div>
	<div>
		<p>내가 작성한 글</p>
		<ol type="1">
			<c:if test="${fbList==''}">
				작성한 글이 없습니다.
			</c:if>
			<c:forEach var="fbVo" items="${fbList }">
				<li><a href="${cp }/FreeBoard/Content.do?freeBoardNum=${fbVo.freeBoardNum }">${fbVo.freeBoardTitle}</a> - ${fbVo.freeBoardWdate}</li>
			</c:forEach>
		</ol>
	</div>
</div>
<div>
	<div>
		<p>내가 작성한 댓글</p>
		<ol type="1">
			<c:if test="${fbcList==''}">
				작성한 글이 없습니다.
			</c:if>
			<c:forEach var="fbcVo" items="${fbcList }">
				<li><a href="${cp }/FreeBoard/Content.do?freeBoardNum=${fbcVo.freeBoardNum }">${fbcVo.freeBoardCommContent}</a> - ${fbcVo.freeBoardCommWdate}</li>
			</c:forEach>
		</ol>
	</div>
</div>
<br>
<hr>
<a class="userMypageDeleteBtn" href="${pageContext.request.contextPath}/user/delete.do?userId=${vo.userId}">회원 탈퇴</a> | 
<a class="userMypageUpdateBtn" href="${pageContext.request.contextPath}/user/update.do?userId=${vo.userId}">회원정보 수정</a>
<hr>
</div>
</div>
