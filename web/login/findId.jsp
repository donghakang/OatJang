<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginMenu.jsp" %>
<p>아이디찾기</p>
<form action="/oatjang/findId.do"  method="post">
<table border="0" align="center" width="350">
	<tr>
		<td colspan="2" align="center">이름과 생년월일을 입력해 주세요.</td>
	</tr>
	<tr>
		<td>이름 </td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>생년월일 </td>
		<td><input type="text" name="age"></td>
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