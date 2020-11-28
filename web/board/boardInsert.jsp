<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../boardInsert.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="userid" value="1"/>	<!-- 임시로 1로 해둠 나중에 로그인 아디로 바꿔야함 -->
	제목:<input type="text" name="title" value=""/><br>
	가격:<input type="text" name="price" value=""/><br>
	카테고리:<input type="checkbox" name="chk_ca" value="상의"/>상의
	<input type="checkbox" name="chk_ca" value="하의"/>하의
	<input type="checkbox" name="chk_ca" value="아우터"/>아우터
	<input type="checkbox" name="chk_ca" value="원피스"/>원피스
	<input type="checkbox" name="chk_ca" value="신발"/>신발
	<input type="checkbox" name="chk_ca" value="악세사리"/>악세사리<br>
	설명: <input type="text" name="description" value=""/><br>
	메인사진:<input type="file" name="mainfile"/><br>
	서브사진:<input type="file" multiple="multiple" name="subfile[]"/><br>
	<input type="submit" value="글쓰기"/>
</form>
</body>
</html>