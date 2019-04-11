<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var fileCount = 1;
	function fileUploadPlus() {
		var fileDiv = document.createElement("div");
		var fileInput = document.createElement("input");
		fileInput.type = "file";
		fileInput.name = "file" + fileCount;
		fileInput.id = "file" + fileCount;
		fileInput.onchange = fileCheck;
		fileDiv.appendChild(fileInput);
		var fileDelete = document.createElement("input");
		fileDelete.type = "button";
		fileDelete.value = "첨부파일삭제";
		fileDelete.id = "fileDelete" + fileCount;
		fileDelete.onclick = fileUploadDelete;
		fileDiv.appendChild(fileDelete);
		var fileCheckDiv = document.getElementById("fileCheckDiv");
		fileCheckDiv.appendChild(fileDiv);
		document.getElementById("file" + fileCount).click();
	}
	function fileUploadDelete(e) {
		var child = e.target.parentNode;
		var div = document.getElementById("fileUploadPlusArea");
		div.removeChild(child);
	}
	function fileCheck(e) {
		var div = document.getElementById("fileUploadPlusArea");
		div.appendChild(e.target.parentNode);
		fileCount++;
	}
</script>
<div>
	<div style="border: 2px solid black; width: 800px;">
		<form method="post" action="${cp }/FreeBoard/write.do" enctype="multipart/form-data">
			<div>
				<input type="text" size="100%" name="freeBoardTitle">
			</div>
			<div>
				<textarea rows="30" cols="100%" draggable="false" name="freeBoardContent"></textarea>
			</div>
			<div id="fileUploadPlusArea"></div>
			<div>
				<input type="button" value="파일첨부하기" onclick="fileUploadPlus();">
				<br>
				<input type="hidden" name="userId" value="${sessionScope.id }"> <input type="submit" value="전송"><input type="button" value="취소" onclick="javascript:history.go(-1);">
			</div>
		</form>
		<div id="fileCheckDiv" style="display: none;"></div>
	</div>
</div>