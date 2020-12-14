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
    <header class="header1">
        <h1 class="logo">
            <a href="/oatjang/index.jsp">OatJang</a>
        </h1>

        <div class="middle container red topBotomBordersOut">
            <a href="#" alt="all">all</a>
            <a href="board.html" alt="community">community</a>
            <a href="#" alt="deals">deals</a>
            <a href="maps.html" alt="maps">maps</a>
            <a href="#" alt="service">service</a>
        </div>

        <div class="right container red topBotomBordersOut">
            <a href="#" alt="search">search</a>
            <a href="/oatjang/login/login.jsp" alt="login">login</a></li>
            <a href="#" alt="join us">join us</a></li>
        </div>
    </header>

    <div class="canvas">
        <div id="renderCanvas"></div>
        <div class="description">
            <span id="name">OatJang</span>
            <span id="describe"> 중고 옷 거래 플랫 폼</span>
        </div>
    </div>


    <div class="menu">
        <div class="menu_item" id="community"><p>Community</p></div>
        <div class="menu_item" id="maps">Maps</div>
        <div class="menu_item" id="deals">Deals</div>
    </div>

    <script type="module" src="/oatjang/lib/app.js"></script>
</body>

</html>