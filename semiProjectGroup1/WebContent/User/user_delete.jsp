<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	margin-left: 15%;
	margin-right: 15%;
	padding-left: 150px;
	border-collapse: collapse;
	border: 2px solid gray;
	background-color: white;
}

.userDeleteBtn {
	font-weight: bold;
	text-decoration: none;
	font-family: Arial;
	box-shadow: inset #595959 0px 5px 8px -1px, #a6a6a6 0px 4px 6px;
	o-box-shadow: inset #595959 0px 5px 8px -1px, #a6a6a6 0px 4px 6px;
	-moz-box-shadow: inset #595959 0px 5px 8px -1px, #a6a6a6 0px 4px 6px;
	-webkit-box-shadow: inset #595959 0px 5px 8px -1px, #a6a6a6 0px 4px 6px;
	background: #787878;
	background: -o-linear-gradient(90deg, #787878, #454545);
	background: -moz-linear-gradient(center top, #787878 5%, #454545 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #787878
		), color-stop(1, #454545));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#787878',
		endColorstr='#454545');
	background: -webkit-linear-gradient(#787878, #454545);
	background: -ms-linear-gradient(#787878, #454545);
	background: linear-gradient(#787878, #454545);
	text-indent: 0px;
	line-height: 0px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	text-align: center;
	vertical-align: middle;
	display: inline-block;
	font-size: 12px;
	color: #f7f7f7;
	width: 100px;
	height: 0px;
	padding: 13px;
	border-color: #2e2e2e;
	border-width: 1px;
	border-style: solid;
	margin-left: 60px;
}

.userDeleteBtn:active {
	box-shadow: inset #595959 0px 5px 8px -1px, #a6a6a6 0px 0 6px;
	o-box-shadow: inset #595959 0px 5px 8px -1px, #a6a6a6 0px 0 6px;
	-moz-box-shadow: inset #595959 0px 5px 8px -1px, #a6a6a6 0px 0 6px;
	-webkit-box-shadow: inset #595959 0px 5px 8px -1px, #a6a6a6 0px 0 6px;
	position: relative;
	top: 4px
}

.userDeleteBtn:hover {
	background: #454545;
	background: -o-linear-gradient(90deg, #454545, #787878);
	background: -moz-linear-gradient(center top, #454545 5%, #787878 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #454545
		), color-stop(1, #787878));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545',
		endColorstr='#787878');
	background: -webkit-linear-gradient(#454545, #787878);
	background: -ms-linear-gradient(#454545, #787878);
	background: linear-gradient(#454545, #787878);
}
</style>
</head>
<body>
	<div id="delete">
		<div id="deleteForm">
			<h1>회원탈퇴</h1>
			<form method="post"
				action="${pageContext.request.contextPath}/user/delete.do?userId=${userId}">
				<table style="width: 500px;">
					<tr>
						<td>비밀번호를 입력하세요.</td>
						<td><input type="password" name="userPwd"></td>
					</tr>
					
					<tr>
						<td colspan="2"><span style="color: red; font-size: 12px;">${msg }</span>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input class="userDeleteBtn" type="submit" value="확인"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>