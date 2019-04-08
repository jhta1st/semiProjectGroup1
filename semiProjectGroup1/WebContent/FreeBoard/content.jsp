<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var pageCount=null;
	var commInsertXhr=null;
	function commInsert(){
		var freeBoardCommContent=document.getElementById("freeBoardCommContent").value;
		var userId=document.getElementById("userId").value;
		commInsertXhr=new XMLHttpRequest();
		commInsertXhr.onreadystatechange=commInsertOk;
		commInsertXhr.open('post', "${cp}/FreeBoard/commWrite.do", true);
		commInsertXhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		var param="freeBoardCommContent="+freeBoardCommContent+"&freeBoardNum="+${vo.freeBoardNum}+"&userId="+userId;
		commInsertXhr.send(param);
	}
	function commInsertOk(){
		if(commInsertXhr.readyState==4 && commInsertXhr.status==200){
			if(pageCount>1){
				commList(pageCount);
			}else{
				commList(1);
			}
		}
	}
	function commEndPageList(){
		commList(pageCount);
	}
	var commListXhr=null;
	function commList(pageNum){
		var commList=document.getElementById("commList");
		commListXhr=new XMLHttpRequest();
		commListXhr.onreadystatechange=commListOk;
		commListXhr.open('get', "${cp}/FreeBoard/commList.do?pageNum="+ pageNum +"&freeBoardNum="+${vo.freeBoardNum}, true);
		commListXhr.send();
	}
	function commListOk(){
		if(commListXhr.readyState==4 && commListXhr.status==200){
			var result=commListXhr.responseXML;
			var commList=document.getElementById("commList");
			var comms=result.getElementsByTagName("comms");
			var childs=commList.childNodes;
			var length=childs.length;
			for(var i=0;i<length;i++){
				var child=childs.item(0);
				commList.removeChild(child);
			}			
			for(var i=0;i<comms.length;i++){
				var freeBoardCommNum=comms[i].getElementsByTagName("freeBoardCommNum")[0].firstChild.nodeValue;
				var freeBoardCommContent=comms[i].getElementsByTagName("freeBoardCommContent")[0].firstChild.nodeValue;
				var freeBoardCommWdate=comms[i].getElementsByTagName("freeBoardCommWdate")[0].firstChild.nodeValue;
				var freeBoardNum=comms[i].getElementsByTagName("freeBoardNum")[0].firstChild.nodeValue;
				var userId=comms[i].getElementsByTagName("userId")[0].firstChild.nodeValue;
				var div=document.createElement("div");
				div.innerHTML="<div style='display: inline-block;'><strong>"+userId+"</strong><br>"+freeBoardCommContent;
				if("${sessionScope.id }"==userId){
					div.innerHTML+="<div style='float:right';>"+
					"<a href=javascript:commUpdate(" + freeBoardCommNum + ")>수정</a><br>"+
					"<a href=javascript:commDelete(" + freeBoardCommNum + ")>삭제</a>"+
					"</div></div>";
				}
				//div.className="";
				commList.appendChild(div);
			}
			var commListPage=document.getElementById("commListPage");
			var pageNum=result.getElementsByTagName("pageNum")[0].firstChild.nodeValue;
			pageCount=result.getElementsByTagName("pageCount")[0].firstChild.nodeValue;
			var startPageNum=result.getElementsByTagName("startPageNum")[0].firstChild.nodeValue;
			var endPageNum=result.getElementsByTagName("endPageNum")[0].firstChild.nodeValue;
			var inner="";
			if(startPageNum!=1){
				inner+="<a href=javascript:commList("+(parseInt(startPageNum)-1)+");><span>◀</span></a>";
			}
			for(var i=startPageNum;i<=endPageNum;i++){
				if(pageNum==i){//나중에 CSS할때 현재페이지와 아닌페이지 색깔 구분하기
					inner+="<a href=javascript:commList("+i+");><span>&nbsp;"+i+"&nbsp;</span></a>";
				}else{
					inner+="<a href=javascript:commList("+i+");><span>&nbsp;"+i+"&nbsp;</span></a>";
				}
			}
			if(endPageNum!=pageCount){
				inner+="<a href=javascript:commList("+(parseInt(endPageNum)+1)+");><span>▶</span></a>";
			}
			commListPage.innerHTML=inner;
			document.getElementById("freeBoardCommContent").value="";
		}
	}
	var deleteXhr=null;
	function commDelete(freeBoardCommNum){
		deleteXhr=new XMLHttpRequest();
		deleteXhr.onreadystatechange=commDeleteOk;
		deleteXhr.open("get", "${cp}/FreeBoard/commDelete.do?freeBoardCommNum="+ freeBoardCommNum, true);
		deleteXhr.send();
	}
	function commDeleteOk(){
		if(deleteXhr.readyState==4 && deleteXhr.status==200){
			commList(1);
		}
	}
	var UpdateXhr=null;
	function commUpdate(freeBoardCommNum){
		UpdateXhr=new XMLHttpRequest();
		UpdateXhr.onreadystatechange=commUpdateOk;
		UpdateXhr.open("get", "${cp}/FreeBoard/commUpdate.do?freeBoardCommNum="+ freeBoardCommNum, true);
		UpdateXhr.send();
	}
	function commUpdateOk(){
		if(UpdateXhr.readyState==4 && UpdateXhr.status==200){
			var commInfo=UpdateXhr.responseXML;
			var freeBoardCommContent=commInfo.getElementsByTagName("freeBoardCommContent")[0].firstChild.nodeValue;
			var freeBoardCommNum=commInfo.getElementsByTagName("freeBoardCommNum")[0].firstChild.nodeValue;
			var button=document.getElementById("commBtn");
			button.value="수정";
			button.onclick=commUpdate2;
			document.getElementById("freeBoardCommContent").value=freeBoardCommContent;
			document.getElementById("freeBoardCommNum").value=freeBoardCommNum;
		}
	}
	var Update2Xhr=null;
	function commUpdate2(){
		UpdateXhr2=new XMLHttpRequest();
		UpdateXhr2.onreadystatechange=commUpdate2Ok;
		var freeBoardCommNum=document.getElementById("freeBoardCommNum").value;
		var freeBoardCommContent=document.getElementById("freeBoardCommContent").value;
		UpdateXhr2.open("post", "${cp}/FreeBoard/commUpdate.do", true);
		UpdateXhr2.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		var param="freeBoardCommContent="+freeBoardCommContent+"&freeBoardCommNum="+freeBoardCommNum;
		UpdateXhr2.send(param);
	}
	function commUpdate2Ok(){
		if(UpdateXhr.readyState==4 && UpdateXhr.status==200){
			var button=document.getElementById("commBtn");
			button.value="입력";
			button.onclick=commInsert;
			commList(1);
		}
	}
