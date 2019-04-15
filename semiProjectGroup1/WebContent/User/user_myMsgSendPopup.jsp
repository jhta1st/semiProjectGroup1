<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form method="post" action="${pageContext.request.contextPath}/user/msgSendForm.do">
<script type="text/javascript">
	function sendMessage() {
		var receiveUserId = document.getElementsByName("receiveUserId")[0];
		var content = document.getElementsByName("content")[0];
		if(content.value.length == 0 ){
			alert("쪽지 내용을 입력하세요.");
			content.focus();
			return false;
		}
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=sendMessageResult;
		xhr.open("post","${pageContext.request.contextPath}/user/msgSendForm.do",true);	
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("sendUserId=${sessionScope.id}&receiveUserId=" + receiveUserId.value+"&content="+content.value);
	}
	function sendMessageResult() {
		if(xhr.readyState==4 && xhr.status==200){
			var data=xhr.responseText;
			var result=eval("(" + data +")");
			if (result.code == "success") {
				alert("쪽지를 보냈습니다.");
				self.close();
			} else {
				alert("오류가 발생했습니다.");
			}
		}
	}
</script>
	<table border="1">
		<tr>
			<td>받을사람</td>
			<td>
				<input type="text"  disabled="disabled" value="${param.userId }" />
				<input type="hidden" name="receiveUserId" value="${param.userId }" />
				<input type="hidden"id="userId" name="userId" value="${sessionScope.id }" />
			</td>
		</tr>
		<tr>
			<td>쪽지내용</td>
			<td>
				<textarea rows="5" cols="50" id="content" name="content"></textarea>
			</td>
		</tr>
	</table>
	<input type="button" value="보내기" onclick="sendMessage()"/>
</form>
