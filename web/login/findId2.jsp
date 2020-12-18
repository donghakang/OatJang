<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OatJang - 메인 페이지</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="/oatjang/styles/style.css">
    <link rel="stylesheet" href="/oatjang/styles/home.css">
</head>
<%
	LoginDTO dto = (LoginDTO)request.getAttribute("entity");
%>
<body class="container">
   <script>
    	$(document).ready(function() {
    		$('.navigation_bar').load( "login/loginMenu.jsp", function( response, status, xhr ) {
    			if ( status == "error" ) {
    				var msg = "Sorry but there was an error: ";
    			}
    		});
    	})
    </script>
    <div class="navigation_bar"></div>
    
	 <p>아이디는 <%=dto.getId()%> 입니다</p>
	 <a href="/oatjang/login/findPw.jsp">비밀번호 찾기</a> 
</body>
</html>
