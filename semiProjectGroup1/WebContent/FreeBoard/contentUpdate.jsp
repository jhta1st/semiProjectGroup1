<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form method="post" action="${cp }/FreeBoard/ContentUpdate.do">
		<table border="1" width="500px">
			<tr><td><input type="text" size="100%" name="freeBoardTitle" value="${vo.freeBoardTitle }"></td></tr>
			<tr><td><textarea rows="30" cols="100%" draggable="false" name="freeBoardContent">${vo.freeBoardContent }</textarea></td></tr>
			<tr><td><input type="file" name="file1"></td></tr>
			<tr><td colspan="2">
				<input type="hidden" name="freeBoardNum" value="${vo.freeBoardNum }">
				<input type="submit" value="수정" class="inputb"><input type="button" value="취소" onclick="javascript:history.go(-1);">
			</td></tr>
		</table>		
		</form>
	</div>
</body>
</html>