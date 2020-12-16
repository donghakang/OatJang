<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO" %>

<%@ include file="loginMenu.jsp" %>

<%
	LoginDTO dto = (LoginDTO)request.getAttribute("entity");
	
%>
 <p>비밀번호는 <%=dto.getPw()%> 입니다</p> 
 <a href="/oatjang/login/login.jsp">로그인 하기</a> 
</body>
</html>


<%-- <%
	LoginDTO dto = (LoginDTO)session.getAttribute("loginComplete");

	if (dto != null) {
		System.out.println(dto.getId());
		System.out.println(dto.getName());
		System.out.println(dto.getNickname());
		System.out.println(dto.getPhone());
		System.out.println(dto.getAddr());
		
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
				<td><%=dto.getPw()%></td> --%>