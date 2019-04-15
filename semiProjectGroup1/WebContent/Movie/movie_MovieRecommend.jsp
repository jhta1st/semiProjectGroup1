<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var gmlXhr=null;
	function getMovieList(){
		gmlXhr=new XMLHttpRequest();
		gmlXhr.onreadystatechange=getMovieListOk;
		gmlXhr.open('post', '${cp}/Movie/movieRecommend.do?userId=${sessionScope.id}', true);
		gmlXhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		var param="userId="+'${sessionScope.id}';
		gmlXhr.send(param);
	}
	function getMovieListOk(){
		if(gmlXhr.readyState==4 && gmlXhr.status==200){
			var data=gmlXhr.responseText;
			var list=eval("("+data+")");
			var likeGenre=document.getElementById("likeGenre"); 
			if(list[0].likeGenre==null){
				likeGenre.innerHTML="<span class='p1'>아직 좋아하시는 영화가 없으시군요! 좋아하는 영화를 찾아 '♡'를 눌러주세요.</span><p class='p2'><Strong >최신 영화</Strong><br></p><div id='movieListDiv'></div>";
			}else if(list[0].likeGenre!=null){
				var likeGenreName="";
				for(var i=0;i<list.length;i++){
					likeGenreName+=list[i].likeGenre;
				}
				likeGenre.innerHTML="<span class='p1'>${sessionScope.id}님의 영화 취향을 분석한 결과입니다.</span><p class='p2'><Strong>추천 영화</Strong><br></p><div id='movieListDiv'></div>";
			}
			var movieListDiv=document.getElementById("movieListDiv");
			var cnt=0;
			for (var i=0;i<list.length;i++){
				if(cnt%5==0){
					var div=document.createElement("div");
					div.style='clear: left;';
					movieListDiv.appendChild(div);
				}
				var div=document.createElement("div");
				div.className="MovieListDiv"
				div.innerHTML="<a href='${cp}/Movie/review.do?movieNum="+ list[i].movieNum +"'><img src='${cp}/Movie/images/photo/" + list[i].imageSavName + "'></a><br>" + list[i].movieName + "<br>(" + list[i].movieReleaseDate +")";
				movieListDiv.appendChild(div);
				cnt++;
			}
		}
	}
	window.onload=function(){
		getMovieList();
	}
</script>
<div class="MovieRecommendDiv">
	<div id="likeGenre" class="MovieRecommendDiv"></div>
</div>