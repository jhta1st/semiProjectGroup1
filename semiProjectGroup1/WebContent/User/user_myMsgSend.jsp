<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<table border="1">
	<tr>
		<td>�������</td>
		<td><input type="text" id="userId" name="userId" value="" /> <input type="button" value="Ȯ��" onclick="checkUser()" /><span id="userChk_res"></span></td>
	</tr>
	<tr>
		<td>��������</td>
		<td><textarea rows="5" cols="50" id="content" name="content"></textarea></td>
	</tr>
</table>
<input type="button" value="������" onclick="sendMessage()" />
<input type="button" value="���" onclick="detailClose()" />