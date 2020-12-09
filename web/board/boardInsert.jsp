<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.imgs_wrap{
	display:flex;
	flex-flow: row wrap;
	width:100%;
	border: 1px solid gray;
	padding: 10px;
	box-sizing:content-box;
	margin-bottom: 20px;
}
.imgs_wraps{
	display:flex;
	flex-flow: row wrap;
	width:100%;
	border: 1px solid gray;
	padding: 10px;
	box-sizing:content-box;
	margin-bottom: 20px;
}
.imgs_wrap .img_item{
	width:150px;
	padding:5px;
	border: 1px solid black;
	margin-right: 10px;
}
.imgs_wraps .img_item{
	width:150px;
	padding:5px;
	border: 1px solid black;
	margin-right: 10px;
}

.imgs_wrap .img_item img{
	widtg:100%;
}
.imgs_wraps .img_item img{
	widtg:100%;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	var sel_file =[];
	var sel_files=[];
	$().ready(function(){
		$("#input_img").on("change",handleImgFileSelect);
		$("#input_imgs").on("change",handleImgFilesSelect);
	});
	function mainFileUploadAction(){
		$("#input_img").trigger('click');
	}
	function subFileUploadAction(){
		$("#input_imgs").trigger('click');
	}
 	function handleImgFileSelect(e){
 		sel_file=[];
 		$(".imgs_wrap").empty();

 		var file=e.target.files[0];

 		if(!file.type.match("image.*")){
 			alert("확장자는 이미지 확장자만 가능합니다.");
 			return;
 		}

 		sel_file.push(file);
  		var reader = new FileReader();
  		reader.onload = function(e){
    			var html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction(0)\" id=\"img_id_0\"><img src=\""+e.target.result+"\" data-file='"+file.name+"' class='selProductFile' title='Click to remove'></a>";
    			$(".imgs_wrap").append(html);
  		}

  		reader.readAsDataURL(file);
 	}
 	function handleImgFilesSelect(e){
 		sel_files=[];
 		$(".imgs_wraps").empty();

 		var files=e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index=1;
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
	 			alert("확장자는 이미지 확장자만 가능합니다.");
	 			return;
	 		}

	 		sel_files.push(f);
	  		var reader = new FileReader();
	  		reader.onload = function(e){
	    			var html="<a href=\"javascript:void(0);\" onclick=\"deleteImagesAction("+index+")\" id=\"img_id_"+index+"\"><img src=\""+e.target.result+"\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
	    			$(".imgs_wraps").append(html);
	    			index++;
	  		}

	  		reader.readAsDataURL(f);
		});
 	}

 	function deleteImageAction(index){
 		alert("aa")
 		sel_file.splice(index,1);
 		var img_id="#img_id_0";
 		$(img_id).remove();

 	}
 	function deleteImagesAction(index){
 		sel_files.splice(index,1);
 		var img_id="#img_id_"+index;
 		$(img_id).remove();
 	}
</script>
</head>
<body>

<form action="../boardInsert.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="userid" value="1"/>	<!-- 임시로 1로 해둠 나중에 로그인 아디로 바꿔야함 -->
	제목:<input type="text" name="title" value=""/><br>
	가격:<input type="text" name="price" value=""/><br>
	카테고리:<input type="checkbox" name="category" value="상의"/>상의
	<input type="checkbox" name="category" value="하의"/>하의
	<input type="checkbox" name="category" value="아우터"/>아우터
	<input type="checkbox" name="category" value="원피스"/>원피스
	<input type="checkbox" name="category" value="신발"/>신발
	<input type="checkbox" name="category" value="악세사리"/>악세사리<br>
	설명: <input type="text" name="description" value=""/><br>

<!--  메인사진 -->
	<div>
		<h2>메인사진</h2>
		<div class="input_wrap">
			<a href="javascript:" onclick="mainFileUploadAction();" class="my_button">파일 업로드</a>
			<input type="file" id="input_img" name="mainfile"/>
		</div>
	</div>
	<div>
		<div class="imgs_wrap">
			<img id="img"/>
		</div>
	</div>

<!-- 서브사진 -->
	<div>
		<h2>서브사진</h2>
		<div class="input_wraps">
			<a href="javascript:" onclick="subFileUploadAction();" class="my_button">파일 업로드</a>
			<input type="file" multiple="multiple" id="input_imgs" name="subfile[]"/>
		</div>
	</div>
	<div>
		<div class="imgs_wraps">
			<img id="imgs"/>
		</div>
	</div>

	<input type="submit" value="글쓰기"/>
</form>
</body>
</html>
