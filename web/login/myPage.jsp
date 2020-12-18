<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
	<link rel="stylesheet" href="/oatjang/styles/login.css" />
    <link rel="stylesheet" href="/oatjang/styles/style.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    </head>
  <body class="container">
  <script>
    	$(document).ready(function() {
    		$('.navigation_bar').load( "./loginMenu.jsp", function( response, status, xhr ) {
    			if ( status == "error" ) {
    				var msg = "Sorry but there was an error: ";
    			}
    		});
    	})
    </script>
    <div class="navigation_bar"></div>
<!-- getAddr ==> getAddrId 3개 빠꿈 -->

<%
	LoginDTO dto = (LoginDTO)session.getAttribute("loginComplete");

	if (dto != null) {
		System.out.println(dto.getId());
		System.out.println(dto.getName());
		System.out.println(dto.getNickname());
		System.out.println(dto.getPhone());
		System.out.println(dto.getAddrId());
		System.out.println(dto.getAge());
	}
	
	int passLength = dto.getPw().length();
	System.out.println("passLength : "+passLength);
	String passTemp = "";
	for(int i=0; i<passLength; i++){
		passTemp += "*";
	}
	System.out.println("passTemp : "+passTemp);
%>

<p><%=dto.getNickname()%>님의 회원정보</p>
<table border="1" align="center" width="600">
			<tr>
				<td>아이디</td>
				<td><%=dto.getId()%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=passTemp%></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><%=dto.getNickname()%></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=dto.getName()%></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><%=dto.getAge()%></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><%=dto.getPhone()%></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><%=dto.getAddrId()%></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<!-- <form action="/oatjang/mypageUpdate.do" method="post"> -->
					<form action="/oatjang/login/passConf.jsp" method="post">
						<input type="hidden" name="id" value="<%=dto.getId()%>">
						<input type="hidden" name="pw" value="<%=dto.getPw()%>">
						<input type="hidden" name="nickname" value="<%=dto.getNickname()%>">
						<input type="hidden" name="name" value="<%=dto.getName()%>">
						<input type="hidden" name="age" value="<%=dto.getAge()%>">
						<input type="hidden" name="phone" value="<%=dto.getPhone()%>">
						<input type="hidden" name="addr" value="<%=dto.getAddrId()%>">
						<input type="submit" value="회원정보수정">
						<input type="reset" value="취&nbsp;&nbsp;소">
					</form>
				</td>
			</tr>
		</table>
		


</body>
</html>