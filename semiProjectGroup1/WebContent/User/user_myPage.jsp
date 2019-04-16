<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#mypage {
		padding-top:10px;
		padding-bottom: 10px;
		width: 100%;
		margin: auto;
		background-color: #cecece;
	}
	#mypage #mypageForm {
	    margin:auto;
	    width:50%;
		border: 1px solid silver;
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
.myPageTable {
	border:1px solid silver;
	border-radius:25px;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 25px;
	text-align:center;
	vertical-align:middle;
	width: 80%;
	background-color: white; 
	text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.1);
}
.myPageTable tr td {
	border-bottom: none;
}
.myPageTable a{
	color: black;
}
.myPageTable a:link {
	text-decoration: none;
}
.myPageTable a:visited {
	color: silver;
	text-decoration: none;
}
.myPageBtns{
	text-align: center;
	margin-bottom: 40px;
}
</style>
<div id="mypage">
	<div id="mypageForm">
		<table class="myPageTable">
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
			<div class="myPageTable">
				<p>좋아하는 영화</p>
				<c:choose>
					<c:when test="${favList[0]==null}">
						<p>좋아하는 영화가 없습니다.<br>좋아하는 영화를 찾아 ♡ 버튼을 눌러주세요.</p>
					</c:when>
					<c:otherwise>
						<ol type="1">
							<c:forEach var="map" items="${favList }">
								<li><a href="${cp }/Movie/review.do?movieNum=${map.get('movieNum') }">${map.get("movieName")}</a></li>
							</c:forEach>
						</ol>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div>
			<div class="myPageTable">
				<p>내가 작성한 글</p>
				<c:choose>
					<c:when test="${fbList[0]==null}">
						<p>작성한 글이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<p>
							<c:forEach var="fbVo" items="${fbList }">
								<span><a href="${cp }/FreeBoard/Content.do?freeBoardNum=${fbVo.freeBoardNum }">${fbVo.freeBoardTitle} - ${fbVo.freeBoardWdate}</a><br></span>
							</c:forEach>
						</p>
					</c:otherwise>			
				</c:choose>
			</div>
		</div>
		<div>
			<div class="myPageTable">
				<p>내가 작성한 댓글</p>
				<c:choose>
					<c:when test="${fbcList[0]==null}">
						<p>작성한 댓글이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<p>
							<c:forEach var="fbcVo" items="${fbcList }">
								<span><a href="${cp }/FreeBoard/Content.do?freeBoardNum=${fbcVo.freeBoardNum }">${fbcVo.freeBoardCommContent} - ${fbcVo.freeBoardCommWdate}</a></span>
							</c:forEach>
						</p>
					</c:otherwise>			
				</c:choose>
			</div>
			<div class="myPageBtns">
				<a class="userMypageDeleteBtn" href="${pageContext.request.contextPath}/user/delete.do?userId=${vo.userId}">회원 탈퇴</a>
				<a class="userMypageUpdateBtn" href="${pageContext.request.contextPath}/user/update.do?userId=${vo.userId}">회원정보 수정</a>
			</div>
		</div>
	</div>
</div>
