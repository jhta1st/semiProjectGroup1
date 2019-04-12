<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function getMovieList(){
		//for(var list:${nMovieList}){//ArrayList<HashMap<String, Object>>
		//	cnt++;
		//	var div=document.createElement("div");
		//	if(cnt%5==0){
		//		div.innerHTML="<div style='display: inline-block; clear: left;'></div>"
		//		movieListDiv.appendChild(div);
		//	}
		//	div.innerHTML="<div style='display: inline-block; float: left;'><a href='${cp}/Movie/review.do?movieNum='"+ list.get('movieNum') +"><img src=${cp}/Movie/images/" + list.get('imgSavName') + "></a><br>" + list.get('movieTitle') + "(" + list.get('movieReleaseDate') +")</div>"
		//	movieListDiv.appendChild(div);			
	//	}
	}
	function nMovieList(list){
		alert("dd");
		var movieListDiv=document.getElementById("movieListDiv");
		var div=document.createElement("div");
		var cnt=0;
		cnt++;
		if(cnt%5==0){
			div.innerHTML="<div style='display: inline-block; clear: left;'></div>"
			movieListDiv.appendChild(div);
			div.innerHTML="<div style='display: inline-block; float: left;'><a href='${cp}/Movie/review.do?movieNum='"+ list.get('movieNum') +"><img src=${cp}/Movie/images/" + list.get('imgSavName') + "></a><br>" + list.get('movieTitle') + "(" + list.get('movieReleaseDate') +")</div>"
			movieListDiv.appendChild(div);		
		}
	}
	window.onload=function(){
		
	}
</script>
<div style="display:none;">
	<c:if test="${nMovieList!=''}">
		<c:forEach var="list" items="${nMovieList}" >
		<script type="text/javascript">
		nMovieList(list);
		</script>
			
		</c:forEach>		
	</c:if>
</div>
<div>
	<c:choose>
		<c:when test="${sessionScope.id=='' }">
			<div>
				<span>로그인을 하셔서 좋아요를 눌러주시면 영화를 추천해드립니다.</span>
			</div>
			<div>
				<Strong>최신 영화</Strong>
				<div id="movieListDiv">
					
				</div>
			</div>
		</c:when>
		<c:when test="">
			<div>
				<span>${sessionScope.id }님은 ${movieType }타입입니다!</span>
			</div>
			<div>
				<Strong>추천 영화</Strong>
				<div id="movieListDiv">
					
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<span>아직 좋아하시는 영화가 없으시군요! 좋아하는 영화를 찾아 '♡'를 눌러주세요.</span>
			</div>
			<div>
				<Strong>최신 영화</Strong>
				<div id="movieListDiv">
					
				</div>
			</div>			
		</c:otherwise>
	</c:choose>
</div>