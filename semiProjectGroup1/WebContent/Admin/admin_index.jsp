<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#managementlist {
	    width: 88%;
		margin: auto;
		margin-top: 25px;
		border-collapse: collapse;
		border: 1px solid #E7E7E7;
		background : url('${cp}/Movie/images/photo/sakura.png'); background-size: 100%; background-repeat: no-repeat;
		}
#managementlist ul li a {
	text-decoration: none;
	color: black;
	font-weight: bold;
	margin-left: 10px;
	
}

#managementlist ul li a:hover {
	color: purple;
	font-size: 20px;
}
</style>
<div id="managementlist">
	<strong>정보관리</strong>
	<ul>
		<li><a href="${pageContext.request.contextPath }/admin/list.do">회원목록</a></li>
		<li><a href="${pageContext.request.contextPath }/admin/MoviePeopleList.do">인물목록</a></li>
		<li><a href="${pageContext.request.contextPath }/admin/MovieInfoList.do">영화목록</a>
			<ol>
				<li><a href="${pageContext.request.contextPath }/admin/movieGenreList.do">장르목록</a>
					<ul>
						<li><a href="${pageContext.request.contextPath }/admin/movieGenreRegistration.do">장르등록</a></li>
					</ul></li>
			</ol></li>
		<li>인물관리
			<ol type="1">
				<li><a href="${pageContext.request.contextPath }/admin/moviePeopleRegistration.do">인물정보등록</a></li>
			</ol>
		</li>
		<li>영화관리
			<ol type="1">
				<li><a href="${pageContext.request.contextPath }/admin/movieInfoRegistration.do">영화정보등록</a></li>
				<li><a href="${pageContext.request.contextPath }/admin/movieTeamRegistration.do">영화출연진등록</a></li>
				<li><a href="${pageContext.request.contextPath }/admin/movieImgRegistration.do">영화이미지등록</a></li>
				<li><a href="${pageContext.request.contextPath }/admin/movieUrlRegistration.do">영화영상물URL등록</a></li>
			</ol>
		</li>
	</ul>
</div>