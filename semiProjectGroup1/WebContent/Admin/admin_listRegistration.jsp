<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>/Admin/admin_listRegistration.jsp</title>
</head>
<body>
<h1>영화 정보 등록하기</h1>
<hr/>
<form method="post" action="${pageContext.request.contextPath }/admin/registration.do" enctype="multipart/form-data">
	<!-- Movie_MovieInfoVo 
	private int movieNum;
	private String movieName;
	private String movieIntro;
	private Date movieReleaseDate;
	private int movieRunTime;
	private String movieProduction;
	private String movieDistributer;
	private String nation;
	private int movieAge;
	-->
	영화제목<input type="text" id="movieName" name="movieName" /><br/> 
	영화소개<textarea rows="10" cols="100%" id="movieIntro" name="movieIntro"></textarea><br/>
	개봉일자(?)<input type="text" id="movieReleaseDate" name="movieReleaseDate" /><br/>
	상영일자<input type="text" id="movieRunTime" name="movieRunTime" /><br/>
	제작사<input type="text" id="movieProduction" name="movieProduction" /><br/>
	배급사<input type="text" id="movieDistributer" name="movieDistributer" /><br/>
	국가<input type="text" id="nation" name="nation" /><br/>
	관람나이<input type="text" id="movieAge" name="movieAge" /><br/>
	<!-- Movie_CharInfoVo
	private int charNum;
	private String charName;
	private String charOrgFileName;
	private String charSavFileName;
	 -->
	 인물명<input type="text" id="charName" name="charName" /><br/>
	 인물첨부파일<input type="file" name="file1"><br/>
	 <!-- Movie_CastInfoVo 
	private int castNum;
	private int charNum;
	private int castDoNum;
	private String castDoName;
	private int movieNum;
	 -->
	 역할번호<input type="text" id="castDoNum" name="castDoNum" /><br/>
	 캐릭터이름<input type="text" id="castDoName" name="castDoName" /><br/>
	 <!-- Movie_ReviewImageVo
	private int imageNum;
	private int imageType;
	private String imageOrgName;
	private String imageSavName;
	private int movieNum;
	  -->
	 이미지유형<input type="text" id="imageType" name="imageType" /><br/>
	 이미지첨부파일<input type="file" name="file2"><br/>
	 <!-- Movie_UrlInfoVo
	 private int urlNum;
	 private int urlType;
	 private String urlAddr;
	 private int movieNum;
	  -->
	  URL유형<input type="text" id="urlType" name="urlType" /><br/>
	  URL<textarea rows="5" cols="100%" id="urlAddr" name="urlAddr"></textarea><br/>
	<input type="submit" value="등록" /><input type="reset" value="취소" />
</form>
</body>
</html>