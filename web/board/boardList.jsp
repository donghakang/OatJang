<%@page import="com.board.dto.BoardPaging"%>
<%@page import="com.board.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/oatjang/styles/board.css">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="board_nav ">
		<input type="button" href="board_writing.html" class="masterBtn"
			value="목록" /> <input type="button" onclick="location.href='/oatjang/board/boardWrite.jsp'"
			class="masterBtn" value="글 작성" />
	</div>
	<table class="board">
		<thead class="board menu">
			<td>번호</td>
			<td>제목</td>
			<td>이름</td>
			<td>작성날짜</td>
			<td>조회수</td>
		</thead>
		<c:forEach items="${list }" var="ob">
			<tbody class="board_text">
				<td>${ob.iid}</td>
				<td>${ob.title }</td>
				<td>${ob.nickname }</td>
				<td>${ob.logtime }</td>
				<td>${ob.hit }</td>
			</tbody>
		</c:forEach>
		<td colspan="5" align="center">${paging.getPagingHTML()}</td>
	</table>
</body>
</body>
</html>