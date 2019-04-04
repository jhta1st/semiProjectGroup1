<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/user_registration.jsp</title>
<script type="text/javascript">
function checkData() {
	var userId = document.getElementsByName("userId")[0];
	if(userId.value.length < 4 ){
		alert("아이디는 최소 5자로 입력하세요.");
		userId.focus();
		return false;
	}
	var userPwd = document.getElementsByName("userPwd")[0];
	if(userPwd.value.length < 4 || userPwd.value.length > 15 ){
		alert("비밀번호는 4자를 초과하거나 15자 미만으로 입력하세요.");
		userPwd.focus();
		return false;
	}
	var userPwd1 = document.getElementsByName("userPwd1")[0];
	if(!(userPwd.value==userPwd1.value)){
		alert("설정한 비밀번호와 같게 입력하세요.");
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
</script>
</head>
<body>
<h1>회원가입하기</h1>
<form method="post" action="${pageContext.request.contextPath }/user/registration.do" onsubmit="return checkData();">
	* 사항은 필수 입력 사항입니다. <br>
	아이디*<br>
	<input type="text" name="userId" ><br>
	비밀번호*<br>
	<input type="password" name="userPwd"><br>
	비밀번호확인*<br>
	<input type="password" name="userPwd1"><br>
	닉네임*<br>
	<input type="text" name="userNickName"><br>
	<input type="submit" value="가입"><input type="reset" value="취소">
</form>
</body>
</html>