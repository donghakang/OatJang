<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="loginMenu.jsp" %>
로그인 성공

<br /><br />

<%
	LoginDTO entity = (LoginDTO)session.getAttribute("logOK");
	System.out.println(entity.getId());
	System.out.println(entity.getName());
	System.out.println(entity.getNickname());
	System.out.println(entity.getPhone());
	System.out.println(entity.getAddr());
%>
</body>
</html>