	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.adminMovieTeamBtn {
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

.adminMovieTeamBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.adminMovieTeamBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}
.et1{
	margin-left: 60px;
}
.et2{
	margin-left: 60px;
}
.et3{
	margin-left: 70px;
}
.et4{
	margin-left: 30px;
}
.charDiv img{
	width: 300px;
	height: 300px;
	float: left;
	margin-right: 20px;
}
</style>
<div>
<script type="text/javascript">
	var smiXhr=null;
	function searchMovieInfo(pageNum){
		var movieInfo=document.getElementById("movieInfo").value;
		smiXhr=new XMLHttpRequest();
		smiXhr.onreadystatechange=searchMovieInfoOk;
		smiXhr.open("get", "${cp}/Admin/SearchMovieInfoDiv.do?pageNum="+pageNum+"&movieInfo="+movieInfo, true);
		smiXhr.send();
	}
	function searchMovieInfoOk(){
		if(smiXhr.readyState==4 && smiXhr.status==200){
			var movieNum=document.getElementById("movieNum");
			var movieInfoSearchDiv=document.getElementById("movieInfoSearchDiv");
			var result=smiXhr.responseXML;
			var movies=result.getElementsByTagName("movies");
			var childs=movieInfoSearchDiv.childNodes;
			var length=childs.length;
			for(var i=0;i<length;i++){
				var child=childs.item(0);
				movieInfoSearchDiv.removeChild(child);
			}
			for(var i=0;i<movies.length;i++){
				var movieNum=movies[i].getElementsByTagName("movieNum")[0].firstChild.nodeValue;
				var movieName=movies[i].getElementsByTagName("movieName")[0].firstChild.nodeValue;
				var movieReleaseDate=movies[i].getElementsByTagName("movieReleaseDate")[0].firstChild.nodeValue;
				var div=document.createElement("div");
				div.innerHTML="<div style='float:left;'>"+movieName+"<br>"+movieReleaseDate+"<br><a href='javascript:selectMovie(" + movieNum + ",\"" + movieName + "\");'>선택</a></div>";
				//div.className="charName";
				movieInfoSearchDiv.appendChild(div);
			}
			var movieInfoSearchDivPage=document.getElementById("movieInfoSearchDivPage");
			var pageNum=result.getElementsByTagName("pageNum")[0].firstChild.nodeValue;
			var pageCount=result.getElementsByTagName("pageCount")[0].firstChild.nodeValue;
			var startPageNum=result.getElementsByTagName("startPageNum")[0].firstChild.nodeValue;
			var endPageNum=result.getElementsByTagName("endPageNum")[0].firstChild.nodeValue;
			var inner="";
			if(startPageNum!=1){
				inner+="<a href=javascript:searchMovieInfo("+(parseInt(startPageNum)-1)+");><span>◀</span></a>";
			}
			for(var i=startPageNum;i<=endPageNum;i++){
				if(pageNum==i){//나중에 CSS할때 현재페이지와 아닌페이지 색깔 구분하기
					inner+="<a href=javascript:searchMovieInfo("+i+");><span>&nbsp;"+i+"&nbsp;</span></a>";
				}else{
					inner+="<a href=javascript:searchMovieInfo("+i+");><span>&nbsp;"+i+"&nbsp;</span></a>";
				}
			}
			if(endPageNum!=pageCount){
				inner+="<a href=javascript:searchMovieInfo("+(parseInt(endPageNum)+1)+");><span>▶</span></a>";
			}
			movieInfoSearchDivPage.innerHTML=inner;
		}
	}
	var smpXhr=null;
	function searchPeopleInfo(pageNum){
		var charInfo=document.getElementById("charInfo").value;
		smpXhr=new XMLHttpRequest();
		smpXhr.onreadystatechange=searchPeopleInfoOk;
		smpXhr.open("get", "${cp}/Admin/SearchPeopleInfoDiv.do?pageNum="+pageNum+"&charInfo="+charInfo, true);
		smpXhr.send();
	}
	function searchPeopleInfoOk(){
		if(smpXhr.readyState==4 && smpXhr.status==200){
			var charName=document.getElementById("charName");
			var peopleInfoSearchDiv=document.getElementById("peopleInfoSearchDiv");
			var result=smpXhr.responseXML;
			var people=result.getElementsByTagName("people");
			var childs=peopleInfoSearchDiv.childNodes;
			var length=childs.length;
			for(var i=0;i<length;i++){
				var child=childs.item(0);
				peopleInfoSearchDiv.removeChild(child);
			}
			for(var i=0;i<people.length;i++){//------------
				var charNum=people[i].getElementsByTagName("charNum")[0].firstChild.nodeValue;
				var charName=people[i].getElementsByTagName("charName")[0].firstChild.nodeValue;
				var charOrgFileName=people[i].getElementsByTagName("charOrgFileName")[0].firstChild.nodeValue;
				var charSavFileName=people[i].getElementsByTagName("charSavFileName")[0].firstChild.nodeValue;
				var div=document.createElement("div");
				div.className="charDiv";
				div.innerHTML="<div style='float:left;'>"+charName+
				"<br>"+"<img src='${cp }/Movie/images/char/" + charSavFileName +
				"'><br><a href='javascript:selectPeople(" + charNum + ",\"" + charName + "\");'>선택</a></div>";
				//div.className="";
				peopleInfoSearchDiv.appendChild(div);
			}
			var peopleInfoSearchDivPage=document.getElementById("peopleInfoSearchDivPage");
			var pageNum=result.getElementsByTagName("pageNum")[0].firstChild.nodeValue;
			var pageCount=result.getElementsByTagName("pageCount")[0].firstChild.nodeValue;
			var startPageNum=result.getElementsByTagName("startPageNum")[0].firstChild.nodeValue;
			var endPageNum=result.getElementsByTagName("endPageNum")[0].firstChild.nodeValue;
			var inner="";
			if(startPageNum!=1){
				inner+="<a href=javascript:searchPeopleInfo("+(parseInt(startPageNum)-1)+");><span>◀</span></a>";
			}
			for(var i=startPageNum;i<=endPageNum;i++){
				if(pageNum==i){//나중에 CSS할때 현재페이지와 아닌페이지 색깔 구분하기
					inner+="<a href=javascript:searchPeopleInfo("+i+");><span>&nbsp;"+i+"&nbsp;</span></a>";
				}else{
					inner+="<a href=javascript:searchPeopleInfo("+i+");><span>&nbsp;"+i+"&nbsp;</span></a>";
				}
			}
			if(endPageNum!=pageCount){
				inner+="<a href=javascript:searchPeopleInfo("+(parseInt(endPageNum)+1)+");><span>▶</span></a>";
			}
			peopleInfoSearchDivPage.innerHTML=inner;
		}
	}
	function selectMovie(num,name){
		var movieNum=document.getElementById("movieNum");
		movieNum.value=num;
		var movieInfoSearchDiv=document.getElementById("movieInfoSearchDiv");
		var childs=movieInfoSearchDiv.childNodes;
		var length=childs.length;
		for(var i=0;i<length;i++){
			var child=childs.item(0);
			movieInfoSearchDiv.removeChild(child);
		}
		var movieInfoSearchDivPage=document.getElementById("movieInfoSearchDivPage");
		movieInfoSearchDivPage.innerHTML="";
		var movieInfo=document.getElementById("movieInfo");
		movieInfo.value=name;
	}
	function selectPeople(num,name){
		console.log(num);
		console.log(name);
		var charNum=document.getElementById("charNum");
		charNum.value=num;
		var peopleInfoSearchDiv=document.getElementById("peopleInfoSearchDiv");
		var childs=peopleInfoSearchDiv.childNodes;
		var length=childs.length;
		for(var i=0;i<length;i++){
			var child=childs.item(0);
			peopleInfoSearchDiv.removeChild(child);
		}
		var peopleInfoSearchDivPage=document.getElementById("peopleInfoSearchDivPage");
		peopleInfoSearchDivPage.innerHTML="";
		var charInfo=document.getElementById("charInfo");
		charInfo.value=name;
	}
