<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>OatJang - 회원가입</title>
<link rel="stylesheet" href="/oatjang/styles/style.css" />
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		// TODO: 아이디 중복확인
		$('[name="id"]').keyup(function () {
			var send = "id=" + $('[name="id"]').val();
			console.log(send);
			
			$.ajax({
				type:'POST',
				url:'idCheck.jsp',
				dataType:"html",
				data:send,
				error:function() {
					//TODO: fix the comment
					console.log("what is the problem")
				},
				success:function(data) {
					$('#idCheck').html(data);
				}
			});
			/* $.post(
				"idCheck.jsp",
				send,
				function (data) {
					$('#idCheck').html(data)
					console.log("success")
				},
				); */
			
		});
		
		$('#pw1, #pw2').keyup(function() {
			var number = /([0-9])/;
            var alphabets = /([a-zA-Z])/;
            var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
			
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();
			var pwStrength = $("#pwStrength");
			var pwCheck = $("#pwCheck");
			var pwStatus = 0;
			
			if (pw1.length < 6) {
				pwStrength.text("weak");	
				pwStatus = 0;
			} else {
				 if (pw1.match(number) && pw1.match(alphabets) && pw1.match(special_characters)) {
					 pwStatus = 2;
					 pwStrength.text("strong");
				 } else {
					 pwStatus = 1;
					 pwStrength.text("medium");
				 }
			}
			
			
			if (pwStatus == 2) {
				if (pw1 == pw2) {
					$("#pwCheck").text("비밀번호가 일치합니다.").css({
						'font-weight' : 'bold',
						'color' : 'green'
					});
				} else {
					$("#pwCheck").text("비밀번호가 일치하지 않습니다. ").css({
						'font-weight' : 'bold',
						'color' : 'red'
					});
				}
			} else {
				$("#pwCheck").text("비밀번호를 더 강하게 만들어 주세요").css({
					'font-weight' : 'bold',
					'color' : 'red'
				});
			}
			
			
		});
		
		// TODO: 본인인증
		
		// TODO: 주소 찾기
		$('#searchAddress').on('click', function () {
			var pop = window.open("./jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		});
		
	});
	
	// 주소 가지고 오기
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo,entX,entY,lat,lng){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			/* document.form.roadFullAddr.value = roadFullAddr;
			document.form.roadAddrPart1.value = roadAddrPart1;
			document.form.roadAddrPart2.value = roadAddrPart2;
			document.form.addrDetail.value = addrDetail;
			document.form.engAddr.value = engAddr;
			document.form.jibunAddr.value = jibunAddr;
			document.form.zipNo.value = zipNo;
			document.form.admCd.value = admCd;
			document.form.rnMgtSn.value = rnMgtSn;
			document.form.bdMgtSn.value = bdMgtSn;
			document.form.detBdNmList.value = detBdNmList;
			document.form.bdNm.value = bdNm;
			document.form.bdKdcd.value = bdKdcd;
			document.form.siNm.value = siNm;
			document.form.sggNm.value = sggNm;
			document.form.emdNm.value = emdNm;
			document.form.liNm.value = liNm;
			document.form.rn.value = rn;
			document.form.udrtYn.value = udrtYn;
			document.form.buldMnnm.value = buldMnnm;
			document.form.buldSlno.value = buldSlno;
			document.form.mtYn.value = mtYn;
			document.form.lnbrMnnm.value = lnbrMnnm;
			document.form.lnbrSlno.value = lnbrSlno;
			document.form.emdNo.value = emdNo;
			document.form.entX.value = entX;
			document.form.entY.value = entY; */
			
			document.getElementById('addr1').value = roadAddrPart1;
			document.getElementById('addr2').value = addrDetail + ", " + roadAddrPart2;
			
			document.getElementById('roadFullAddr').value = roadFullAddr;
			document.getElementById('roadAddrPart1').value = roadAddrPart1;
			document.getElementById('roadAddrPart2').value = roadAddrPart2;
			document.getElementById('addrDetail').value = addrDetail;
			document.getElementById('lat').value = lat;
			document.getElementById('lng').value = lng;
			//document.form.addr2.value = e + ", " + n;
			
			/* console.log("Hello World");
			console.log(n, e); */
	}
</script>
</head>
<body class="container">
	<header class="header1">
		<h1 class="logo">
			<a href="/oatjang/index.jsp">OatJang</a>
		</h1>

		<div class="middle container red topBotomBordersOut">
			<a href="#" alt="all">all</a> <a href="board.html" alt="community">community</a>
			<a href="#" alt="deals">deals</a> <a href="maps.html" alt="maps">maps</a>
			<a href="#" alt="service">service</a>
		</div>

		<div class="right container red topBotomBordersOut">
			<a href="#" alt="search">search</a> <a
				href="/oatjang/login/login.jsp" alt="login"
			>login</a>
			</li> <a href="#" alt="join us">join us</a>
			</li>
		</div>
	</header>
	<form action="/oatjang/register.do" method="post">
		<table border="1" align="center" width="600">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id">
				</td>
				<td id="idCheck"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" id="pw1">
				</td>
				<td>
					<span id="pwStrength"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td>
					<input type="password" id="pw2" name="pw">
				</td>
				<td>
					<span id="pwCheck">비밀번호가 일치합니다. </span>
				</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>
					<input type="text" name="nickname">
				</td>
				<td>
					<span id="nicknameCheck">이미 사용중인 닉네임 입니다.</span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="text" name="age">
				</td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td>
					<input type="text" name="phone">
				</td>
				<td>
					<input type="button" value="본인인증">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" id="addr1" name="addr1">
					<input type="text" id="addr2" name="addr2">
					<input type="hidden" id="roadFullAddr" name="roadFullAddr" />
					<input type="hidden" id="roadAddrPart1" name="roadAddrPart1" />
					<input type="hidden" id="roadAddrPart2" name="roadAddrPart2" />
					<input type="hidden" id="addrDetail" name="addrDetail" />
					<input type="hidden" id="lat" name="lat" />
					<input type="hidden" id="lng" name="lng" />
				</td>
				<td>
					<input type="button" id="searchAddress" value="주소 찾기">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="submit" value="로그인">
					<input type="reset" value="취&nbsp;&nbsp;소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>