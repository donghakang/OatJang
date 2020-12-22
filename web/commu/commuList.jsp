<%@page import="com.board.dto.BoardPaging"%>
<%@page import="com.board.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/oatjang/styles/board.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<script>
    	$(document).ready(function() {
    		$('.navigation_bar').load( "login/loginMenu.jsp", function( response, status, xhr ) {
    			if ( status == "error" ) {
    				var msg = "Sorry but there was an error: ";
    			}
    		});
    	})
		function writeCheck(){
				if($("#loginCheck").val()){
						location.href="/oatjang/commu/commuInsert.jsp";
				}else{
						alert("로그인이 필요합니다.");
						location.href="/oatjang/login/login.jsp";
				}
		}
		</script>
    <div class="navigation_bar"></div>
	<input type="hidden" id="loginCheck" value="${loginComplete.userId }"/>
	<div class="board_nav ">
		<input type="button" href="#" class="masterBtn" value="목록" />
		<input type="button" onclick="writeCheck()"
			class="masterBtn" value="글 작성" />
	</div>

	<div class="board_list_wrap"> <!-- 전체영역 -->
	<table class="board">
		<thead class="board menu">
			<td width="10%" class=td_head>번호</td>
			<td width="40%">제목</td>
			<td width="20%">이름</td>
			<td width="20%">작성날짜</td>
			<td width="10%">조회수</td>

		</thead>
		<c:forEach items="${list }" var="ob">
			<tbody  onclick="location.href='/oatjang/boardView.do?iid=${ob.iid}&pg=${pg }'" class="board_text" id="board_text_id">
				<td class="td_class" >${ob.iid}</td>
				<td id="td_title">${ob.title }<c:if test="${ob.reply!=0 }">(${ob.reply })</c:if></td>
				<td>${ob.nickname }</td>
				<td>${ob.logtime }</td>
				<td>${ob.hit }</td>
				 <tr height="1" bgcolor="#808080"><td colspan="5"></td></tr>
			</tbody>
		</c:forEach>
		<td colspan="5" align="center" class="td_a"><c:if test="${empty paging}">${paging2.getPagingHTML()}</c:if>
	<c:if test="${!empty paging}">${paging.getPagingHTML()}</c:if></td>

	</table>
	</div>
</body>
</body>
</html>
