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
		fileDelete.className= "Btn";
		fileDelete.value = "삭제";
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
<div class="FreeBoardContentUpdateDiv">
	<div class="FreeBoardContentDiv">
		<form method="post" action="${cp }/FreeBoard/write.do" enctype="multipart/form-data">
			<div>
				<input class="silverRadius" type="text" style="height: 37px" size="99%" name="freeBoardTitle">
			</div>
			<div>
				<textarea class="silverRadius" rows="30" cols="100%" name="freeBoardContent"></textarea>
			</div>
			<div id="fileUploadPlusArea"></div>
			<div>
				<input class="Btn" type="button" value="첨부" onclick="fileUploadPlus();">
				<br>
				<input class="Btn" type="hidden" name="userId" value="${sessionScope.id }"> <input class="Btn" type="submit" value="전송"><input class="Btn" type="button" value="취소" onclick="javascript:history.go(-1);">
			</div>
		</form>
		<div id="fileCheckDiv" style="display: none;"></div>
	</div>
</div>