<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<form method="post" action="${pageContext.request.contextPath }/admin/movieUrlRegistration.do">
		영화명<input type="text" id="movieInfo" /><input type="button" value="검색" onclick="searchMovieInfo(1);">
		<br>
		<div id="movieInfoSearchDiv"></div>
		<div id="movieInfoSearchDivPage" style="clear: left;"></div>
		<input type="hidden" id="movieNum" name="movieNum"> <label>URL유형 <select name="urlType">
				<option value="1">예고편</option>
				<option value="2">하이라이트</option>
			</select></label>
		<br>
		URL주소
		<textarea rows="5" cols="100%" id="urlAddr" name="urlAddr"></textarea>
		<br>
		<input type="submit" value="등록" /><input type="button" value="취소" onclick="javascript:history.go(-1);">
	</form>
	<div id="result">${errMsg }</div>
</div>