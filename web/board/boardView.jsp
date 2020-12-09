<%@page import="com.board.dto.ReplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function refChange(rid){
 	document.getElementsByName('ref')[0].value = rid;
	alert(document.getElementsByName('ref')[0].value);
}
</script>
</head>
<body>
<%
	BoardDTO dto = (BoardDTO)request.getAttribute("dto");
	List<ReplyDTO> list = (List<ReplyDTO>)request.getAttribute("list");
	int ref=0;
%>
제목 : <%= dto.getTitle() %><br>
내용 : <%= dto.getDescription() %><br>

<%
	for(ReplyDTO ob:list){
%>
	<div>
<%
		if(ob.getRid()!=ob.getRef()){
%>
			<img src="/oatjang/image/reply.gif"/>
<%		
		}
%>
	작성자:<%=ob.getNickname() %>&nbsp;내용:<%=ob.getContent() %>
	<a href="/oatjang/replyModify.do?iid=<%=dto.getIid() %>&rid=<%=ob.getRid()%>">수정</a>
	<a href="/oatjang/replyDelete.do?iid=<%=dto.getIid() %>&rid=<%=ob.getRid()%>">삭제</a>
	<button onclick="refChange(<%=ob.getRef()%>)">답글</button>
	</div>
<%
	}
%>
<form action="/oatjang/replyInsert.do?nickname='test'" method="post">
	<input type="text" name="content"/>
	<input type="hidden" name="iid" value="<%= dto.getIid() %>"/>
	<input type="hidden" name="ref" value="<%= ref %>"/>
	<input type="hidden" name="reply" value="<%=dto.getReply() %>"/>
	<input type="submit" value="작성"/>
</form>

</body>
</html>