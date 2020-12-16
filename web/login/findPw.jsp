<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginMenu.jsp" %>
<p>비밀번호찾기</p>
<form action="/oatjang/findPw.do"  method="post">
<table border="0" align="center" width="350">
	<tr>
		<td colspan="2" align="center">아이디와 연락처를 입력해 주세요.</td>
	</tr>
	<tr>
		<td>아이디 </td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>연락처 </td>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인">
			<input type="reset" value="취&nbsp;&nbsp;소">
		</td>
	</tr>
</table>
</form>
</body>
</html>