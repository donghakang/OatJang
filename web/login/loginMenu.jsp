<%@page import="com.login.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function searchBoard()
{

	var searchentity = document.sear.searchentity.value
	var pg = document.sear.pg.value
	/* alert(searchentity) */
//	document.sear.action="/oatjang/boardSearch.do?searchentity="+searchentity
	document.sear.action=location.href="/oatjang/boardSearch.do?searchentity="+searchentity+"&pg="+pg;
// 	location.href="/bbs/boardView.do?seq="+seq+"&pg="+pg;
	document.sear.submit()
}


</script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
p {
	color: green;
	font-weight: bold;
	font-size: 30px;
}

body {
	margin: 0;
	padding: 0;
}

#menu {
	height: 40px;
	background-color: #eee;
}

a {
	padding: 10px;
	display: inline-block;
	text-decoration: none;
	font: bold;
	text-align: center;
}

#login_info {
	font-size: 12px;
}
</style>
</head>

<body>
<%
	LoginDTO entity = (LoginDTO)session.getAttribute("loginComplete");
	int pg = (Integer)request.getAttribute("pg");
%>
	<nav id="menu">
		<input type="button" class="material-icons" value="search" />
		<!-- TODO: 회원가입, 마이페이지-->
		<a href="/oatjang/login/register.jsp">회원가입</a>
		<a href="/oatjang/boardList.do?pg=1">목록보기</a>
		<a href="/oatjang/board/boardInsert.jsp">글쓰기 예시</a>
		<%
			entity = (LoginDTO) session.getAttribute("loginComplete");
			if (entity == null) {
		%>  
		<a href="/oatjang/login/login.jsp">로그인</a>
		<%
			}else{
		%>
		<a href="/oatjang/logout.do">로그아웃</a>
		<a href="/oatjang/login/myPage.jsp">마이페이지</a>
		<%
			}
		%>
		<form name="sear" id="frm">
			<div class="wrap">
				<div class="search">
					<input type="text" name="searchentity" class="searchTerm"
						placeholder="What are you looking for?"> 
						<input type ="hidden" name="pg" value ="1">
						<a href="javascript:searchBoard()" class="searchButton"> <i
						class="fa fa-search"></i>
					</a>
				</div>
			</div>
		</form> 
	</nav>
	<hr>
