<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.User_UserInfoVo"%>
<%@page import="dao.User_UserInfoDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#update {
		width: 88%;
		margin: auto;
		margin-top: 25px;
		border-collapse: collapse;
		border: 1px solid #E7E7E7;
		background-color: gray;
	}
	#update #updateForm {
	    margin-left : 30%;
	    margin-right : 30%;
		padding-left: 150px;
		border-collapse: collapse;
		border: 2px solid gray;
		background-color: white;
	}
	.userNickChangeBtn {
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

.userNickChangeBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.userNickChangeBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}

	.userUpdateOkBtn {
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
	margin-left: 40px;
}

.userUpdateOkBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.userUpdateOkBtn:hover {
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
<script type="text/javascript">
var userChkNick = "";
//닉네임 중복체크
var xhrr = null;
function checkNickName() {
	var userNickName = document.getElementsByName("userNickName")[0];
	if(userNickName.value==""){
		alert("닉네임은 필수 입력사항입니다.");
		userNickName.focus();
		return false;
	}
	xhrr=new XMLHttpRequest();
	xhrr.onreadystatechange=checkNickNameResult;
	xhrr.open("get","${pageContext.request.contextPath}/user/nickNameCheck.do?userNickName=" + userNickName.value,true);
	xhrr.send();
}
function checkNickNameResult() {
	if(xhrr.readyState==4 && xhrr.status==200){
		var data=xhrr.responseText;
		var result=eval("(" + data +")");
		if (result.code == "success") {
			document.getElementById("userNickChk_res").innerHTML='<font color="red" id="userNickChk_fail">사용 불가능한 닉네임 입니다.</font>';
		} else {
			document.getElementById("userNickChk_res").innerHTML='<font color="gray" id="userNickChk_ok">사용 가능한 닉네임 입니다.</font>';
		}
		userChkNick = document.getElementsByName("userNickName")[0].value;
	}
}
</script>
<div id="update">
	<div id="updateForm">
<h1>회원 정보 수정</h1>
<form method="post" action="${pageContext.request.contextPath }/user/update.do?userId=${vo.userId }">
	<input type="hidden" name="userId" value="${vo.userId }"> <label for="userId">아이디</label><br><input type="text" id="userId" value="${vo.userId }" disabled="disabled">
	<br>
	<label for="userPwd">비밀번호</label><br><input type="text" name="userPwd" id="userPwd" value="${vo.userPwd}">
	<br>
	<label for="userNickName">닉네임</label><br><input type="text" name="userNickName" id="userNickName" value="${vo.userNickName }">
	<input class="userNickChangeBtn" type="button" value="확인" onclick="checkNickName()" /><span id="userNickChk_res"></span>
	<br>
	<br>
	<input  class="userUpdateOkBtn" type="submit" value="수정" /> 
</form>
</div>
</div>