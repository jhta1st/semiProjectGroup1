<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form method="post" action="${cp }/main/login.do">
	<label for="id">아이디</label><input type="text" id="id" name="id" value="${id }">
	<br>
	<label for="pwd">비밀번호</label><input type="password" id="pwd" name="pwd" value="${pwd }">
	<br>
	<div>${errMsg }</div>
	<input type="submit" value="로그인">
</form>