<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<table border="1" align="center" width="600">
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
		<table border="1" align="center" width="600">
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