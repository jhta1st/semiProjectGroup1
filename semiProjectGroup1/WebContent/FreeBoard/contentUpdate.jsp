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
	function fileUploadUpdateDelete(e) {
		var child = e.target.parentNode;
		var div = document.getElementById("fileUploadPlusArea");
		div.removeChild(child);
		var fileCheckDiv = document.getElementById("fileDeleteCheckDiv");
		fileDeleteCheckDiv.appendChild(child);
		var firstchild = child.firstChild;
		firstchild.disabled = false;
	}
</script>
<div class="FreeBoardContentUpdateDiv">
	<div>
		<form method="post" action="${cp }/FreeBoard/ContentUpdate.do" enctype="multipart/form-data">
			<div class="FreeBoardContentDiv">
				<input class="silverRadius" type="text" style="height: 37px" size="99%" name="freeBoardTitle" value="${vo.freeBoardTitle }">
				<input type="hidden" name="pageNum" value="${pageNum }">
			</div>
			<div >
				<textarea class="silverRadius" rows="30" cols="100%" name="freeBoardContent">${vo.freeBoardContent }</textarea>
			</div>
			<div id="fileUploadPlusArea">
				<c:forEach var="list" items="${vo1}">
					<div><input type="hidden" name="freeBoardImgNum" disabled="disabled" value="${list.freeBoardImgNum }"> <input class="textType" type="text" disabled="disabled" value="${list.freeBoardOrgImgName }"> <button type="button" onclick="fileUploadUpdateDelete(event);"><img src="${cp }/ETC/icons/delete.png"></button>
					</div>
				</c:forEach>
			</div>
			<div id="fileDeleteCheckDiv" style="display: none;"></div>
			<div class="filePlusDiv">
				<input class="Btn" type="button" value="첨부" onclick="fileUploadPlus();">
			</div>
			<div>
				<input type="hidden" name="freeBoardNum" value="${vo.freeBoardNum }"> <input class="Btn" type="submit" value="수정"> <input class="Btn" type="button" value="취소" onclick="javascript:history.go(-1);">
			</div>
		</form>
		<div id="fileCheckDiv" style="display: none;"></div>
		</div>
</div>