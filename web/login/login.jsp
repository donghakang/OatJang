<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>OatJang - 로그인 화면</title>

<<<<<<< HEAD
<link rel="stylesheet" href="/oatjang/styles/login.css" />
<link rel="stylesheet" href="/oatjang/styles/style.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<body class="container">

	<script>
=======
    <link rel="stylesheet" href="/oatjang/styles/login.css" />
    <link rel="stylesheet" href="/oatjang/styles/style.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    </head>

<body class="container">

	  <script>
>>>>>>> d532cbb... search mypage
    	$(document).ready(function() {
    		$('.navigation_bar').load( "./loginMenu.jsp", function( response, status, xhr ) {
    			if ( status == "error" ) {
    				var msg = "Sorry but there was an error: ";
    			}
    		});
    	})
    </script>
</head>

	
	<script>
   		$('.header1').load( "loginMenu.jsp", function( response, status, xhr ) {
   			if ( status == "error" ) {
   				var msg = "Sorry but there was an error: ";
   			}
   		});
    </script>
    <header class="header1"></header>


    <div class="align">
        
            <div class="login_image">
                <div class="login_container">
                <div class="grid">
                    <form action="https://httpbin.org/post" method="POST" class="form login">
        
                        <div class="form__field">
                            <label for="login__username"><svg class="icon">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use>
                                </svg><span class="hidden">Username</span></label>
                            <input id="login__username" type="text" name="id" class="form__input" placeholder="Username"
                                required>
                        </div>
        
                        <div class="form__field">
                            <label for="login__password"><svg class="icon">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#lock"></use>
                                </svg><span class="hidden">Password</span></label>
                            <input id="login__password" type="password" name="pw" class="form__input"
                                placeholder="Password" required>
                        </div>
        
                        <div class="form__field">
                            <input type="submit" value="Sign In">
                        </div>
        
                    </form>
        
                    <div class="register_password">
                        <p class="text--center" id="find_id"><a href="#">아이디/비밀번호를 잊으셨나요?</a> </p>
                        <p class="text--center" id="register_id"><a href="register.jsp">회원가입</a> </p>
                    </div>
                </div>        

            </div>
        </div>
        
        

