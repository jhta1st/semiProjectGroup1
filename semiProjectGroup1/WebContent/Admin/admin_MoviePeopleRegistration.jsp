<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<form method="post" action="${pageContext.request.contextPath }/admin/peopleRegistration.do" enctype="multipart/form-data">
	인물명<input type="text" id="charName" name="charName" /><br>
	인물사진<input type="file" name="file" /><br>
	<input type="submit" value="등록"><input type="button" value="뒤로" onclick="javascript:history.go(-1)">
</form>
</body>