<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/oatjang/styles/board.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js">
	
</script>
<script>
	var sel_file = [];
	var sel_files = [];
	$().ready(
			function() {
				$('.navigation_bar').load("/oatjang/login/loginMenu.jsp",
						function(response, status, xhr) {
							if (status == "error") {
								var msg = "Sorry but there was an error: ";
							}
						});
				$("#input_img").on("change", handleImgFileSelect);
				$("#input_imgs").on("change", handleImgFilesSelect);
			});

	function mainFileUploadAction() {
		$("#input_img").trigger('click');
	}

	function subFileUploadAction() {
		$("#input_img").trigger('click');
	}

	function handleImgFileSelect(e) {
		sel_file = [];
		$(".imgs_wrap").empty();

		var file = e.target.files[0];

		if (!file.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}

		sel_file.push(file);
		var reader = new FileReader();
		reader.onload = function(e) {
			var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction(0)\" id=\"img_id_0\"><img src=\"" + e
					.target.result + "\" data-file='" + file.name +
					"' class='selProductFile' title='Click to remove'></a>";
			$(".imgs_wrap").append(html);
		}

		reader.readAsDataURL(file);
	}

	function handleImgFilesSelect(e) {
		sel_files = [];
		$(".imgs_wraps").empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 1;
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}

					sel_files.push(f);
					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImagesAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='" + f.name +
						"' class='selProductFile' title='Click to remove'></a>";
						$(".imgs_wraps").append(html);
						index++;
					}

					reader.readAsDataURL(f);
				});
	}

	function deleteImageAction(index) {
		alert("aa")
		sel_file.splice(index, 1);
		var img_id = "#img_id_0";
		$(img_id).remove();

	}

	function deleteImagesAction(index) {
		sel_files.splice(index, 1);
		var img_id = "#img_id_" + index;
		$(img_id).remove();
	}
</script>
</head>



<body>
	
	<div class="navigation_bar"></div>
	<form action="../boardInsert.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="userid" value="1" />
		<!-- 임시로 1로 해둠 나중에 로그인 아디로 바꿔야함 -->
	
	<h1 class="header">자유게시판</h1>
<h2> 수정하기 </h2>

		<div class="textbox">
			<div class="div_title">
				<input class="title" type="text" name="title" value=""
					placeholder="제목을 입력하세요." />
			</div>
			<div class="div_intext">
				<input type="hidden" name="price" value="-1" />
			</div>
			<textarea class="textinput" name="description" value=""
				placeholder="내용을 입력하세요."></textarea>
		</div>

		<div class="btn">
			<div id="rightbtn">
				<input class="go_btn masterBtn" type="submit" value="이전으로" />
			</div>
			<div>
				<input class="back_btn masterBtn" type="submit" value="수정하기" />
			</div>
		</div>


	</form>
</body>

</html>