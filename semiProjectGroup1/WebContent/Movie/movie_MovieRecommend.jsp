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
				likeGenre.innerHTML="'<p style='font-size:25px;'>아직 좋아하시는 영화가 없으시군요! 좋아하는 영화를 찾아 '♡'를 눌러주세요.</p><p style='text-align: left; font-size: 20px; padding-left: 25px;'><Strong >최신 영화</Strong></p><div id='movieListDiv'></div>";
			}else if(list[0].likeGenre!=null){
				var likeGenreName="";
				for(var i=0;i<list.length;i++){
					likeGenreName+=list[i].likeGenre;
				}
				likeGenre.innerHTML="'<p style='font-size:25px;'>${sessionScope.id}님의 영화 취향을 분석한 결과입니다.</p><p style='text-align: left; font-size: 20px; padding-left: 25px;'><Strong>추천 영화</Strong></p><div id='movieListDiv'></div>";
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
				div.style='display: inline-block; float: left; padding: 5px; text-align: center;';
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
<style>
	#likeGenre{text-align: center;}
</style>
<div>
	<div id="likeGenre"></div>
</div>