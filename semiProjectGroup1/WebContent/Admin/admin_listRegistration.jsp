<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>/Admin/admin_listRegistration.jsp</title>
</head>
<body>
<h1>��ȭ ���� ����ϱ�</h1>
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
	��ȭ����<input type="text" id="movieName" name="movieName" /><br/> 
	��ȭ�Ұ�<textarea rows="10" cols="100%" id="movieIntro" name="movieIntro"></textarea><br/>
	��������(?)<input type="text" id="movieReleaseDate" name="movieReleaseDate" /><br/>
	������<input type="text" id="movieRunTime" name="movieRunTime" /><br/>
	���ۻ�<input type="text" id="movieProduction" name="movieProduction" /><br/>
	��޻�<input type="text" id="movieDistributer" name="movieDistributer" /><br/>
	����<input type="text" id="nation" name="nation" /><br/>
	��������<input type="text" id="movieAge" name="movieAge" /><br/>
	<!-- Movie_CharInfoVo
	private int charNum;
	private String charName;
	private String charOrgFileName;
	private String charSavFileName;
	 -->
	 �ι���<input type="text" id="charName" name="charName" /><br/>
	 �ι�÷������<input type="file" name="file1"><br/>
	 <!-- Movie_CastInfoVo 
	private int castNum;
	private int charNum;
	private int castDoNum;
	private String castDoName;
	private int movieNum;
	 -->
	 ���ҹ�ȣ<input type="text" id="castDoNum" name="castDoNum" /><br/>
	 ĳ�����̸�<input type="text" id="castDoName" name="castDoName" /><br/>
	 <!-- Movie_ReviewImageVo
	private int imageNum;
	private int imageType;
	private String imageOrgName;
	private String imageSavName;
	private int movieNum;
	  -->
	 �̹�������<input type="text" id="imageType" name="imageType" /><br/>
	 �̹���÷������<input type="file" name="file2"><br/>
	 <!-- Movie_UrlInfoVo
	 private int urlNum;
	 private int urlType;
	 private String urlAddr;
	 private int movieNum;
	  -->
	  URL����<input type="text" id="urlType" name="urlType" /><br/>
	  URL<textarea rows="5" cols="100%" id="urlAddr" name="urlAddr"></textarea><br/>
	<input type="submit" value="���" /><input type="reset" value="���" />
</form>
</body>
</html>