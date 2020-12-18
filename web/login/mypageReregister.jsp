<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
 <link rel="stylesheet" href="/oatjang/styles/mypageReregister.css">

    <link rel="stylesheet" href="/oatjang/styles/style.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body class="container" id="mypageReregister_container">
<script>
	$(document).ready(function() {
		$('.navigation_bar').load( "./loginMenu.jsp", function( response, status, xhr ) {
			if ( status == "error" ) {
				var msg = "Sorry but there was an error: ";
			}
		});
		
		
		$('#pw1, #pw2').keyup(function() {
			var number = /([0-9])/;
            var alphabets = /([a-zA-Z])/;
            var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
			
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();
			var pwStrength = $("#pwStrength");
			var pwCheck = $("#pwCheck");
			var pwStatus = 0;
			
			if (pw1.length < 6) {
				pwStrength.text("weak");	
				pwStatus = 0;
			} else {
				 if (pw1.match(number) && pw1.match(alphabets) && pw1.match(special_characters)) {
					 pwStatus = 2;
					 pwStrength.text("strong");
				 } else {
					 pwStatus = 1;
					 pwStrength.text("medium");
				 }
			}
			
			
			if (pwStatus == 2) {
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
			} else {
				$("#pwCheck").text("비밀번호를 더 강하게 만들어 주세요").css({
					'font-weight' : 'bold',
					'color' : 'red'
				});
			}
			
			
		});
		
		// TODO: 본인인증
		
		// TODO: 주소 찾기
	});
	
</script>
<div class="navigation_bar"></div>



 
<form action="/oatjang/reRegister.do" method="post">
 <div class="align" id="mypageReregister_align">
		<div class="login_image">
			<div class="login_container">
			<div class="grid">
			<table border="0" align="center" width="800" id="reRegister_table">
			<tr>
				<td colspan="3" align="center">로그인 정보</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" value="<%=request.getParameter("id")%>" readonly>
				</td>
				<td>아이디는 수정할 수 없습니다</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" id="pw1" value="<%=request.getParameter("pw")%>">
				</td>
				<td>
					<span id="pwStrength"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td>
					<input type="password" id="pw2" name="pw" value="<%=request.getParameter("pw")%>">
				</td>
				<td>
					<span id="pwCheck">비밀번호가 일치합니다. </span>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">회원 정보</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>
					<input type="text" name="nickname" value="<%=request.getParameter("nickname")%>">
				</td>
				<td>
					<span id="nicknameCheck">이미 사용중인 닉네임 입니다.</span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" value="<%=request.getParameter("name")%>">
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="text" name="age" value="<%=request.getParameter("age")%>">
				</td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td>
					<input type="text" name="phone" value="<%=request.getParameter("phone")%>">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">주소 정보</td>
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
					<input type="submit" value="회원정보 수정">
					<input type="reset" value="취&nbsp;&nbsp;소">
				</td>
			</tr>
		</table>
				<%-- <ul class="login_list">
					<li>로그인 정보</li>
					<li>
						<span>아이디</span>
						<input type="text" name="id" value="<%=request.getParameter("id")%>" readonly>
						<span>아이디는 수정할 수 없습니다</span>
					</li>
					<li>
						<span>비밀번호</span>
						<input type="password" id="pw1" value="<%=request.getParameter("pw")%>">
					</li>
					<li>
						<span>비밀번호확인</span>
						<input type="password" id="pw2" name="pw" value="<%=request.getParameter("pw")%>">
						<span id="pwCheck">비밀번호가 일치합니다. </span>
					</li>
				</ul>
				<ul class="personal_list">
					<li>회원 정보</li>
					<li>
						<span>닉네임</span>
						<input type="text" name="nickname" value="<%=request.getParameter("nickname")%>">
						<span id="nicknameCheck">이미 사용중인 닉네임 입니다.</span>
					</li>
					<li>
						<span>이름</span>
						<input type="text" name="name" value="<%=request.getParameter("name")%>">
					</li>
					<li>
						<span>생년월일</span>
						<input type="text" name="age" value="<%=request.getParameter("age")%>">
					</li>
					<li>
						<span>핸드폰 번호</span>
						<input type="text" name="phone" value="<%=request.getParameter("phone")%>">
					</li>
				</ul>
				<ul class="addr_list">
					<li>주소 정보</li>
					<li>
						<span>주소</span>
						<input type="text" name="addr1">
						<br>
						<input type="text" name="addr2">
					</li>
					<li>
						<input type="button" value="주소 찾기">
					</li>
				</ul>
					<input type="submit" value="회원정보 수정">
					<input type="reset" value="취&nbsp;&nbsp;소"> --%>
			</div>
		</div>
	</div>
	</div>
	</form>

</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO" %>
<%@ include file="./loginMenu.jsp" %>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('#pw1, #pw2').keyup(function() {
			var number = /([0-9])/;
            var alphabets = /([a-zA-Z])/;
            var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
			
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();
			var pwStrength = $("#pwStrength");
			var pwCheck = $("#pwCheck");
			var pwStatus = 0;
			
			if (pw1.length < 6) {
				pwStrength.text("weak");	
				pwStatus = 0;
			} else {
				 if (pw1.match(number) && pw1.match(alphabets) && pw1.match(special_characters)) {
					 pwStatus = 2;
					 pwStrength.text("strong");
				 } else {
					 pwStatus = 1;
					 pwStrength.text("medium");
				 }
			}
			
			
			if (pwStatus == 2) {
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
			} else {
				$("#pwCheck").text("비밀번호를 더 강하게 만들어 주세요").css({
					'font-weight' : 'bold',
					'color' : 'red'
				});
			}
			
			
		});
		
		// TODO: 본인인증
		
		// TODO: 주소 찾기
	});
</script>
<p>Reregister</p>
<form action="/oatjang/reRegister.do" method="post">
		<table border="0" align="center" width="600">
			<tr>
				<td colspan="3" align="center">로그인 정보</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" value="<%=request.getParameter("id")%>" readonly>
				</td>
				<td>아이디는 수정할 수 없습니다</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" id="pw1" value="<%=request.getParameter("pw")%>">
				</td>
				<td>
					<span id="pwStrength"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td>
					<input type="password" id="pw2" name="pw" value="<%=request.getParameter("pw")%>">
				</td>
				<td>
					<span id="pwCheck">비밀번호가 일치합니다. </span>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">회원 정보</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>
					<input type="text" name="nickname" value="<%=request.getParameter("nickname")%>">
				</td>
				<td>
					<span id="nicknameCheck">이미 사용중인 닉네임 입니다.</span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" value="<%=request.getParameter("name")%>">
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="text" name="age" value="<%=request.getParameter("age")%>">
				</td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td>
					<input type="text" name="phone" value="<%=request.getParameter("phone")%>">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">주소 정보</td>
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
					<input type="submit" value="회원정보 수정">
					<input type="reset" value="취&nbsp;&nbsp;소">
				</td>
			</tr>
		</table>
	</form>

</body>
</html> --%>


