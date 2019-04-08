<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<table border="1">
	<tr>
		<td>받을사람</td>
		<td><input type="text" id="userId" name="userId" value="" /> <input type="button" value="확인" onclick="checkUser()" /><span id="userChk_res"></span></td>
	</tr>
	<tr>
		<td>쪽지내용</td>
		<td><textarea rows="5" cols="50" id="content" name="content"></textarea></td>
	</tr>
</table>
<input type="button" value="보내기" onclick="sendMessage()" />
<input type="button" value="취소" onclick="detailClose()" />