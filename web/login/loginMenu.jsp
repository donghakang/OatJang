<%@page import="com.login.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
p {
	color: green;
	font-weight: bold;
	font-size: 30px;
}

body {
	margin: 0;
	padding: 0;
}

#menu {
	height: 40px;
	background-color: #eee;
}

a {
	padding: 10px;
	display: inline-block;
	text-decoration: none;
	font: bold;
	text-align: center;
}

#login_info {
	font-size: 12px;
}
</style>
</head>

<body>
	<nav id="menu">
		<!-- TODO: 회원가입, 마이페이지-->
		<a href="">회원가입</a>
		<a href="">마이페이지</a>
		<%-- <%
		LoginDTO entity = (LoginDTO) session.getAttribute("logOK");
		if (entity == null) {
		%> --%>
		
		<a href="/oatjang/board/boardInsert.jsp">글쓰기 예시</a>
		<a href="/oatjang/login/login.jsp">로그인</a>
		<a href="/oatjang/logout.do">로그아웃</a> 
	</nav>
	<hr>