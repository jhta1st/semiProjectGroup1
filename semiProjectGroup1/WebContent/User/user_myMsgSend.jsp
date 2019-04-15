<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table border="1">
	<tr>
		<td>받을사람</td>
		<td>
			<input type="text" id="userId" name="userId" value="${param.userId }" /> <input type="button" value="확인" onclick="checkUser()" /><span id="userChk_res"></span>
		</td>
	</tr>
	<tr>
		<td>쪽지내용</td>
		<td>
			<textarea rows="5" cols="50" id="content" name="content"></textarea>
		</td>
	</tr>
</table>
<input type="button" value="보내기" onclick="sendMessage()" />
<input type="button" value="취소" onclick="detailClose()" />