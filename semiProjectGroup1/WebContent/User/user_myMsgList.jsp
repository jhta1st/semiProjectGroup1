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
		alert("아이디는 최소 5자로 입력하세요.");
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
			document.getElementById("userChk_res").innerHTML='<font color="gray" id="userChk_ok">사용 가능한 ID 입니다.</font>';
		} else {
			document.getElementById("userChk_res").innerHTML='<font color="red" id="userChk_fail">존재하지 않는 ID 입니다.</font>';
		}
		userChkId = document.getElementsByName("userId")[0].value;
	}
}
function sendMessage() {
	var userId = document.getElementsByName("userId")[0];
	if(userId.value.length < 4 ){
		alert("아이디는 최소 5자로 입력하세요.");
		userId.focus();
		return false;
	}
	var userChk = document.getElementById("userChk_ok");
	if(userChkId != userId.value || userChk == null || userChk.length == 0 ){
		alert("아이디 확인을 해주세요.");
		userId.focus();
		return false;
	}
	userChkId = userId.value;
	var content = document.getElementsByName("content")[0];
	if(content.value.length == 0 ){
		alert("쪽지 내용을 입력하세요.");
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
			alert("쪽지를 보냈습니다.");
			document.location="${pageContext.request.contextPath}/user/msgSendList.do?userId=${userId}";
		} else {
			alert("오류가 발생했습니다.");
		}
	}
}
function deleteMessage(num){
	if(!confirm("쪽지를 삭제 하시겠습니까?")) {
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
			alert("쪽지를 삭제 하였습니다.");
			location.reload();
		} else {
			alert("오류가 발생했습니다.");
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
<a href="${pageContext.request.contextPath}/user/msgReceiveList.do?userId=${userId}" style="${type=='SEND' ? 'color:gray;font-weight:normal;font-size:20px;' : ''}">받은쪽지함</a>
 | <a href="${pageContext.request.contextPath}/user/msgSendList.do?userId=${userId}" style="${type!='SEND' ? 'color:gray;font-weight:normal;font-size:20px;' : ''}">보낸쪽지함</a>
</h1>
<hr>
<div style="float: left;">
	<table border="1" style="width:600px; table-layout:fixed;">
		<tr>
			<th>${type=="SEND" ? "받은사람" : "보낸사람"}</th>
			<th style="width:200px;">쪽지내용</th>
			<th>작성일</th>
			<c:if test="${type=='SEND'}"><th>읽기여부</th></c:if>
			<th>삭제</th>
		</tr>
		<c:forEach var="vo" items="${list}">
		<tr>
			<td>${type=="SEND" ? vo.receiveUserId : vo.sendUserId}</td>
			<td onclick="detailMessage(${vo.msgNum})" width="200" style="width:200px;text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
				<a href="#"><nobr>${vo.msgContent.replace("<br/>","")}</nobr></a>
			</td>
			<td>${vo.msgWdate}</td>
			<c:if test="${type=='SEND'}"><td>${vo.msgCheck > 0 ? "읽음" : "안읽음"}</td></c:if>
			<td><a href="${pageContext.request.contextPath}/user/msgDelete.do?msgNum=${vo.msgNum}">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
	<div>
	<c:if test="${type=='RECEIVE'}">
	<c:choose>
		<c:when test="${startPage>10 }">
			<a href="${cp }/user/msgReceiveList.do?pageNum=${startPage-1}">[이전]</a>
		</c:when>
		<c:otherwise>
			[이전]
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
			<a href="${cp }/user/msgReceiveList.do?pageNum=${endPage+1}">[다음]</a>
		</c:when>
		<c:otherwise>
			[다음]
		</c:otherwise>
	</c:choose>
	</c:if>
	</div>
	<div>
<c:if test="${type=='SEND'}">
	<c:choose>
		<c:when test="${startPage>10 }">
			<a href="${cp }/user/msgSendList.do?pageNum=${startPage-1}">[이전]</a>
		</c:when>
		<c:otherwise>
			[이전]
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
			<a href="${cp }/user/msgSendList.do?pageNum=${endPage+1}">[다음]</a>
		</c:when>
		<c:otherwise>
			[다음]
		</c:otherwise>
	</c:choose>
		</c:if>
</div>
</div>
<br>
<div style="float: right;" id="msg_detail"></div>
<div style="clear:both; display:block; ">
	<br/>
	<input type="button" value="쪽지보내기" onclick="detailSendForm()" />
	<hr/>
	<a href="${pageContext.request.contextPath}/main/layout.jsp">홈으로</a>
</div>
</body>
</html>