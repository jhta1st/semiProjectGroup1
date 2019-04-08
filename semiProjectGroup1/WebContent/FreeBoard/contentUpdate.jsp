<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var fileCount=1;
	function fileUploadPlus(){
		var fileDiv=document.createElement("div");
		var fileInput=document.createElement("input");
			fileInput.type="file";
			fileInput.name="file"+fileCount;
			fileInput.id="file"+fileCount;
			fileInput.onchange=fileCheck;
			fileDiv.appendChild(fileInput);
		var fileDelete=document.createElement("input");
			fileDelete.type="button";
			fileDelete.value="첨부파일삭제";
			fileDelete.id="fileDelete"+fileCount;
			fileDelete.onclick=fileUploadDelete;
			fileDiv.appendChild(fileDelete);
		var fileCheckDiv=document.getElementById("fileCheckDiv");
		fileCheckDiv.appendChild(fileDiv);
		document.getElementById("file"+fileCount).click();
	}
	function fileUploadDelete(e){
		var child=e.target.parentNode;
		var div=document.getElementById("fileUploadPlusArea");
		div.removeChild(child);
	}
	function fileCheck(e){
		var div=document.getElementById("fileUploadPlusArea");
		div.appendChild(e.target.parentNode);
		fileCount++;
	}
	function fileUploadUpdateDelete(e){
		var child=e.target.parentNode;
		var div=document.getElementById("fileUploadPlusArea");
		div.removeChild(child);
		var fileCheckDiv=document.getElementById("fileDeleteCheckDiv");
		fileDeleteCheckDiv.appendChild(child);
		var firstchild=child.firstChild;
		firstchild.disabled=false;
	}
</script>
</head>
<body>
	<div style="border: 2px solid black; width: 800px;">
		<form method="post" action="${cp }/FreeBoard/ContentUpdate.do" enctype="multipart/form-data">
			<div><input type="text" size="100%" name="freeBoardTitle" value="${vo.freeBoardTitle }"></div>
			<div><textarea rows="30" cols="100%" draggable="false" name="freeBoardContent">${vo.freeBoardContent }</textarea></div>
			<div id="fileUploadPlusArea">
				<c:forEach var="list" items="${vo1}">
					<div><input type="hidden" name="freeBoardImgNum" disabled="disabled" value="${list.freeBoardImgNum }">
						<input type="text" disabled="disabled" value="${list.freeBoardOrgImgName }">
						<input type="button" value="삭제" onclick="fileUploadUpdateDelete(event);">
					</div>
				</c:forEach>
			</div>
			<div id="fileDeleteCheckDiv" style="display: none;"></div>
			<div>
				<input type="button" value="파일첨부하기" onclick="fileUploadPlus();"><br>
				<input type="hidden" name="freeBoardNum" value="${vo.freeBoardNum }">
				<input type="submit" value="수정"><input type="button" value="취소" onclick="javascript:history.go(-1);">
			</div>						
		</form>		
		<div id="fileCheckDiv" style="display: none;"></div>	
	</div>
</body>
</html>