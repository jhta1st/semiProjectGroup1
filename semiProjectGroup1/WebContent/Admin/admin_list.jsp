<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#adminUserListDiv{
	margin-left : 15%;
	    margin-right : 15%;
		padding-left: 150px;
		border-collapse: collapse;
		border: 2px solid gray;
		background-color: white;
}
.adminUserList
	{
		margin: auto;
		margin-top: 50px;
		text-align:center;
		width: 50%;
		height: 400px;
		background-color: white; 
		text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.1); 
	}
.adminUserList tr td a:link
	{
		color: black;
	}
.adminUserList tr td a:visited
	{
		color: silver;
	}
.adminUserList tr th
	{
		border-bottom: 2px dotted silver;
	}
.adminUserList tr td
	{
		border-bottom: 2px dotted silver;
	}
.adminUserPagingDiv
	{
		margin: auto;
		margin-top: 5px;
		margin-bottom: 10px;
		text-align: center;
		font-size: 16px;
		box-shadow: 3px 4px 1.25px 3.75px rgba(0, 0, 0, 0); 
		text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.15); 
	}
.adminUserListContent
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
.adminUserSearchDiv
	{
		margin: auto;
		text-align: center;
		font-size: 16px;
	}
.adminUserSearchBtn {
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

.adminUserSearchBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.adminUserSearchBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}

.adminUserDeleteBtn {
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

.adminUserDeleteBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.adminUserDeleteBtn:hover {
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
<div>
	<div class="adminUserListDiv">
	
	<table class="adminUserList">
		<tr>
			<th>회원아이디</th>
			<th>비밀번호</th>
			<th>닉네임</th>
			<th>레벨</th>
			<th>경험치</th>
			<th>가입일</th>
			<th>권한레벨</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.userId}</td>
				<td>${vo.userPwd }</td>
				<td>${vo.userNickName }</td>
				<td>${vo.userLev}</td>
				<td>${vo.userExp}</td>
				<td>${vo.userJdate }</td>
				<td>
					<c:choose>
						<c:when test="${vo.userPower==1 }">
			관리자(1)
			</c:when>
						<c:when test="${vo.userPower==2 }">
			일반회원(2)
			</c:when>
						<c:when test="${vo.userPower==3 }">
			탈퇴회원(3)
			</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${vo.userPower==1 }">
						</c:when>
						<c:when test="${vo.userPower==2 }">
							<a class="adminUserDeleteBtn" href="${pageContext.request.contextPath}/admin/delete.do?userId=${vo.userId}">삭제</a>
						</c:when>
						<c:when test="${vo.userPower==3 }">
						</c:when>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div class="adminUserPagingDiv">
		<c:choose>
			<c:when test="${startPage>10 }">
				<a href="${cp }/admin/list.do?pageNum=${startPage-1}">[이전]</a>
			</c:when>
			<c:otherwise>
			[이전]
		</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:choose>
				<c:when test="${pageNum==i }">
					<a href="${cp }/admin/list.do?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color: pink">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="${cp }/admin/list.do?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color: #999">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPage<pageCount}">
				<a href="${cp }/admin/list.do?pageNum=${endPage+1}">[다음]</a>
			</c:when>
			<c:otherwise>
			[다음]
		</c:otherwise>
		</c:choose>
	</div>
	<!-- 검색창 -->
	<div class="adminUserSearchDiv">
		<form method="post" action="${cp }/admin/list.do">
			<select name="field">
				<option value="userNickName" <c:if test="${field=='userNickName' }">
				selected='selected'
			</c:if>>닉네임</option>
				<option value="userLev" <c:if test="${field=='userLev' }">
				selected='selected'
			</c:if>>레벨</option>
				<option value="userJdate" <c:if test="${field=='userJdate' }">
				selected='selected'
			</c:if>>가입일</option>
				<option value="userPower" <c:if test="${field=='userPower' }">
				selected='selected'
			</c:if>>권한레벨</option>
			</select>
			<input type="text" name="keyword" value="${keyword }"> <input class="adminUserSearchBtn" type="submit" value="검색">
		</form>
	</div>
</div>













