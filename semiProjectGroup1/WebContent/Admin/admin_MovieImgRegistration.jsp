<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<form method="post" action="${pageContext.request.contextPath }/admin/imgRegistration.do" enctype="multipart/form-data">
	영화명<input type="text" id="movieInfo" name="movieInfo" /><input type="button" value="검색" onclick=""><br>
	<label>이미지유형
	<select name="imageType">
		<option value="1">메인이미지</option>
		<option value="2">포스터</option>
		<option value="3">스틸삿</option>
	</select></label><br>
	이미지첨부파일<input type="file" name="file"><br/>
	<input type="submit" value="등록" /><input type="reset" value="취소" />
</form>
</body>