<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
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
				div.innerHTML="<div style='float:left;'>"+charName+
				"<br>"+"<img src='${cp }/Admin/AdminMoviePeopleImageUpload/" + charSavFileName +
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
	function castDoNumSelect(){
		var castDoNum=document.getElementById("castDoNum");
		var castDoNumValue=document.getElementById("castDoNumValue").value;
		for(var i=0;i<castDoNum.options.length;i++){
			if(castDoNum.options[i].value==castDoNumValue){
				castDoNum.options[i].selected=true;
			}
		}
	}
</script>
<body onload="castDoNumSelect();">
<form method="post" action="${cp }/admin/movieTeamUpdate.do">
	영화명<input type="text" id="movieInfo" value="${vo.movieName }" disabled="disabled"/><br>
	<input type="hidden" id="movieNum" name="movieNum" value="${vo.movieNum }">
	인물명<input type="text" id="charInfo" value="${charInfoList.charName }"/><input type="button" value="검색" onclick="searchPeopleInfo(1);"><br>
	<div id="peopleInfoSearchDiv"></div>
	<div id="peopleInfoSearchDivPage" style="clear:left;"></div>
	<input type="hidden" id="castNum" name="castNum" value="${infoList.castNum }">
	<input type="hidden" id="charNum" name="charNum" value="${infoList.charNum }">
	<input type="hidden" id="castDoNumValue" name="castDoNumValue" value="${infoList.castDoNum }">
	<label>역할
	<select id="castDoNum" name="castDoNum">
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
	</select></label><br>
	캐릭터이름<input type="text" id="castDoName" name="castDoName" value="${infoList.castDoName }"/><br>
	<input type="submit" value="등록" /><input type="button" value="취소" onclick="javascript:history.go(-1);">
</form>
<div id="result">${errMsg }</div>
</body>