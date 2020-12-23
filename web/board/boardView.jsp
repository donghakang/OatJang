<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OatJang - 중고 옷 거래 플랫폼</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/oatjang/styles/style.css" />
<link rel="stylesheet" href="/oatjang/styles/boardView.css" /> 

<script>
    	$(document).ready(function() {
    		var imageLength = ${fn:length(fn:split(dto.images,','))};
    		var num = $("#nowImageCount");
    		$('.navigation_bar').load( "/oatjang/login/loginMenu.jsp", function( response, status, xhr ) {
    			if ( status == "error" ) {
    				var msg = "Sorry but there was an error: ";
    			}
    		});
    		$("#iClassLeft").on("click",function(){
    			num.val(num.val()-1);
				
      			$("#divImageBox").css({"background":"url("+$("#imageName"+num.val()).val()+")"});
      			$("#divImageBox").css({"background-size":"cover","background-repeat":"no-repeat","background-position":"center"});
      			if(num.val()==0){
    				$("#iClassLeft").hide();
    			}else{
    				$("#iClassRight").show();
    			}
    		});
			$("#iClassRight").on("click",function(){
    			num.val(Number(num.val())+1);
				
      			$("#divImageBox").css({"background":"url("+$("#imageName"+num.val()).val()+")"});
      			$("#divImageBox").css({"background-size":"cover","background-repeat":"no-repeat","background-position":"center"});
      			if(num.val()==(imageLength-1)){
    				$("#iClassRight").hide();
    			}else{
    				$("#iClassLeft").show();
    			}
    		});
			$("#iClassLeft").hide();
			if(imageLength==1){
				$("#iClassRight").hide();
			}
    	})
</script>
</head>
<body>
<<<<<<< HEAD
    <div class="navigation_bar"></div>
<div class="ArticleContentBox">
   <div class="article_header">
      <div class="ArticleTitle">
         <h3 class="title_area">
          <!-- 글 제목 -->
          ${dto.title }
         </h3>
      </div>
      <div clas="WriterInfo">
         <div class="profile_area">
            <div class="profile_info">
               <!-- 작성자 닉네임 -->
               ${nickname }
            </div>
            <div class="article_info">
               <!-- 작성일 + 조회수 -->
               ${dto.logtime } 조회 ${dto.hit }
            </div>
            <!-- 카테고리 css 필요 -->
            <div class="article_category">
            	카테고리 : 
            	<c:if test="${dto.category == 0}">
            	상의
            	</c:if>
            	<c:if test="${dto.category == 1}">
            	하의
            	</c:if>
            	<c:if test="${dto.category == 2}">
            	아우터
            	</c:if>
            	<c:if test="${dto.category == 3}">
            	원피스
            	</c:if>
            	<c:if test="${dto.category == 4}">
            	신발
            	</c:if>
            	<c:if test="${dto.category == 5}">
            	악세사리
            	</c:if>
            </div>
            <div class="article_address">
            	거래장소 : ${dto.roadAddrPart1 }
            </div>
         </div>
      </div>
   </div>
   <div class="article_container">
   	  <!-- 사진 css 필요 -->
   	  <div class="article_fictures">
   	  	<c:forEach var="ob" items="${fn:split(dto.images,',')}">
   	  		<img src="/oatjang/images/${ob }"/>
   	  	</c:forEach>
   	  </div>
      <!-- 내용 -->
      ${dto.description }
      <!-- 가격 css 필요 -->
      <div class="article_price">
      가격:${dto.price }
      </div>
   </div>
</div>
<div class="CommentBox">
      <button onclick="location.href='/oatjang/boardList.do?pg=${pg }'" class="boardTag">목록</button>
   <c:if test="${loginComplete.userId == dto.userid}">
      <button onclick="location.href='/oatjang/boardModify.do?iid=${dto.iid }&pg=${pg }'" class="boardTag">수정</button>
      <button onclick="location.href='/oatjang/boardDelete.do?iid=${dto.iid }&pg=${pg }'" class="boardTag">삭제</button>
   	  <button onclick="loaction.href='/oatjang/boardComplete.do?iid=${dto.iid}&pg=${pg }'" class="boardTag">거래완료</button>
   </c:if>
   <div class="comment_option">
      <h3 class="comment_title">댓글&nbsp;<span id="cCnt"></span></h3>
   </div>
   <div class="CommentWriter">
      <form id="commentForm" name="commentForm" method="post">
        <div class="reply_area">
            <textarea style="width:740px;" rows="3" cols="30" id="comment" name="comment"
            placeholder="댓글을 입력하세요"></textarea>
            <input type="button" value="등록" id="reply_btn" onclick="fn_comment()">
        </div>
        <input type="hidden" name="ref" value="0"/>
        <input type="hidden" id="iid" name="iid" value="${dto.iid }" />
        <input type="hidden" id="reply" name="reply" value="${dto.reply }" />
        <input type="hidden" id="userid" name="userid" value="${loginComplete.userId }"/>
        <input type="hidden" id="nickname" name="nickname" value="${loginComplete.nickname}" />
    </form>
