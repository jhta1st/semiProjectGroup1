<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.User_UserInfoVo"%>
<%@page import="dao.User_UserInfoDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.adminMoviePeopleUpdateBtn {
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

.adminMoviePeopleUpdateBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.adminMoviePeopleUpdateBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}
.gg{
	margin-left: 50px;
}
.gg1{
	margin-left: 65px;
}
</style>
<div>
<hr/>
	<h1>인물정보 수정</h1>
<hr/>
	<form method="post" action="${pageContext.request.contextPath }/admin/MoviePeopleUpdate.do?charNum=${vo.charNum }" enctype="multipart/form-data">
		<input type="hidden" name="charNum" value="${vo.charNum }"> 인물번호 <input class="gg" type="text" id="charNum" value="${vo.charNum }" disabled="disabled">
		<br/><br/>
		인물명 <input class="gg1" type="text" id="charName" name="charName" value="${vo.charName }">
		<br/><br/>
		기존파일 <input class="gg" type="text" disabled="disabled" id="charOrgFileName" value="${ vo.charOrgFileName}">
		<br/><br/>
		수정할파일 <input type="file" name="file2">
		<br/><br/>
		<input class="adminMoviePeopleUpdateBtn" type="submit" value="수정">
	</form>
</div>
