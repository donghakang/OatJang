<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>OatJang - 회원가입</title>
</head>
<body>
<%@ include file="loginMenu.jsp"%>
<form action="/oatjang/login.do" method="post">
	 <table border="1" align="center" width="600">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id">
            </td>
            <td>
                <input type="button" value="중복확인" onclick="">
            </td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" id="pw1">
            </td>
            <td><span id="pwdCheck">비밀번호가 일치합니다. </span></td>
        </tr>
        <tr>
			<td>비밀번호확인</td>
			<td>
				<input type="password" id="pw2" name="pw">
			</td>
        </tr>
        <tr>
            <td>닉네임</td>
			<td>
				<input type="text" name="nickname">
            </td>
            <td><span id="nicknameCheck">이미 사용중인 닉네임 입니다.</span></td>
        </tr>
        <tr>
            <td>이름</td>
			<td>
				<input type="text" name="name">
            </td>
        </tr>
        <tr>
            <td>생년월일</td>
			<td>
				<input type="text" name="age">
            </td>
        </tr>
        <tr>
            <td>핸드폰 번호</td>
			<td>
				<input type="text" name="phone">
            </td>
            <td><input type="button" value="본인인증"></td>
        </tr>
        <tr>
            <td>주소</td>
			<td>
                <input type="text" id="addr1">
                <br>
                <input type="text" id="addr2">
                <input type="hidden" name="addr" value="">
            </td>
            <td><input type="button" value="주소 찾기"></td>
        </tr>
		<tr>
			<td colspan="3" align="center">
				<input type="submit" value="로그인">
				<input type="reset" value="취&nbsp;&nbsp;소">
			</td>
		</tr>
	</table>
</form>
</body>
</html>