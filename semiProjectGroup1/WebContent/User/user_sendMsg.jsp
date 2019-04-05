<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/User/user_sendMsg.jsp</title>
<script type="text/javascript">
	var xhr=null;
	function idcheck(){
		var sendUserId=document.getElementById("sendUserId").value;
		if(sendUserId=="" || sendUserId.trim()==""){
			document.getElementById("userIdcheck").innerHTML="";
			return;
		}
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=success;
		xhr.open('post', '${cp}/user/sendMsgList.do', true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		var param="sendUserId="+sendUserId;
		xhr.send(param);
	}
	function success(){
		if(xhr.readyState==4 && xhr.status==200){
			var data=xhr.responseText;
			var userIdcheck=document.getElementById("userIdcheck");
			var result=eval("(" + data + ")");
			idcheck.innerHTML=result.msg;
		}
	}
</script>
</head>
<body>
<h1>쪽지보내기</h1>
<form method="post" action="">
	보낼 아이디<input type="text" name="receiveUserId" id="receiveUserId">
	받는 아이디<input type="text" name="sendUserId" id="sendUserId">
	<input type="button" value="송신가능여부" onclick="userIdcheck()">
	<span id="idcheck" style="color:red; font-size: 12px;"></span><hr>
	쪽지내용 <input type="password" name="pwd"><hr>
	<input type="submit" value="송신"><input type="reset" value="취소"><hr>
</form>
</body>
</html>