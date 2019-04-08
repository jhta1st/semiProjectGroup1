<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div><!-- 리스트 -->
		<table border="1" width="500px">
			<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
			<c:forEach var="vo" items="${list }">
				<tr><td>${vo.freeBoardNum }</td>
				<td><a href="${cp }/FreeBoard/Content.do?pageNum=${i}&freeBoardSearchField=${freeBoardSearchField}&freeBoardSearchKeyword=${freeBoardSearchKeyword}&freeBoardNum=${vo.freeBoardNum}">${vo.freeBoardTitle }</a></td>
				<td>${vo.userId }</td>
				<td>${vo.freeBoardWdate }</td></tr>
			</c:forEach>
		</table>
	</div>
	<div><!-- 페이징 -->
		<c:if test="${startPageNum!=1 }"><a href="${cp }/FreeBoard/list.do?pageNum=${startPageNum-1}"><span>◀</span></a></c:if>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${pageNum==i }"><a href="${cp }/FreeBoard/list.do?pageNum=${i}&freeBoardSearchField=${freeBoardSearchField}&freeBoardSearchKeyword=${freeBoardSearchKeyword}"><span>${i }</span></a></c:when>
				<c:otherwise><a href="${cp }/FreeBoard/list.do?pageNum=${i}&freeBoardSearchField=${freeBoardSearchField}&freeBoardSearchKeyword=${freeBoardSearchKeyword}"><span>${i }</span></a></c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPageNum!=pageCount }"><a href="${cp }/FreeBoard/list.do?pageNum=${endPageNum+1}"><span>▶</span></a></c:if>
	</div>
	<div><!-- 검색 -->
		<form method="post" action="${cp }/FreeBoard/list.do">
			<select name="freeBoardSearchField" id="freeBoardSearchField">
				<option value="0" <c:if test="${freeBoardSearchField=='0' }">selected="selected"</c:if>>제목+내용</option>
				<option value="1" <c:if test="${freeBoardSearchField=='1' }">selected="selected"</c:if>>제목</option>
				<option value="2" <c:if test="${freeBoardSearchField=='2' }">selected="selected"</c:if>>내용</option>
				<option value="3" <c:if test="${freeBoardSearchField=='3' }">selected="selected"</c:if>>작성자</option>
			</select>
			<input type="text" size="" name="freeBoardSearchKeyword" value="${freeBoardSearchKeyword }">
			<input type="submit" value="검색">
			<c:if test="${sessionScope.id!=null }">
				<input type="button" value="글쓰기" onclick="javascript:location.href='${cp}/FreeBoard/write.do'">
			</c:if>
		</form>
	</div>
</body>
</html>