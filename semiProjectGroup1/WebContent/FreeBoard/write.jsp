<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form method="post" action="${cp }/FreeBoard/write.do" onchange="">
		<table border="1" width="500px">
			<tr><td><input type="text" size="100%" name="freeBoardTitle"></td></tr>
			<tr><td><textarea rows="30" cols="100%" draggable="false" name="freeBoardContent"></textarea></td></tr>
			<tr><td><input type="file" name="file1"></td></tr>
			<tr><td colspan="2">
				<input type="hidden" name="userId" value="Master"><!-- value="${sessionScope.UserId } -->
				<input type="submit" value="전송" class="inputb"><input type="button" value="취소" onclick="javascript:history.go(-1);">
			</td></tr>
		</table>		
		</form>
	</div>
</body>
</html>