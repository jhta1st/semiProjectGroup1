<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/user_registration.jsp</title>
</head>
<body>
<h1>회원가입하기</h1>
<form method="post" action="${pageContext.request.contextPath }/user/registration.do">
	아이디<br>
	<input type="text" name="userId"><br>
	비밀번호<br>
	<input type="password" name="userPwd"><br>
	닉네임<br>
	<input type="text" name="userNickName"><br>
	<input type="submit" value="가입">
</form>
</body>
</html>