<%@page import="com.login.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./loginMenu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	LoginDTO entity = (LoginDTO)session.getAttribute("loginComplete");

	if (entity != null) {
		System.out.println(entity.getId());
		System.out.println(entity.getName());
		System.out.println(entity.getNickname());
		System.out.println(entity.getPhone());
		System.out.println(entity.getAddr());
	}
%>

</body>
</html>