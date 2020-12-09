<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>OatJang - 회원가입</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		// TODO: 아이디 중복확인
		$('[name="id"]').keyup(function () {
			var send = "id=" + $('[name="id"]').val();
			console.log(send);
			
			$.ajax({
				type:'POST',
				url:'idCheck.jsp',
				dataType:"html",
				data:send,
				error:function() {
					//TODO: fix the comment
					console.log("what is the problem")
				},
				success:function(data) {
					$('#idCheck').html(data);
				}
			});
			/* $.post(
				"idCheck.jsp",
				send,
				function (data) {
					$('#idCheck').html(data)
					console.log("success")
				},
				); */
			
		});
		// 비밀번호 체크
		$('#pw1, #pw2').keyup(function() {
			var number = /([0-9])/;
            var alphabets = /([a-zA-Z])/;
            var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
			
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();
			var pwStrength = $("#pwStrength");
			var pwCheck = $("#pwCheck");
			
			if (pw1.length < 6) {
				pwStrength.text("weak");	
			} else {
				 if (pw1.match(number) && pw1.match(alphabets) && pw1.match(special_characters)) {
					 pwStrength.text("strong");
				 } else {
					 pwStrength.text("medium");
				 }
			}
			
			if (pw1 == pw2) {
				$("#pwCheck").text("비밀번호가 일치합니다.").css({
					'font-weight' : 'bold',
					'color' : 'green'
				});
			} else {
				$("#pwCheck").text("비밀번호가 일치하지 않습니다. ").css({
					'font-weight' : 'bold',
					'color' : 'red'
				});
			}
		});
		
		// TODO: 본인인증
		
		// TODO: 주소 찾기
	});
</script>
</head>
<body>
	<%@ include file="loginMenu.jsp"%>
	<form action="/oatjang/register.do" method="post">
		<table border="1" align="center" width="600">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id">
				</td>
				<td id="idCheck">
					
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" id="pw1">
				</td>
				<td>
					<span id="pwStrength"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td>
					<input type="password" id="pw2" name="pw">
				</td>
				<td>
					<span id="pwCheck">비밀번호가 일치합니다. </span>
				</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>
					<input type="text" name="nickname">
				</td>
				<td>
					<span id="nicknameCheck">이미 사용중인 닉네임 입니다.</span>
				</td>
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
				<td>
					<input type="button" value="본인인증">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="addr1">
					<br>
					<input type="text" name="addr2">
				</td>
				<td>
					<input type="button" value="주소 찾기">
				</td>
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