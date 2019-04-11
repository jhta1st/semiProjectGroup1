<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/JS/adminjavascript"></script>
<div>
	<form method="post" action="${cp }/admin/movieUrlUpdate.do">
		<input type="hidden" id="movieNum" name="movieNum" value="${movieInfoVo.movieNum }"> 
		<input type="hidden" id="urlNum" name="urlNum" value="${urlVo.urlNum }"> 
		<label for="movieInfo">영화명</label><input type="text" id="movieInfo" value=${movieInfoVo.movieName } readonly="readonly">
		<br>
		<label>URL유형</label>
		<select name="urlType">
			<option value="1" <c:if test="${urlVo.urlType==1 }">selected</c:if>>예고편</option>
			<option value="2" <c:if test="${urlVo.urlType==2 }">selected</c:if>>하이라이트</option>
		</select>
		<br>
		<label for="urlAddr">URL주소</label>
		<textarea rows="5" cols="100%" id="urlAddr" name="urlAddr">${urlVo.urlAddr }</textarea>
		<br>
		<input type="submit" value="수정" /><input type="button" value="취소" onclick="javascript:history.go(-1);">
	</form>
	<div id="result">${errMsg }</div>
</div>