<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/User/user_delete.jsp</title>
</head>
<body>
	<h1>회원탈퇴</h1>
	<form method="post" action="${pageContext.request.contextPath}/delete.do?userId=${userId}">
		<table style="width: 500px;">
			<tr>
				<td>비밀번호를 입력하세요.</td>
				<td>
					<input type="password" name="userPwd">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<span style="color: red; font-size: 12px;">${msg }</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="확인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>