</div>


<form id="commentListForm" name="commentListForm" method="post">
      <div id="comment_list">
   
      </div>
   </form>
</div>

				<c:if test="${loginComplete.userId == dto.userid}">
						<button
							onclick="location.href='/oatjang/boardComplete.do?iid=${dto.iid}&pg=${pg }'"
							class="boardTag"
						>거래완료</button>
						<button
							onclick="location.href='/oatjang/boardDelete.do?iid=${dto.iid }&pg=${pg }'"
							class="boardTag"
						>삭제</button>
						<button
							onclick="location.href='/oatjang/boardModify.do?iid=${dto.iid }&pg=${pg }'"
							class="boardTag"
						>수정</button>
						<c:if test="${dto.success !=2 }">
						
						</c:if>
					</c:if>
=======
	<div class="navigation_bar"></div>
	<div class="boardview_main_container">
		<div class="boardView_container">
			<div class="image_container">
				<div class="main_image">	
					<c:forEach var="ob" varStatus="status" items="${fn:split(dto.images,',')}">
						<input type="hidden" id="imageName${status.index }" value="/oatjang/images/${ob }"/>
					</c:forEach>
					<input type="hidden" id="nowImageCount" value="0"/>
					<div id="divImageBox" style="background-image:url('/oatjang/images/${fn:split(dto.images,',')[0]}'); 
						width: 100%; height:100%;
						background-size: cover;
						background-repeat: no-repeat;
						position:relative;
						background-position:center;
						">
						<i id="iClassLeft" class="fa fa-chevron-left fa-3x" style="position:absolute; left:0; top:50%; transform: translate(0, -50%);  text-shadow:
   						-1px -1px 0 #000, 1px -1px 0 #000,-1px 1px 0 #000, 1px 1px 0 #000;"></i>
						<i id="iClassRight"class="fa fa-chevron-right fa-3x" style="position:absolute; right:0; top:50%; transform: translate(0, -50%); text-shadow:
   						-1px -1px 0 #000, 1px -1px 0 #000,-1px 1px 0 #000, 1px 1px 0 #000;"></i>
					
					</div> 
				</div>
			</div>
			<!-- 정보 -->
			<div class="info_container">
				<div class="item_title_area">
					<div class="item_title">
						<!-- 글 제목 -->
						${dto.title }
					</div>
					<div class="item_date">
						조회 ${dto.hit }<br> ${dto.logtime }
					</div>
				</div>
				<hr>
				<div class="item_price">${dto.price }원</div>
				<div class="item_category">
					<c:if test="${dto.category == 0}">
	            	상의
	            	</c:if>
					<c:if test="${dto.category == 1}">
	            	하의
	            	</c:if>
					<c:if test="${dto.category == 2}">
	            	아우터
	            	</c:if>
					<c:if test="${dto.category == 3}">
	            	원피스
	            	</c:if>
					<c:if test="${dto.category == 4}">
	            	신발
	            	</c:if>
					<c:if test="${dto.category == 5}">
	            	악세사리
	            	</c:if>
				</div>
				<div class="item_address">${dto.roadAddrPart1 }</div>
				<div class="item_description">${dto.description }</div>
				<hr>
				<div class="item_nickname">${nickname }
					<c:if test="${loginComplete.userId == dto.userid}">
						<p class="board_btns">   
						<a
							href='/oatjang/boardModify.do?iid=${dto.iid }&pg=${pg }'
							class="boardTag">수정</a>
						<a
							href='/oatjang/boardDelete.do?iid=${dto.iid }&pg=${pg }'
							class="boardTag">삭제</a>
						<button
							onclick="loaction.href='/oatjang/boardComplete.do?iid=${dto.iid}&pg=${pg }'"
							class="boardTag">거래완료</button>
						</p>
					</c:if>
				</div>
