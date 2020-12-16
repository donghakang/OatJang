<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO" %>
<%@ include file="./loginMenu.jsp" %>

<%
	LoginDTO dto = (LoginDTO)session.getAttribute("loginComplete");
%>
<p>본인 인증을 위해 비밀번호를 확인해 주세요</p>
<form action="/oatjang/mypageUpdate.do" method="post">
<table border="1" align="center" width="600">
	<tr>
		<td>아이디</td>
		<td><%=dto.getId()%></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password"  name="pwd">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
				<input type="hidden" name="id" value="<%=dto.getId()%>">
				<input type="hidden" name="pw" value="<%=dto.getPw()%>">
				<input type="hidden" name="nickname" value="<%=dto.getNickname()%>">
				<input type="hidden" name="name" value="<%=dto.getName()%>">
				<input type="hidden" name="age" value="<%=dto.getAge()%>">
				<input type="hidden" name="phone" value="<%=dto.getPhone()%>">
				<input type="hidden" name="addr" value="<%=dto.getAddr()%>">
				<input type="submit" value="비밀번호 확인">
				<input type="reset" value="취&nbsp;&nbsp;소">
			
		</td>
	</tr>
</table>
</form>
</body>
</html>