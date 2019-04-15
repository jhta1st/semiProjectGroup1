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
	}
	#mypage #mypageForm #set {
	     margin-left : 150px;
	}
	#mypage #mypageForm #set1 {
	     margin-right : 150px;
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
<a id="set" href="${pageContext.request.contextPath}/user/delete.do?userId=${vo.userId}">회원 탈퇴</a> | 
<a id="set1" href="${pageContext.request.contextPath}/user/update.do?userId=${vo.userId}">회원정보 수정</a>
<hr>
</div>
</div>