>>>>>>> cf7c196... boardList, commuList

			</div>
		</div>

		<div class="comment_option">
			<h3 class="comment_title">
				댓글
			</h3>
		</div>
		<input type="hidden" id="checkSuccess" value="${dto.success }"/>
		<div class="comment_textarea">
			<form id="commentForm" name="commentForm" method="post">
				<div class="reply_area">
					<textarea style="width: 740px;" rows="3" cols="30" id="comment"
						name="comment" placeholder="댓글을 입력하세요"
					></textarea>
					<input type="button" value="등록" id="reply_btn"
						onclick="fn_comment()"
					>
				</div>
				<input type="hidden" name="ref" value="0" />
				<input type="hidden" id="iid" name="iid" value="${dto.iid }" />
				<input type="hidden" name="reply" value="${dto.reply }" />
				<input type="hidden" id="userid" name="userid"
					value="${loginComplete.userId }"/>
				<input type="hidden" id="nickname" name="nickname"
					value="${loginComplete.nickname}"/>
			</form>
		</div>
		<form id="commentListForm" name="commentListForm" method="post">
			<div id="comment_list"></div>
		</form>
	</div>


	<script>
	$(document).ready(function(){
 		getCommentList();
 		$("#comment").on('click',function(){
 			var check = $("#nickname").val();
 			if(!check){
 	 			alert("로그인이 필요합니다.");
 	 			location.href="/oatjang/login/login.jsp";
 	 		}
 		});
	});

	function fn_comment(){
		console.log("fn_comment");
		$.ajax({
			type:'POST',
			url:"<c:url value='/replyInsert.do'/>",
			data:$("#commentForm").serialize(),
			success:function(){
				$("#reply").val($("#reply").val()+1);
				getCommentList();
				$("#comment").val("");
			}
		});
	}
	
 	function getCommentList(){
 		var userid = $("#userid").val();
 		if(!userid){
 			userid = 0;
 		}
 		var iid = "iid="+$("#iid").val()+"&userid="+userid;
		$.ajax({
			type:'GET',
			url:"<c:url value='/replyList.do'/>",
			data:iid,
			success:function(data){
				if(data!=null){
			        $("#comment_list").html(data);
				}
			},
			error: function(data) {
				console.log("something is wrong")
			}
		});
 	}
 	function deleteReply(rid){
 		var sendRid = "rid="+rid+"&iid="+$("#iid").val();
		$.ajax({
			type:'GET',
			url:"<c:url value='/replyDelete.do'/>",
			data:sendRid,
			success:function(){
				getCommentList();
			}
		});
 	}
 	
 	function updateReply(rid){
 		$("#replyContent"+rid).hide();
 		$("#replyUpdate"+rid).show();
 		$("#updateContent"+rid).focus();

 	}
 	function closeUpdate(rid){
 		$("#replyContent"+rid).show();
 		$("#replyUpdate"+rid).hide();
 	}
 	function updateReply2(rid){
 		var send= "rid="+rid+"&iid="+$("#iid").val()+"&content="+$("#updateContent"+rid).val();
		$.ajax({
			type:'GET',
			url:"<c:url value='/replyUpdate.do'/>",
			data:send,
			success:function(){
				getCommentList();
			}
		});
 	}
 	function openReReply(rid){
 		var check = $("#nickname").val();
		if(!check){
 			alert("로그인이 필요합니다.");
 			location.href="/oatjang/login/login.jsp";
 		}
 		$("#reReplyInsert"+rid).show();
 		$("#comment"+rid).focus();
 	}
 	function closeReReply(rid){
 		$("#reReplyInsert"+rid).hide();
 	}
 	function insertReReply(rid){
 		var userid = $("#userid").val();
 		if(!userid){
 			userid = 0;
 		}
  		var send = "userid="+userid+"&reply="+$("#reply").val()+"&nickname="+$("#nickname").val()+"&iid="+$("#iid").val()+"&ref="+$("#replyRef"+rid).val()+"&comment="+$("#comment"+rid).val();
		$.ajax({
			type:'GET',
			url:"<c:url value='/replyInsert.do'/>",
			data:send,
			success:function(){
				$("#reply").val($("#reply").val()+1);
				getCommentList();
			}
		});
 	}
</script>
</body>
<<<<<<< HEAD
</html>



=======
</html>
>>>>>>> cf7c196... boardList, commuList
