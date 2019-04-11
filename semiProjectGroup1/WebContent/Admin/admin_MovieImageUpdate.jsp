<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="${cp }/admin/MovieImgUpdate.do" enctype="multipart/form-data">
	<input type="hidden" id="movieNum" name="movieNum" value="${vo1.movieNum }">
	<input type="hidden" id="imageNum" name="imageNum" value="${vo1.imageNum }">
	<label>이미지유형 
	<select name="imageType">
		<option value="1">메인이미지</option>
		<option value="2">포스터</option>
		<option value="3">스틸삿</option>
	</select></label><br>
	기존파일 <input type="text" disabled="disabled" id="imageOrgName" value="${ vo1.imageOrgName}"><br>
	이미지첨부파일<input type="file" name="file2"><br/>
	<input type="submit" value="수정" /><input type="button" value="취소">
</form>
</body>
</html>