</script>
<form method="post" action="${cp }/admin/movieTeamRegistration.do">
<hr/>
	영화명<input class="et1" type="text" id="movieInfo"/> <input class="adminMovieTeamBtn" type="button" value="검색" onclick="searchMovieInfo(1);"><br>
	<div id="movieInfoSearchDiv"></div>
	<div id="movieInfoSearchDivPage" style="clear:left;"></div>	
	<input type="hidden" id="movieNum" name="movieNum"><br/>
	인물명<input class="et2" type="text" id="charInfo"/> <input class="adminMovieTeamBtn" type="button" value="검색" onclick="searchPeopleInfo(1);"><br>
	<div id="peopleInfoSearchDiv"></div>
	<div id="peopleInfoSearchDivPage" style="clear:left;"></div>	
	<input type="hidden" id="charNum" name="charNum"><br/>
	<label>역할
	<select class="et3" name="castDoNum">
		<option value="1">주연</option>
		<option value="2">조연</option>
		<option value="3">엑스트라</option>
		<option value="4">카메오</option>
		<option value="11">감독</option>
		<option value="12">조감독</option>
		<option value="13">각본</option>
		<option value="14">음악</option>
		<option value="15">미술</option>
		<option value="16">소품</option>
		<option value="17">촬영</option>
	</select></label><br><br/>
	캐릭터이름<input class="et4" type="text" id="castDoName" name="castDoName" /><br><hr/>
	<input class="adminMovieTeamBtn" type="submit" value="등록" /> | <input class="adminMovieTeamBtn" type="button" value="취소" onclick="javascript:history.go(-1);">
	<hr/>
</form>
<div id="result">${errMsg }</div>
</div>