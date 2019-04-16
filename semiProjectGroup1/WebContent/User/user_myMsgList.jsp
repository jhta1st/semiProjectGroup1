<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#mypage {
		padding-top:10px;
		padding-bottom: 10px;
		width: 100%;
		margin: auto;
		background-color: #cecece;
	}
	#mypage #mypageForm {
	    margin:auto;
	    width:50%;
		border: 1px solid silver;
		background-color: white;
		border-radius:25px;
	}
	#mypage #mypageForm #set {
	     margin-left : 150px;
	}
	#mypage #mypageForm #set1 {
	     margin-right : 150px;
	}

.userMypageDeleteBtn{
	font-weight:bold;
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	background:#787878;
	background:-o-linear-gradient(90deg, #787878, #454545);
	background:-moz-linear-gradient( center top, #787878 5%, #454545 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #787878), color-stop(1, #454545) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#787878', endColorstr='#454545');
	background:-webkit-linear-gradient(#787878, #454545);
	background:-ms-linear-gradient(#787878, #454545);
	background:linear-gradient(#787878, #454545);
	text-indent:0px;
	line-height:0px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:12px;
	color:white;
	width:63px;
	height:0px;
	padding:13px;
	border-color:#2e2e2e;
	border-width:1px;
	border-style:solid;
}
.userMypageDeleteBtn a:link{
	color: white;
}

.userMypageDeleteBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.userMypageDeleteBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}

.userMypageUpdateBtn {
	font-weight:bold;
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	background:#787878;
	background:-o-linear-gradient(90deg, #787878, #454545);
	background:-moz-linear-gradient( center top, #787878 5%, #454545 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #787878), color-stop(1, #454545) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#787878', endColorstr='#454545');
	background:-webkit-linear-gradient(#787878, #454545);
	background:-ms-linear-gradient(#787878, #454545);
	background:linear-gradient(#787878, #454545);
	text-indent:0px;
	line-height:0px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:12px;
	color:#f7f7f7;
	width:100px;
	height:0px;
	padding:13px;
	border-color:#2e2e2e;
	border-width:1px;
	border-style:solid;
}

.userMypageUpdateBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.userMypageUpdateBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}
.myPageTable {
	border:1px solid silver;
	border-radius:25px;
	margin: auto;
	margin-top: 25px;
	margin-bottom: 25px;
	text-align:center;
	vertical-align:middle;
	width: 50%;
	background-color: white; 
	text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.1);
}
.myPageTable tr td {
	border-bottom: none;
}
.myPageTable a{
	color: black;
}
.myPageTable a:link {
	text-decoration: none;
}
.myPageTable a:visited {
	color: black;
	text-decoration: none;
}
.myPageBtns{
	text-align: center;
	margin-bottom: 40px;
}
.allBlack{
	color:black;
	text-decoration: none;
}
.allBlack a{
	color:black;
	text-decoration: none;
}
.allBlack a:link{
	color:black;
	text-decoration: none;
}
.allBlack a:visited{
	color:black;
	text-decoration: none;
}
</style>
<script>
var userChkId = "";
var xhr = null;
function checkUser() {
	var userId = document.getElementsByName("userId")[0];
	if(userId.value.length < 4 ){
		document.getElementById("userChk_res").innerHTML='<font color="red" id="userChk_ok">아이디는 최소 5자로 입력하세요.</font>';
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
		document.getElementById("userChk_res").innerHTML='<font color="red" id="userChk_ok">아이디는 최소 5자로 입력하세요.</font>';
		userId.focus();
		return false;
	}
	var userChk = document.getElementById("userChk_ok");
	if(userChkId != userId.value || userChk == null || userChk.length == 0 ){
		document.getElementById("userChk_res").innerHTML='<font color="red" id="userChk_ok">아이디 확인을 해주세요.</font>';
		userId.focus();
		return false;
	}
	userChkId = userId.value;
	var content = document.getElementsByName("content")[0];
	if(content.value.length == 0 ){
		document.getElementById("userChk_res").innerHTML='<font color="red" id="userChk_ok">쪽지 내용을 입력하세요.</font>';
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
			document.location="${pageContext.request.contextPath}/user/msgSendList.do?userId=${userId}&errMsg=쪽지를 보냈습니다.";
		} else {
			document.location="${pageContext.request.contextPath}/user/msgSendList.do?userId=${userId}&errMsg=오류가 발생했습니다.";
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
		var msgSendBtn=document.getElementById("msgSendBtn");
		msgSendBtn.style="display:none;";
	}
}
function detailClose() {
	document.getElementById("msg_detail").innerHTML="";
	msgSendBtn.style="";
}
</script>
<div id="myMsg" class="FreeBoardTableDiv">
	<div class="myPageBtns">
		<div id="errMsg" style="text-align: center;"><p>${param.errMsg }</p></div>
		<div>
			<a class="userMypageDeleteBtn" href="${pageContext.request.contextPath}/user/msgReceiveList.do?userId=${userId}">받은쪽지함</a> <a class="userMypageDeleteBtn" href="${pageContext.request.contextPath}/user/msgSendList.do?userId=${userId}">보낸쪽지함</a>
			<table class="myPageTable">
				<tr>
					<th>${type=="SEND" ? "받은사람" : "보낸사람"}</th>
					<th>쪽지내용</th>
					<th>작성일</th>
					<c:if test="${type=='SEND'}">
						<th>읽기여부</th>
					</c:if>
					<th>삭제</th>
				</tr>
				<c:choose>
					<c:when test="${list[0]==null && type=='SEND'}">
						<tr><td colspan="5"><p style="text-align: center;">쪽지가 없습니다.</p></td></tr>
					</c:when>
					<c:when test="${list[0]==null}">
						<tr><td colspan="4"><p style="text-align: center;">쪽지가 없습니다.</p></td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${type=="SEND" ? vo.receiveUserId : vo.sendUserId}</td>
								<td onclick="detailMessage(${vo.msgNum})">
									<a style="color:black;" href="#"><nobr>${vo.msgContent.replace("<br/>","")}</nobr></a>
								</td>
								<td>${vo.msgWdate}</td>
								<c:if test="${type=='SEND'}">
									<td>${vo.msgCheck > 0 ? "읽음" : "안읽음"}</td>
								</c:if>
								<td>
									<input class="Btn" type="button" value="삭제" onclick="javascript:location.href='${pageContext.request.contextPath}/user/msgDelete.do?msgNum=${vo.msgNum}'">
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<div>
				<c:if test="${type=='RECEIVE'}">
					<c:choose>
						<c:when test="${startPage>10 }">
							<a href="${cp }/user/msgReceiveList.do?pageNum=${startPage-1}">[이전]</a>
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:choose>
							<c:when test="${pageNum==i }">
								<a class="allBlack" href="${cp }/user/msgReceiveList.do?pageNum=${i}&userId=${userId}"><span class="thisPage">[${i }]</span></a>
							</c:when>
							<c:otherwise>
								<a class="allBlack" href="${cp }/user/msgReceiveList.do?pageNum=${i}&userId=${userId}"><span class="otherPage">[${i }]</span></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${endPage<pageCount}">
							<a href="${cp }/user/msgReceiveList.do?pageNum=${endPage+1}">[다음]</a>
						</c:when>
					</c:choose>
				</c:if>
			</div>
			<div>
				<c:if test="${type=='SEND'}">
					<c:choose>
						<c:when test="${startPage>10 }">
							<a href="${cp }/user/msgSendList.do?pageNum=${startPage-1}">[이전]</a>
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:choose>
							<c:when test="${pageNum==i }">
								<a class="allBlack" href="${cp }/user/msgSendList.do?pageNum=${i}&userId=${userId}"><span class="thisPage">[${i }]</span></a>
							</c:when>
							<c:otherwise>
								<a class="allBlack" href="${cp }/user/msgSendList.do?pageNum=${i}&userId=${userId}"><span class="otherPage">[${i }]</span></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${endPage<pageCount}">
							<a href="${cp }/user/msgSendList.do?pageNum=${endPage+1}">[다음]</a>
						</c:when>
					</c:choose>
				</c:if>
			</div>
		</div>
		<br>
		<div id="msg_detail"></div>
		<div>
			<br />
			<input id="msgSendBtn" class="userMypageUpdateBtn" type="button" value="쪽지보내기" onclick="detailSendForm()" /><br><br>
			<a class="userMypageDeleteBtn" href="${pageContext.request.contextPath}/main/home.do">홈으로</a>
		</div>
	</div>
</div>
