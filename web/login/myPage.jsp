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
	LoginDTO dto = (LoginDTO)session.getAttribute("loginComplete");

	if (dto != null) {
		System.out.println(dto.getId());
		System.out.println(dto.getName());
		System.out.println(dto.getNickname());
		System.out.println(dto.getPhone());
		System.out.println(dto.getAddr());
	}
%>

</body>
</html>