var smiXhr = null;
function searchMovieInfo(pageNum) {
	var movieInfo = document.getElementById("movieInfo").value;
	smiXhr = new XMLHttpRequest();
	smiXhr.onreadystatechange = searchMovieInfoOk;
	smiXhr.open("get", "${cp}/Admin/SearchMovieInfoDiv.do?pageNum=" + pageNum
			+ "&movieInfo=" + movieInfo, true);
	smiXhr.send();
}
function searchMovieInfoOk() {
	if (smiXhr.readyState == 4 && smiXhr.status == 200) {
		var movieNum = document.getElementById("movieNum");
		var movieInfoSearchDiv = document.getElementById("movieInfoSearchDiv");
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
			div.innerHTML = "<div style='float:left;'>" + movieName + "<br>"
					+ movieReleaseDate
					+ "<br>사진<br><a href='javascript:selectMovie(" + movieNum
					+ ",\"" + movieName + "\");'>선택</a></div>";
			// div.className="";
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
					+ (parseInt(startPageNum) - 1) + ");><span>◀</span></a>";
		}
		for (var i = startPageNum; i <= endPageNum; i++) {
			if (pageNum == i) {// 나중에 CSS할때 현재페이지와 아닌페이지 색깔 구분하기
				inner += "<a href=javascript:searchMovieInfo(" + i
						+ ");><span>&nbsp;" + i + "&nbsp;</span></a>";
			} else {
				inner += "<a href=javascript:searchMovieInfo(" + i
						+ ");><span>&nbsp;" + i + "&nbsp;</span></a>";
			}
		}
		if (endPageNum != pageCount) {
			inner += "<a href=javascript:searchMovieInfo("
					+ (parseInt(endPageNum) + 1) + ");><span>▶</span></a>";
		}
		movieInfoSearchDivPage.innerHTML = inner;
	}
}
function selectMovie(num, name) {
	var movieNum = document.getElementById("movieNum");
	movieNum.value = num;
	var movieInfoSearchDiv = document.getElementById("movieInfoSearchDiv");
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