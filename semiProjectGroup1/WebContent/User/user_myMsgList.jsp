<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
var userChkId = "";
var xhr = null;
function checkUser() {
	var userId = document.getElementsByName("userId")[0];
	if(userId.value.length < 4 ){
		alert("���̵�� �ּ� 5�ڷ� �Է��ϼ���.");
		userId.value.focus();
		return false;
	}
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=checkUserResult;
	xhr.open("post","${pageContext.request.contextPath}/user/check.do",true);	
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("userId=" + userId.value);
}
function checkUserResult() {
	if(xhr.readyState==4 && xhr.status==200){
		var data=xhr.responseText;
		var result=eval("(" + data +")");
		if (result.code == "success") {
			document.getElementById("userChk_res").innerHTML='<font color="gray" id="userChk_ok">��� ������ ID �Դϴ�.</font>';
		} else {
			document.getElementById("userChk_res").innerHTML='<font color="red" id="userChk_fail">�������� �ʴ� ID �Դϴ�.</font>';
		}
		userChkId = document.getElementsByName("userId")[0].value;
	}
}
function sendMessage() {
	var userId = document.getElementsByName("userId")[0];
	if(userId.value.length < 4 ){
		alert("���̵�� �ּ� 5�ڷ� �Է��ϼ���.");
		userId.focus();
		return false;
	}
	var userChk = document.getElementById("userChk_ok");
	if(userChkId != userId.value || userChk == null || userChk.length == 0 ){
		alert("���̵� Ȯ���� ���ּ���.");
		userId.focus();
		return false;
	}
	userChkId = userId.value;
	var content = document.getElementsByName("content")[0];
	if(content.value.length == 0 ){
		alert("���� ������ �Է��ϼ���.");
		content.focus();
		return false;
	}
	var contHtml = content.value.replace(/\r/g,'').replace(/\n/g,'<br/>');
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=sendMessageResult;
	xhr.open("post","${pageContext.request.contextPath}/user/msgSendForm.do",true);	
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("sendUserId=${userId}&receiveUserId=" + userId.value+"&content="+contHtml);
}
function sendMessageResult() {
	if(xhr.readyState==4 && xhr.status==200){
		var data=xhr.responseText;
		var result=eval("(" + data +")");
		if (result.code == "success") {
			alert("������ ���½��ϴ�.");
			document.location="${pageContext.request.contextPath}/user/msgSendList.do?userId=${userId}";
		} else {
			alert("������ �߻��߽��ϴ�.");
		}
	}
}
function deleteMessage(num){
	if(!confirm("������ ���� �Ͻðڽ��ϱ�?")) {
		return false;
	}
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=deleteMessageResult;
	xhr.open("post","${pageContext.request.contextPath}/user/msgDelete.do",true);	
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("msgNum="+num+"&userId=${userId}");
}
function deleteMessageResult() {
	if(xhr.readyState==4 && xhr.status==200){
		var data=xhr.responseText;
		var result=eval("(" + data +")");
		if (result.code == "success") {
			alert("������ ���� �Ͽ����ϴ�.");
			location.reload();
		} else {
			alert("������ �߻��߽��ϴ�.");
		}
	}
}
function detailMessage(num){
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=detailFormHtml;
	xhr.open("get","${pageContext.request.contextPath}/user/msg${type=='SEND'?'Send':'Receive'}Detail.do?msgNum="+num,true);
	xhr.send();
}
function detailSendForm(){
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=detailFormHtml;
	xhr.open("get","${pageContext.request.contextPath}/user/msgSendForm.do",true);
	xhr.send();
}
function detailFormHtml(){
	if(xhr.readyState==4 && xhr.status==200){
		var resHtml=xhr.responseText;
		document.getElementById("msg_detail").innerHTML=resHtml;
	}
}
function detailClose() {
	document.getElementById("msg_detail").innerHTML="";
}
</script>
</head>
<body>
<h1>
<a href="${pageContext.request.contextPath}/user/msgReceiveList.do?userId=${userId}" style="${type=='SEND' ? 'color:gray;font-weight:normal;font-size:20px;' : ''}">����������</a>
 | <a href="${pageContext.request.contextPath}/user/msgSendList.do?userId=${userId}" style="${type!='SEND' ? 'color:gray;font-weight:normal;font-size:20px;' : ''}">����������</a>
</h1>
<hr>
<div style="float: left;">
	<table border="1" style="width:600px; table-layout:fixed;">
		<tr>
			<th>${type=="SEND" ? "�������" : "�������"}</th>
			<th style="width:200px;">��������</th>
			<th>�ۼ���</th>
			<c:if test="${type=='SEND'}"><th>�б⿩��</th></c:if>
			<th>����</th>
		</tr>
		<c:forEach var="vo" items="${list}">
		<tr>
			<td>${type=="SEND" ? vo.receiveUserId : vo.sendUserId}</td>
			<td onclick="detailMessage(${vo.msgNum})" width="200" style="width:200px;text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
				<a href="#"><nobr>${vo.msgContent.replace("<br/>","")}</nobr></a>
			</td>
			<td>${vo.msgWdate}</td>
			<c:if test="${type=='SEND'}"><td>${vo.msgCheck > 0 ? "����" : "������"}</td></c:if>
			<td><a href="${pageContext.request.contextPath}/user/msgDelete.do?msgNum=${vo.msgNum}">����</a></td>
		</tr>
		</c:forEach>
	</table>
	<div>
	<c:if test="${type=='RECEIVE'}">
	<c:choose>
		<c:when test="${startPage>10 }">
			<a href="${cp }/user/msgReceiveList.do?pageNum=${startPage-1}">[����]</a>
		</c:when>
		<c:otherwise>
			[����]
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
			<c:when test="${pageNum==i }">
				<a href="${cp }/user/msgReceiveList.do?pageNum=${i}&userId=${userId}"><span style="color:pink">[${i }]</span></a>	
			</c:when>
			<c:otherwise>
				<a href="${cp }/user/msgReceiveList.do?pageNum=${i}&userId=${userId}"><span style="color:#999">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${endPage<pageCount}">
			<a href="${cp }/user/msgReceiveList.do?pageNum=${endPage+1}">[����]</a>
		</c:when>
		<c:otherwise>
			[����]
		</c:otherwise>
	</c:choose>
	</c:if>
	</div>
	<div>
<c:if test="${type=='SEND'}">
	<c:choose>
		<c:when test="${startPage>10 }">
			<a href="${cp }/user/msgSendList.do?pageNum=${startPage-1}">[����]</a>
		</c:when>
		<c:otherwise>
			[����]
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
			<c:when test="${pageNum==i }">
				<a href="${cp }/user/msgSendList.do?pageNum=${i}&userId=${userId}"><span style="color:pink">[${i }]</span></a>	
			</c:when>
			<c:otherwise>
				<a href="${cp }/user/msgSendList.do?pageNum=${i}&userId=${userId}"><span style="color:#999">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${endPage<pageCount}">
			<a href="${cp }/user/msgSendList.do?pageNum=${endPage+1}">[����]</a>
		</c:when>
		<c:otherwise>
			[����]
		</c:otherwise>
	</c:choose>
		</c:if>
</div>
</div>
<br>
<div style="float: right;" id="msg_detail"></div>
<div style="clear:both; display:block; ">
	<br/>
	<input type="button" value="����������" onclick="detailSendForm()" />
	<hr/>
	<a href="${pageContext.request.contextPath}/main/layout.jsp">Ȩ����</a>
</div>
</body>
</html>