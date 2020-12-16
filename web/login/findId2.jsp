<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO" %>

<%@ include file="loginMenu.jsp" %>

<%
	LoginDTO dto = (LoginDTO)request.getAttribute("entity");
	
%>
 <p>아이디는 <%=dto.getId()%> 입니다</p>
 <a href="/oatjang/login/findPw.jsp">비밀번호 찾기</a> 
</body>
</html>
