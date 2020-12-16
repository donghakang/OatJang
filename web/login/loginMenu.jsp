<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OatJang - 메인 페이지</title>
    <link rel="stylesheet" href="/oatjang/styles/style.css">
    <link rel="stylesheet" href="/oatjang/styles/home.css">
</head>
<body class="container">

        <h1 class="logo">
            <a href="/oatjang/index.jsp">OatJang</a>
        </h1>

        <div class="middle container red topBotomBordersOut">
            <a href="#" alt="all">all</a>
            <a href="board.html" alt="community">community</a>
            <a href="#" alt="deals">deals</a>
            <a href="map.do" alt="map">maps</a>
            <a href="#" alt="service">service</a>
        </div>
		<div>
			<form onsubmit="searchBar(); return false;">
				키워드 :
				<input type="text" value="이태원 맛집" id="keyword" size="15">
				<button type="submit">검색하기</button>
			</form>
		</div>
        <div class="right container red topBotomBordersOut">
            <a href="#" alt="search">search</a>
            <a href="/oatjang/login/login.jsp" alt="login">login</a></li>
            <a href="/oatjang/login/register.jsp" alt="join us">join us</a></li>
        </div>
</body>
</html>