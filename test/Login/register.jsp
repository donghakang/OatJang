<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>OatJang - 회원가입</title>
<link rel="stylesheet" href="style.css" />
<link rel="stylesheet" href="login.css" />

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body class="container">
	<header class="header1">
		<h1 class="logo">
			<a href="/oatjang/index.jsp">OatJang</a>
		</h1>

		<div class="middle container red topBotomBordersOut">
			<a href="#" alt="all">all</a> <a href="board.html" alt="community">community</a>
			<a href="#" alt="deals">deals</a> <a href="maps.html" alt="maps">maps</a>
			<a href="#" alt="service">service</a>
		</div>

		<div class="right container red topBotomBordersOut">
			<a href="#" alt="search">search</a> <a
				href="/oatjang/login/login.jsp" alt="login"
			>login</a>
			</li> <a href="#" alt="join us">join us</a>
			</li>
		</div>
	</header>
    <div class="align">
        
            <div class="login_image">
                <div class="login_container">
                <div class="grid">
                    <form action="https://httpbin.org/post" method="POST" class="form login">
        
                        <div class="form__field">
                            <input id="login__username" type="text" name="id" class="form__input" placeholder="Username"
                                required>
                        </div>


        
                        <div class="form__field">
                            <input id="pw1" type="password" class="form__input"
                                placeholder="Password" required>
                        </div>
                        <div class="form__field">
                            <input id="pw2" type="password" name="pw" class="form__input"
                                placeholder="Password " required>
                        </div>



                        <div class="form__field">
                            <input id="login__nickname" type="text" name="nickname" class="form__input"
                                placeholder="nickname" required>
                        </div>

                        <div class="form__field">
                            <input id="login__name" type="text" name="name" class="form__input"
                                placeholder="Name" required>
                        </div>

                        <div class="form__field">
                            <input id="login__age" type="text" name="age" class="form__input"
                                placeholder="Birthday (XXXXXX)" required>
                        </div>

                         <div class="form__field">
                            <input id="login__phone" type="text" name="phone" class="form__input"
                                placeholder="Phone Number" required>
                        </div>

                        <div class="form__field ">
                            <input id="login__addr1" type="text" name="addr1" class="form__input"
                                placeholder="Phone Number" required>
                            <input id="login__addr2" type="text" name="addr2" class="form__input"
                                placeholder="Phone Number" required>
                            <input type="hidden" id="roadFullAddr" name="roadFullAddr" />
                            <input type="hidden" id="roadAddrPart1" name="roadAddrPart1" />
                            <input type="hidden" id="roadAddrPart2" name="roadAddrPart2" />
                            <input type="hidden" id="addrDetail" name="addrDetail" />
                            <input type="hidden" id="lat" name="lat" />
                            <input type="hidden" id="lng" name="lng" />
                        </div>


                        <div class="form__field">
                            <input type="button" value="취소하기" onclick="#">
                            <input type="submit" value="가입하기">
                            
                        </div>
        
                    </form>
        
                </div>        

            </div>
        </div>



	<form action="/oatjang/register.do" method="post">
		<table border="1" align="center" width="600">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id">
				</td>
				<td id="idCheck"></td>
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
					<input type="text" id="addr1" name="addr1">
					<input type="text" id="addr2" name="addr2">
					<input type="hidden" id="roadFullAddr" name="roadFullAddr" />
					<input type="hidden" id="roadAddrPart1" name="roadAddrPart1" />
					<input type="hidden" id="roadAddrPart2" name="roadAddrPart2" />
					<input type="hidden" id="addrDetail" name="addrDetail" />
					<input type="hidden" id="lat" name="lat" />
					<input type="hidden" id="lng" name="lng" />
				</td>
				<td>
					<input type="button" id="searchAddress" value="주소 찾기">
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