<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<img alt="대표이미지" src="${cp }/Movie/images/${imageSavName}">
	<h3>${movieName }</h3>
	<div>${genreName }</div>
	<div>${movieAge }</div>
	<div>${rate }</div>
	<div><input type="button" value="좋아요"></div>
</div>