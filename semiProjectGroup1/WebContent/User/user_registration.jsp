<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div>
	<h1>회원가입하기</h1>
	<form method="post" action="${pageContext.request.contextPath }/user/registration.do" onsubmit="return checkData();">
		* 사항은 필수 입력 사항입니다.
		<br />
		아이디*
		<br />
		<input type="text" id="userId" name="userId" /> <input type="button" value="확인" onclick="checkUser()" /><span id="userChk_res"></span>
		<br>
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
		<input type="text" id="userNickName" name="userNickName" /> <input type="button" value="확인" onclick="checkNickName()" /><span id="userNickChk_res"></span>
		<br />
		<input type="submit" value="가입" /><input type="reset" value="취소" />
	</form>
</div>