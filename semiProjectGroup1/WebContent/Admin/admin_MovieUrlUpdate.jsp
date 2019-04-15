<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.adminMovieUrlUpdateBtn {
	font-weight:bold;
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	background:#787878;
	background:-o-linear-gradient(90deg, #787878, #454545);
	background:-moz-linear-gradient( center top, #787878 5%, #454545 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #787878), color-stop(1, #454545) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#787878', endColorstr='#454545');
	background:-webkit-linear-gradient(#787878, #454545);
	background:-ms-linear-gradient(#787878, #454545);
	background:linear-gradient(#787878, #454545);
	text-indent:0px;
	line-height:0px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:12px;
	color:#f7f7f7;
	width:63px;
	height:0px;
	padding:13px;
	border-color:#2e2e2e;
	border-width:1px;
	border-style:solid;
}

.adminMovieUrlUpdateBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.adminMovieUrlUpdateBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}
.url{
	margin-left: 65px;
}
.url1{
	margin-left: 50px;
}
.url2{
	margin-left: 50px;
}
</style>
<script type="text/javascript" src="${cp }/JS/adminjavascript"></script>
<div>
	<form method="post" action="${cp }/admin/movieUrlUpdate.do">
	<hr/>
		<input type="hidden" id="movieNum" name="movieNum" value="${movieInfoVo.movieNum }"> 
		<input type="hidden" id="urlNum" name="urlNum" value="${urlVo.urlNum }"> 
		<label for="movieInfo">영화명 </label><input class="url" type="text" id="movieInfo" value=${movieInfoVo.movieName } readonly="readonly">
		<br/><br/>
		<label>URL유형 </label>
		<select class="url1" name="urlType">
			<option value="1" <c:if test="${urlVo.urlType==1 }">selected</c:if>>예고편</option>
			<option value="2" <c:if test="${urlVo.urlType==2 }">selected</c:if>>하이라이트</option>
		</select>
		<br/><br/>
		<label for="urlAddr">URL주소 </label>
		<textarea class="url2" rows="5" cols="100%" id="urlAddr" name="urlAddr">${urlVo.urlAddr }</textarea>
		<br/><hr/>
		<input class="adminMovieUrlUpdateBtn" type="submit" value="수정" /> | <input class="adminMovieUrlUpdateBtn" type="button" value="취소" onclick="javascript:history.go(-1);">
		<hr/>
	</form>
	<div id="result">${errMsg }</div>
</div>