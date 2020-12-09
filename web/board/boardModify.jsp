<%@page import="com.board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int pg = (Integer)request.getAttribute("pg");
	int iid = (Integer)request.getAttribute("iid");
	BoardDTO dto = (BoardDTO)request.getAttribute("dto");
%>
<form action="/oatjang/boardUpdate.do?pg=<%=pg %>&iid=<%=iid %>" method="post">
	<input type="hidden" name="userid" value="1"/>	<!-- 임시로 1로 해둠 나중에 로그인 아디로 바꿔야함 -->
	제목:<input type="text" name="title" value="<%=dto.getTitle() %>"/><br>
	가격:<input type="text" name="price" value="<%=dto.getPrice() %>"/><br>
	카테고리:<input type="checkbox" name="category" value="상의"/>상의
	<input type="checkbox" name="category" value="하의"/>하의
	<input type="checkbox" name="category" value="아우터"/>아우터
	<input type="checkbox" name="category" value="원피스"/>원피스
	<input type="checkbox" name="category" value="신발"/>신발
	<input type="checkbox" name="category" value="악세사리"/>악세사리<br>
	설명: <input type="text" name="description" value="<%=dto.getDescription() %>"/><br>
	<input type="submit" value="글쓰기"/>
</form>
</body>
</html>