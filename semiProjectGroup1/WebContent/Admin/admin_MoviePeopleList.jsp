<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#adminMoviePeopleListDiv{
	margin-left : 15%;
	    margin-right : 15%;
		padding-left: 150px;
		border-collapse: collapse;
		border: 2px solid gray;
		background-color: white;
}
.adminMoviePeopleList
	{
		margin: auto;
		margin-top: 50px;
		text-align:center;
		width: 50%;
		height: 400px;
		background-color: white; 
		text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.1); 
	}
.adminMoviePeopleList tr td a:link
	{
		color: black;
	}
.adminMoviePeopleList tr td a:visited
	{
		color: silver;
	}
.adminMoviePeopleList tr th
	{
		border-bottom: 2px dotted silver;
	}
.adminMoviePeopleList tr td
	{
		border-bottom: 2px dotted silver;
	}
.adminMoviePeoplePagingDiv
	{
		margin: auto;
		margin-top: 5px;
		margin-bottom: 10px;
		text-align: center;
		font-size: 16px;
		box-shadow: 3px 4px 1.25px 3.75px rgba(0, 0, 0, 0); 
		text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.15); 
	}
.adminMoviePeopleListContent
	{
		text-align:left;
		padding-left:50px;
		vertical-align: top;
	}
.thisPage
	{
		font-size: 20px;
		box-shadow: 3px 4px 1.25px 3.75px rgba(0, 0, 0, 0); 
		text-shadow: 3px 4px 1.25px rgba(0, 0, 0, 0.15); 
	}
.adminMoviePeopleSearchDiv
	{
		margin: auto;
		text-align: center;
		font-size: 16px;
	}
.adminMoviePeopleSearchBtn {
	font-weight:bold;
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
	background:#787878;
	background:-o-linear-gradient(90deg, #787878, #454545);
	background:-moz-linear-gradient( center top, #787878 5%, #454545 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #787878), color-stop(1, #454545) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#787878', endColorstr='#454545');
	background:-webkit-linear-gradient(#787878, #454545);
	background:-ms-linear-gradient(#787878, #454545);
	background:linear-gradient(#787878, #454545);
	text-indent:0px;
	line-height:0px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:12px;
	color:#f7f7f7;
	width:63px;
	height:0px;
	padding:13px;
	border-color:#2e2e2e;
	border-width:1px;
	border-style:solid;
}

.adminMoviePeopleSearchBtn:active {
	box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	o-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-moz-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	-webkit-box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
	position:relative;
	top:4px
}

.adminMoviePeopleSearchBtn:hover {
	background:#454545;
	background:-o-linear-gradient(90deg, #454545, #787878);
	background:-moz-linear-gradient( center top, #454545 5%, #787878 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #454545), color-stop(1, #787878) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
	background:-webkit-linear-gradient(#454545, #787878);
	background:-ms-linear-gradient(#454545, #787878);
	background:linear-gradient(#454545, #787878);
}
</style>
<div>
	<div class="adminMoviePeopleListDiv">
	<table  class="adminMoviePeopleList" >
		<tr>
			<th>인물번호</th>
			<th>인물명</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.charNum}</td>
				<td>
					<a href="${cp }/admin/MoviePeopleDetail.do?charNum=${vo.charNum}&field=${field}&keyword=${keyword}&pageNum=${pageNum }">${vo.charName}</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div class="adminMoviePeoplePagingDiv">
		<c:choose>
			<c:when test="${startPage>10 }">
				<a href="${cp }/admin/MoviePeopleList.do?pageNum=${startPage-1}">[이전]</a>
			</c:when>
			<c:otherwise>
			[이전]
		</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:choose>
				<c:when test="${pageNum==i }">
					<a href="${cp }/admin/MoviePeopleList.do?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color: pink">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="${cp }/admin/MoviePeopleList.do?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color: #999">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPage<pageCount}">
				<a href="${cp }/admin/MoviePeopleList.do?pageNum=${endPage+1}">[다음]</a>
			</c:when>
			<c:otherwise>
			[다음]
		</c:otherwise>
		</c:choose>
	</div>
	<!-- 검색창 -->
	<div  class="adminMoviePeopleSearchDiv">
		<form method="post" action="${cp }/admin/MoviePeopleList.do">
			<select name="field">
				<option value="charName" <c:if test="${field=='charName' }">
				selected='selected'
			</c:if>>인물명</option>
			</select>
			<input type="text" name="keyword" value="${keyword }"> <input class="adminMoviePeopleSearchBtn" type="submit" value="검색">
		</form>
	</div>
</div>













