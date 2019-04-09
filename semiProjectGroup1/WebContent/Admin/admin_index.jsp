<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<strong>정보관리</strong>
<ul>
	<li><a href="${pageContext.request.contextPath }/admin/list.do">회원목록</a></li>
	<li><a href="">인물목록</a></li>
	<li><a href="">영화목록</a>
		<ol>
			<li><a href="">장르목록</a></li>
		</ol>
	</li>	
	<li>인물관리
		<ol type="1">			
			<li><a href="${pageContext.request.contextPath }/admin/moviePeopleRegistration.do">인물정보등록</a></li>
		</ol>
	</li>
	<li>영화관리
		<ol type="1">
			<li><a href="${pageContext.request.contextPath }/admin/movieInfoRegistration.do">영화정보등록</a></li>
			<li><a href="">영화장르등록</a></li>	
			<li><a href="${pageContext.request.contextPath }/admin/movieTeamRegistration.do">영화출연진등록</a></li>	
			<li><a href="${pageContext.request.contextPath }/admin/movieImgRegistration.do">영화이미지등록</a></li>
			<li><a href="${pageContext.request.contextPath }/admin/movieUrlRegistration.do">영화영상물URL등록</a></li>
		</ol>
	</li>	
</ul>
</body>