</script>
</head>
<body onload="commList(1)">
	<div><!-- 내용 -->
		<table border="1" width="500px">
			<tr><td>${vo.freeBoardNum }</td><td>${vo.freeBoardTitle }</td><td>${vo.userId }</td><td>${vo.freeBoardWdate }</td></tr>
			<tr><td colspan="4">
			<c:forEach var="list" items="${vo1}">
				<img src="${cp }/FreeBoard/FreeBoardImageUpload/${list.freeBoardSavImgName }" style="width: 200px; height: 200px;"><br>
			</c:forEach>
			${vo.freeBoardContent }
			</td></tr>
			<c:forEach var="list" items="${vo1}">
				<tr><td colspan="4">${list.freeBoardOrgImgName }</td></tr>
			</c:forEach>
		</table>
		<c:if test="${sessionScope.id==vo.userId}">
			<a href="${cp }/FreeBoard/ContentUpdate.do?freeBoardNum=${vo.freeBoardNum}">수정</a><br>
			<a href="${cp }/FreeBoard/ContentDelete.do?freeBoardNum=${vo.freeBoardNum}">삭제</a><br>
		</c:if>
		<a href="${cp }/FreeBoard/list.do?pageNum=${pageNum}&freeBoardSearchField=${freeBoardSearchField}&freeBoardSearchKeyword=${freeBoardSearchKeyword}">목록</a><br>
	</div>
	<div id="commList"><!-- 댓글리스트 -->
		
	</div>
	<div id="commListPage"><!-- 댓글페이징 -->
		
	</div>
	<div><!-- 댓글쓰기 -->
			<a href="javascript:commEndPageList()">댓글새로고침</a><br>
			<c:if test="${sessionScope.id!=null }">
				<textarea rows="5" cols="100%" name="freeBoardCommContent" id="freeBoardCommContent" draggable="false"></textarea>
				<input type="hidden" name="userId" id="userId" value="${sessionScope.id }">
				<input type="hidden" name="freeBoardCommNum" id="freeBoardCommNum" value="">
				<input type="button" value="입력" id="commBtn" onclick="commInsert();">
			</c:if>
	</div>
</body>
</html>