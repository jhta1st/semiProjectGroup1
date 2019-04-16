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
			if(list[0].likeGenreSize==null){
				likeGenre.innerHTML="<div class='myTable'><c:choose><c:when test="${sessionScope.id==null}">로그인을 하시면 취향에 맞추어 영화를 추천해드립니다.</c:when><c:otherwise>아직 좋아하시는 영화가 없으시군요! 좋아하는 영화를 찾아 '♡'를 눌러주세요.</c:otherwise></c:choose></div><p class='p1'><br><Strong >최신 영화</Strong><br></p><div id='movieListDiv'></div>";
			}else if(list[0].likeGenreSize!=0){
				var likeGenreName="";
				if(list[0].likeGenreSize>3){
					for(var i=1;i<4;i++){
						//if(i==3){
						//	likeGenreName+=list[i].likeGenre;
						//}else{
						//	likeGenreName+=list[i].likeGenre+'/';
						//}
						if(list[i].likeGenre=='드라마'){
							likeGenreName+="감동적인 ";
						}else if(list[i].likeGenre=='판타지'){
							likeGenreName+="세상에 없는 ";
						}else if(list[i].likeGenre=='SF'){
							likeGenreName+="우주를 좋아하는 ";
						}else if(list[i].likeGenre=='액션'){
							likeGenreName+="재빠른 ";
						}else if(list[i].likeGenre=='멜로'){
							likeGenreName+="사랑에 빠진 ";
						}else if(list[i].likeGenre=='범죄'){
							likeGenreName+="부자이고 싶은 ";
						}else if(list[i].likeGenre=='역사'){
							likeGenreName+="공부를 좋아하는 ";
						}else if(list[i].likeGenre=='공포'){
							likeGenreName+="무서운 ";
						}else if(list[i].likeGenre=='전쟁'){
							likeGenreName+="투쟁적인 ";
						}else if(list[i].likeGenre=='코미디'){
							likeGenreName+="웃긴 ";
						}else if(list[i].likeGenre=='스릴러'){
							likeGenreName+="쫄깃한 ";
						}else{
							likeGenreName+="알수없는 ";
						}
					}
				}else{
					for(var i=1;i<list[0].likeGenreSize+1;i++){
						//if(i==list[0].likeGenreSize){
						//	likeGenreName+=list[i].likeGenre;
						//}else{
						//	likeGenreName+=list[i].likeGenre+'/';
						//}
						if(list[i].likeGenre=='드라마'){
							likeGenreName+="감동적인 ";
						}else if(list[i].likeGenre=='판타지'){
							likeGenreName+="세상에 없는 ";
						}else if(list[i].likeGenre=='SF'){
							likeGenreName+="우주를 좋아하는 ";
						}else if(list[i].likeGenre=='액션'){
							likeGenreName+="재빠른 ";
						}else if(list[i].likeGenre=='멜로'){
							likeGenreName+="사랑에 빠진 ";
						}else if(list[i].likeGenre=='범죄'){
							likeGenreName+="부자이고 싶은 ";
						}else if(list[i].likeGenre=='역사'){
							likeGenreName+="공부를 좋아하는 ";
						}else if(list[i].likeGenre=='공포'){
							likeGenreName+="무서운 ";
						}else if(list[i].likeGenre=='전쟁'){
							likeGenreName+="투쟁적인 ";
						}else if(list[i].likeGenre=='코미디'){
							likeGenreName+="웃긴 ";
						}else if(list[i].likeGenre=='스릴러'){
							likeGenreName+="쫄깃한 ";
						}else{
							likeGenreName+="알수없는 ";
						}			
					}
				}
				likeGenre.innerHTML="<div class='myTable'>${sessionScope.id}님은 "+likeGenreName+"사람입니다.</div><p class='p1'><br><Strong>추천 영화</Strong><br></p><div id='movieListDiv'></div>";
			}
			var movieListDiv=document.getElementById("movieListDiv");
			var cnt=0;
			if(list[0].likeGenreSize!=null){			
				for (var i=list[0].likeGenreSize+1;i<list.length;i++){
					if(cnt%5==0){
						var div=document.createElement("br");
						//div.style='clear: left;';
						movieListDiv.appendChild(div);
					}
					var div=document.createElement("span");
					div.className="MovieListDiv"
					div.innerHTML="<a href='${cp}/Movie/review.do?movieNum="+ list[i].movieNum +"'><img src='${cp}/Movie/images/photo/" + list[i].imageSavName + "'></a><br>" + list[i].movieName + "<br>(" + list[i].movieReleaseDate +")";
					movieListDiv.appendChild(div);
					cnt++;
				}
			}else{
				for (var i=0;i<list.length;i++){
					if(cnt%5==0){
						var div=document.createElement("br");
						//div.style='clear: left;';
						movieListDiv.appendChild(div);
					}
					var div=document.createElement("span");
					div.className="MovieListDiv"
					div.innerHTML="<a href='${cp}/Movie/review.do?movieNum="+ list[i].movieNum +"'><img src='${cp}/Movie/images/photo/" + list[i].imageSavName + "'><br>" + list[i].movieName + "<br>(" + list[i].movieReleaseDate +")</a>";
					movieListDiv.appendChild(div);
					cnt++;
				}
			}
		}
	}
	window.onload=function(){
		getMovieList();
	}
</script>
<div>
	<div id="likeGenre" class="MovieRecommendDiv"></div>
</div>