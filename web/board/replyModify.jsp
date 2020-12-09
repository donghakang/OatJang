<%@page import="com.board.dto.ReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	ReplyDTO dto = (ReplyDTO)request.getAttribute("dto");
%>
<form action="replyUpdate.do" method="post">
내용 : <input type="text" name="content" value="<%=dto.getContent() %>"/>
<input type="hidden" name="iid" value="<%= dto.getIid() %>"/>
<input type="hidden" name="rid" value="<%= dto.getRid() %>"/>
<input type="submit" value="수정"/>
</form>
</body>
</html>