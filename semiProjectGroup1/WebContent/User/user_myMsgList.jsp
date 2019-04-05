<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>/User/user_myMsgList.jsp</title>
</head>
<body>
<h1>쪽지리스트</h1>
<hr>
<table border="1">
	<tr>
		<th>쪽지번호</th><th>수신아이디</th><th>송신아이디</th><th>쪽지내용</th><th>작성일</th><th>읽기여부</th>
	</tr>
		<tr>
			<td>${vo.msgNum}</td>
			<td>${vo.receiveUserId }</td>
			<td>${vo.sendUserId }</td>
			<td><a href="${pageContext.request.contextPath}/detaile.do?userId=${vo.userId}">${vo.msgContent}</a></td>
			<td>${vo.msgWdate}</td>
			<td>${vo.msgCheck}</td>	
		</tr>
</table>
<br>
<hr>
<a href="${pageContext.request.contextPath}/delete.do?userId=${vo.userId}">쪽지 삭제</a> |
<a href="${pageContext.request.contextPath}/user/sendMsgList.do?userId=${vo.userId}">쪽지 작성</a>
<hr>
<a href="${pageContext.request.contextPath }/main/layout.jsp">홈으로</a>
</body>
</html>