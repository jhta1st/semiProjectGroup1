<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.adminMovieOkBtn {
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

.adminMovieOkBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.adminMovieOkBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}
.tt{
	margin-left: 60px;
}
.tt1{
	margin-left: 30px;
}
</style>
<div>
	<script type="text/javascript">
		var smiXhr = null;
		function searchMovieInfo(pageNum) {
			var movieInfo = document.getElementById("movieInfo").value;
			smiXhr = new XMLHttpRequest();
			smiXhr.onreadystatechange = searchMovieInfoOk;
			smiXhr.open("get", "${cp}/Admin/SearchMovieInfoDiv.do?pageNum="
					+ pageNum + "&movieInfo=" + movieInfo, true);
			smiXhr.send();
		}
		function searchMovieInfoOk() {
			if (smiXhr.readyState == 4 && smiXhr.status == 200) {
				var movieNum = document.getElementById("movieNum");
				var movieInfoSearchDiv = document
						.getElementById("movieInfoSearchDiv");
				var result = smiXhr.responseXML;
				var movies = result.getElementsByTagName("movies");
				var childs = movieInfoSearchDiv.childNodes;
				var length = childs.length;
				for (var i = 0; i < length; i++) {
					var child = childs.item(0);
					movieInfoSearchDiv.removeChild(child);
				}
				for (var i = 0; i < movies.length; i++) {
					var movieNum = movies[i].getElementsByTagName("movieNum")[0].firstChild.nodeValue;
					var movieName = movies[i].getElementsByTagName("movieName")[0].firstChild.nodeValue;
					var movieReleaseDate = movies[i]
							.getElementsByTagName("movieReleaseDate")[0].firstChild.nodeValue;
					var div = document.createElement("div");
					div.innerHTML = "<div style='float:left;'>" + movieName
							+ "<br>" + movieReleaseDate
							+ "<br><a href='javascript:selectMovie("
							+ movieNum + ",\"" + movieName
							+ "\");'>선택</a></div>";
					//div.className="";
					movieInfoSearchDiv.appendChild(div);
				}
				var movieInfoSearchDivPage = document
						.getElementById("movieInfoSearchDivPage");
				var pageNum = result.getElementsByTagName("pageNum")[0].firstChild.nodeValue;
				var pageCount = result.getElementsByTagName("pageCount")[0].firstChild.nodeValue;
				var startPageNum = result.getElementsByTagName("startPageNum")[0].firstChild.nodeValue;
				var endPageNum = result.getElementsByTagName("endPageNum")[0].firstChild.nodeValue;
				var inner = "";
				if (startPageNum != 1) {
					inner += "<a href=javascript:searchMovieInfo("
							+ (parseInt(startPageNum) - 1)
							+ ");><span>◀</span></a>";
				}
				for (var i = startPageNum; i <= endPageNum; i++) {
					if (pageNum == i) {//나중에 CSS할때 현재페이지와 아닌페이지 색깔 구분하기
						inner += "<a href=javascript:searchMovieInfo(" + i
								+ ");><span>&nbsp;" + i + "&nbsp;</span></a>";
					} else {
						inner += "<a href=javascript:searchMovieInfo(" + i
								+ ");><span>&nbsp;" + i + "&nbsp;</span></a>";
					}
				}
				if (endPageNum != pageCount) {
					inner += "<a href=javascript:searchMovieInfo("
							+ (parseInt(endPageNum) + 1)
							+ ");><span>▶</span></a>";
				}
				movieInfoSearchDivPage.innerHTML = inner;
			}
		}
		function selectMovie(num, name) {
			var movieNum = document.getElementById("movieNum");
			movieNum.value = num;
			var movieInfoSearchDiv = document
					.getElementById("movieInfoSearchDiv");
			var childs = movieInfoSearchDiv.childNodes;
			var length = childs.length;
			for (var i = 0; i < length; i++) {
				var child = childs.item(0);
				movieInfoSearchDiv.removeChild(child);
			}
			var movieInfoSearchDivPage = document
					.getElementById("movieInfoSearchDivPage");
			movieInfoSearchDivPage.innerHTML = "";
			var movieInfo = document.getElementById("movieInfo");
			movieInfo.value = name;
		}
	</script>
	<form method="post" action="${cp }/admin/movieImgRegistration.do" enctype="multipart/form-data">
		<hr/>
		영화명 <input class="tt" type="text" id="movieInfo" /> <input class="adminMovieOkBtn" type="button" value="검색" onclick="searchMovieInfo(1);">
		<br>
		<div id="movieInfoSearchDiv"></div>
		<div id="movieInfoSearchDivPage" style="clear: left;"></div><br/>
		<input type="hidden" id="movieNum" name="movieNum"> <label>이미지유형 <select class="tt1" name="imageType">
				<option value="1">메인이미지</option>
				<option value="2">포스터</option>
				<option value="3">스틸삿</option>
			</select></label>
		<br><br/>
		이미지첨부파일 <input type="file" name="file">
		<br/><hr/>
		<input class="adminMovieOkBtn" type="submit" value="등록" /> | <input class="adminMovieOkBtn" type="button" value="취소" onclick="javascript:history.go(-1);">
		<hr/>
	</form>
	<div id="result">${errMsg }</div>
</div>