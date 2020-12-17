<%@page import="com.login.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="loginMenu.jsp" %>
로그인 성공

<br /><br />

<%
	LoginDTO dto = (LoginDTO)session.getAttribute("loginComplete");
	System.out.println(dto.getId());
	System.out.println(dto.getName());
	System.out.println(dto.getNickname());
	System.out.println(dto.getPhone());
	System.out.println(dto.getAddrId());
%>
</body>
</html>