<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#registration {
		width: 100%;
		margin: auto;
		margin-top: 25px;
		border-collapse: collapse;
		background-color: gray;
	}
	#registration #registrationForm {
	    margin-left : 30%;
	    margin-right : 30%;
		padding-left: 150px;
		border-collapse: collapse;
		border: 2px solid gray;
		background-color: white;
	}
	.userJoinOkBtn {
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

.userJoinOkBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.userJoinOkBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}

	.userNickOkBtn {
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

.userNickOkBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.userNickOkBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}

.userJoinGoBtn {
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

.userJoinGoBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.userJoinGoBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}

.userJoinBackBtn {
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

.userJoinBackBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.userJoinBackBtn:hover {
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
var userChkId = "";
var userChkNick = "";
function checkData() {
	var userId = document.getElementsByName("userId")[0];
	if(userId.value.length < 6 ){
		alert("아이디는 최소 6자로 입력하세요.");
		userId.focus();
		return false;
	}
	var userChk = document.getElementById("userChk_ok");
	if(userChkId != userId.value || userChk == null || userChk.length == 0 ){
		alert("아이디 중복 확인을 해주세요.");
		userId.focus();
		return false;
	}
	userChkId = userId.value;
	var userPwd = document.getElementsByName("userPwd")[0];
	if(userPwd.value.length < 4 || userPwd.value.length > 15 ){
		alert("비밀번호는 4자를 초과하거나 15자 미만으로 입력하세요.");
		userPwd.focus();
		return false;
	}
	var userPwd1 = document.getElementsByName('userPwd1')[0];
	if(!(userPwd.value==userPwd1.value)){
		alert('설정한 비밀번호와 같게 입력하세요.');
		userPwd1.focus();
		return false;
	}
	var userNickName = document.getElementsByName("userNickName")[0];
	if(userNickName.value==""){
		alert("닉네임은 필수 입력사항입니다.");
		userNickName.focus();
		return false;
	}
	return true;
}
var xhr = null;
function checkUser() {
	var userId = document.getElementsByName("userId")[0];
	if(userId.value.length < 6 ){
		alert("아이디는 최소 6자로 입력하세요.");
		userId.value.focus();
		return false;
	}
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=checkUserResult;
	xhr.open("get","${pageContext.request.contextPath}/user/check.do?userId=" + userId.value,true);
	//xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send();
}
function checkUserResult() {
	if(xhr.readyState==4 && xhr.status==200){
		var data=xhr.responseText;
		var result=eval("(" + data +")");
		if (result.code == "success") {
			document.getElementById("userChk_res").innerHTML='<font color="red" id="userChk_fail">사용 불가능한 ID 입니다.</font>';
		} else {
			document.getElementById("userChk_res").innerHTML='<font color="gray" id="userChk_ok">사용 가능한 ID 입니다.</font>';
		}
		userChkId = document.getElementsByName("userId")[0].value;
	}
}

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
<div id="registration">
	<div id="registrationForm">
	<h1>회원가입하기</h1>
	<form method="post" action="${pageContext.request.contextPath }/user/registration.do" onsubmit="return checkData();">
		* 사항은 필수 입력 사항입니다.
		<br />
		아이디*
		<br />
		<input type="text" id="userId" name="userId" /> <input class="userJoinOkBtn" type="button" value="확인" onclick="checkUser()" /><span id="userChk_res"></span>
		<br/>
		비밀번호*
		<br />
		<input type="password" id="userPwd" name="userPwd" />
		<br />
		비밀번호확인*
		<br />
		<input type="password" id="userPwd1" name="userPwd1" />
		<br />
		닉네임*
		<br />
		<input type="text" id="userNickName" name="userNickName" /> <input class="userNickOkBtn" type="button" value="확인" onclick="checkNickName()" /><span id="userNickChk_res"></span>
		<br />
		<br />
		<input  class="userJoinGoBtn" id="set" type="submit" value="가입" />       |       <input class="userJoinBackBtn" type="reset" value="취소" />
	</form>
	</div>
	
</div>

	