<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>/User/user_myMsgList.jsp</title>
</head>
<body>
<h1>��������Ʈ</h1>
<hr>
<table border="1">
	<tr>
		<th>������ȣ</th><th>���ž��̵�</th><th>�۽ž��̵�</th><th>��������</th><th>�ۼ���</th><th>�б⿩��</th>
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
<a href="${pageContext.request.contextPath}/delete.do?userId=${vo.userId}">���� ����</a> |
<a href="${pageContext.request.contextPath}/user/sendMsgList.do?userId=${vo.userId}">���� �ۼ�</a>
<hr>
<a href="${pageContext.request.contextPath }/main/layout.jsp">Ȩ����</a>
</body>
</html>