<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/User/user_delete.jsp</title>
<style>
	#delete {
		width: 100%;
		margin: auto;
		margin-top: 25px;
		border-collapse: collapse;
		border: 1px solid #E7E7E7;
		background-color: gray;
	}
	#delete #deleteForm {
	    margin-left : 15%;
	    margin-right : 15%;
		padding-left: 150px;
		border-collapse: collapse;
		border: 2px solid gray;
		background-color: white;
	}
	#delete #deleteForm #set {
	     margin-left : 250px;
	}
</style>
</head>
<body>
<div id="delete">
<div id="deleteForm">
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
					<input id="set" type="submit" value="확인">
				</td>
			</tr>
		</table>
	</form>
	</div>
	</div>
</body>
</html>