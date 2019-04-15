<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<div class="needCenter">
		<h1>정말로 삭제할까요?</h1>
		<form method="post" action="${cp }/FreeBoard/ContentDelete.do">
		<input type="hidden" name="userId" value="${userId }">
		<input type="hidden" name="freeBoardNum" value="${freeBoardNum }">
		<input class="Btn" type="submit" value="삭제" class="inputb"> <input class="Btn" type="button" value="취소" onclick="javascript:history.go(-1);">
		</form>
	</div>
</div>