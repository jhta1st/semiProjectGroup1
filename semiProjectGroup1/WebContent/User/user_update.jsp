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
	#update #updateForm #set {
	     margin-left : 50px;
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
	<input type="button" value="확인" onclick="checkNickName()" /><span id="userNickChk_res"></span>
	<br>
	<br>
	<input  id="set" type="submit" value="수정" />       |       <input type="reset" value="취소" />
</form>
</div>
</div>