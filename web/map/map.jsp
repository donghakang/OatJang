<%@page import="com.board.dto.BoardDTO" %>
<%@page import="java.util.ArrayList"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>OatJang - 지도로 상품을 확인하세요</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/oatjang/styles/map.css">
<style>





</style>
</head>

<body>
	<script>
    	$(document).ready(function() {
    		$('.navigation_bar').load( "/oatjang/login/loginMenu.jsp", function( response, status, xhr ) {
    			if ( status == "error" ) {
    				var msg = "Sorry but there was an error: ";
    			}
    		});
    	})
    </script>
    <div class="navigation_bar"></div>

	<div class="map_wrap">
		<div id="map"></div>
		
	
		<input type="checkbox" id="search_button" />

		<div class="search_images">
			<i class="fa fa-close search_checkbox" id="close_image"></i>
			<i class="fa fa-search search_checkbox" id="search_image"></i>
		</div>
		<!-- <i class="fa fa-search search_checkbox" id="search_image"></i>-->
		

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 :
						<input type="text" value="이태원 맛집" id="keyword" size="15">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>

		</div>

		<div class="category">
			<ul>
				<li id="show_all" onclick="filterCategory('all')">
	
				<div class="show_all_marker ico_comm">
		
				</div>전체</li>
				
				<li id="show_top" onclick="filterCategory('top')">
				<div class="show_shirt_marker ico_comm">
					<img src="/oatjang/image/shirt.svg" alt="shirt" />
				</div>상의</li>
				<li id="show_bottom" onclick="filterCategory('bottom')">
				<div class="show_bottom_marker ico_comm">
					<img src="/oatjang/image/jeans.svg" alt="jeans" />	
				</div>하의</li>
				<li id="show_outer" onclick="filterCategory('outer')">
				<div class="show_outer_marker ico_comm">
					<img src="/oatjang/image/jacket.svg" alt="jacket" />
				</div>아우터</li>
				<li id="show_onepiece" onclick="filterCategory('onepiece')">
				<div class="show_onepiece_marker ico_comm">
					<img src="/oatjang/image/dress.svg" alt="dress" />
				</div>원피스</li>
				<li id="show_shoes" onclick="filterCategory('shoes')">
				<div class="show_shoes_marker ico_comm">
					<img src="/oatjang/image/shoe.svg" alt="shoe" />
				</div>신발</li>
				<li id="show_accessory" onclick="filterCategory('accessory')">
				<div class="show_accessories_marker ico_comm">
					<img src="/oatjang/image/accessories.svg" alt="accessories" />
				</div>악세사리</li>
			</ul>
		</div>

		<div class="current_location" id="set_to_current_location">
			<i class="fa fa-location-arrow"></i>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b589ca52298076a814d3d36194e69ebe&libraries=services"
	></script>
	<script>
		//const variables
		const img_dir = 'image';

		var categoryType = 'all';

		//마커가 표시될 위치입니다 
		const MARKER_IMG_W = 48;
		const MARKER_IMG_H = 48;
		const HOVER_MARKER_IMG_W = 62;
		const HOVER_MARKER_IMG_H = 62;

		var container = document.getElementById('map');
		// 마커 이미지
		var positionMarkerImages = [];
		var hoverMarkerImages = [];
		// 마커 포지션과 객체
		var items = [];

		var markersAll = [];
		var markersTop = [];
		var markersBottom = [];
		var markersOuter = [];
		var markersOnepiece = [];
		var markersShoes = [];
		var markersAccessory = [];

		//지도 기본 생성 ---------------------------------------------------------------------
		// 서울 특별시를 기본위치로 설정
		var options = {
			center : new kakao.maps.LatLng(37.55560859228622, 126.98849634257502),
			level : 5
		};

		var map = new kakao.maps.Map(container, options);

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var ps = new kakao.maps.services.Places();

		var locPosition = new kakao.maps.LatLng(37.53623519699613,
				127.09128956725105)
		map.setCenter(locPosition);
		

		
		
		
		

		//마커 세팅 -----------------------------------------------------------------


			for (var i = 1; i < 7; i ++) {
			   var imageSrc = img_dir + '/place-' + i + '-48dp.svg', // 마커이미지의 주소입니다    
			       markerSize = new kakao.maps.Size(MARKER_IMG_W, MARKER_IMG_H),	 // 마커이미지의 크기입니다
			       markerOption = {offset: new kakao.maps.Point(MARKER_IMG_W/2, MARKER_IMG_H)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			   var markerImage = new kakao.maps.MarkerImage(imageSrc, markerSize, markerOption);

			   var hoverMarkerSize = new kakao.maps.Size(HOVER_MARKER_IMG_W, HOVER_MARKER_IMG_H);
			   var hoverMarkerOption = {offset: new kakao.maps.Point(HOVER_MARKER_IMG_W/2, HOVER_MARKER_IMG_H)}; 

			   var hoverMarkerImage = new kakao.maps.MarkerImage(imageSrc, hoverMarkerSize, hoverMarkerOption);

			   positionMarkerImages.push(markerImage);
			   hoverMarkerImages.push(hoverMarkerImage);
			}


		// 콘텐츠 세팅 
		function contentMaker(title, price, description, hit) {
			return '<div class="overlaybox">' + title + '</div>' + '<div>' + price + '</div>' + '<div>' + description + '</div>' + '<div>' + hit + '</div>'
		}


		//포지션 생성 ---------------------------------------------------------------------

			<c:forEach items="${itemList}" var="item">
				var addr = '${item.addr1}'
				var iid = ${item.iid}
			 	<c:set var="title" value="${item.title}" />
			 	var title = '${item.title}'
			 	var price = ${item.price}
			 	var description = '${item.description}'
			 	var category = ${item.category}
			 	var success = ${item.success}
			 	var bid = '${item.bid}'
			 	var hit = ${item.hit}
				var coords = new kakao.maps.LatLng(${item.lat}, ${item.lng});
						    
				var item = {
					addr: addr,
					iid: iid,
					title: title,
					price: price,
					description: '${item.description}',
					category: ${item.category},
					success: ${item.success},
					bid: '${item.bid}',
					hit: ${item.hit},
					positionImage: positionMarkerImages[category],
					hoverImage: hoverMarkerImages[category],
					content: contentMaker(title, price, description, hit),
					latlng: coords
				}
				
				items.push(item);
			</c:forEach>
			
			for (var i = 0; i < items.length; i++ ) {
				var marker = new kakao.maps.Marker({
					map: map, // 마커를 표시할 지도
					position: items[i].latlng, // 마커의 위치
					image: items[i].positionImage // 마커이미지 설정 
				});
				
				// 마커 컨텐트
				var infoWindow = new kakao.maps.InfoWindow({
		            content: items[i].content
		        });
				
				
				 kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(i, map, marker, infoWindow));
				 kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(i, map, marker, infoWindow));
				 kakao.maps.event.addListener(marker, 'click', console.log('is clicked'));

				
				// 필터를 위해
				markersAll.push(marker);
				if (items[i].category === 0) {
					markersTop.push(marker);
				} else if (items[i].category === 1) {
					markersBottom.push(marker);
				} else if (items[i].category === 2) {
					markersOuter.push(marker);
				} else if (items[i].category === 3) {
					markersOnepiece.push(marker);
				} else if (items[i].category === 4) {
					markersShoes.push(marker);
				} else if (items[i].category === 5) {
					markersAccessory.push(marker);
				}

			}

			
			// 키워드로 장소를 검색한 후, 지도 위치를 장소 가운데에 놓습니다.			
			
			
			// function들 ------------------------------------------
			function makeOverListener(i, map, marker, infowindow) {
			    return function() {
			    	console.log(items[i]);
			    	marker.setImage(items[i].hoverImage);
			        infowindow.open(map, marker);
			    };
			}

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(i, map, marker, infowindow) {
			    return function() {
			    	marker.setImage(items[i].positionImage);
			        infowindow.close();
			    };
			}



		function filterCategory(categoryType) {
			if (categoryType === 'all') {
				for (var i = 0; i < markersAll.length; i++ ) {
					markersAll[i].setMap(map); // 지도에 올린다.
				}
			} else {
				for (var i = 0; i < markersAll.length; i++ ) {
					markersAll[i].setMap(null); // 지도에 올린다.
				}
				if (categoryType === 'top') {
					console.log(markersTop.length);
					for (var i = 0; i < markersTop.length; i++ ) {
						markersTop[i].setMap(map);
					}
				}
				else if (categoryType === 'bottom') {
					console.log(markersBottom.length);
					for (var i = 0; i < markersBottom.length; i++ ) {
						markersBottom[i].setMap(map);
					}
				}
				else if (categoryType === 'outer') {
					console.log(markersOuter.length);
					for (var i = 0; i < markersOuter.length; i++ ) {
						markersOuter[i].setMap(map);
					}
				}
				else if (categoryType === 'onepiece') {
					console.log(markersOnepiece.length);
					for (var i = 0; i < markersOnepiece.length; i++ ) {
						markersOnepiece[i].setMap(map);
					}
				}
				else if (categoryType === 'shoes') {
					console.log(markersShoes.length);
					for (var i = 0; i < markersShoes.length; i++ ) {
						markersShoes[i].setMap(map);
					}
				}
				else if (categoryType === 'accessory') {
					console.log(markersAccessory.length);
					for (var i = 0; i < markersAccessory.length; i++ ) {
						markersAccessory[i].setMap(map);
					}
				}
			}
		}


		function changeMarker(type) {
			if (type === 'all') {
				console.log("0");
				categoryType = 'all';
			}
			else if (type === 'top') {
				console.log("1");
				categoryType = 'top';
			}
			else if (type === 'bottom') {
				console.log("2");
				categoryType = 'bottom';
			}
			else if (type === 'outer') {
				console.log("3");
				categoryType = 'outer';
			}
			else if (type === 'onepiece') {
				console.log("4");
				categoryType = 'onepiece';
			}
			else if (type === 'shoes') {
				console.log("5");
				categoryType = 'shoes';
			}
			else if (type === 'accessory') {
				console.log("6");
				categoryType = 'accessory';
			}
			
			
			markerSetup();
		}

		
		
		
		
		
		
		

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// // 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// // 페이지 번호를 표출합니다
				// displayPagination(pagination); --> 페이지 변화

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var bounds = new kakao.maps.LatLngBounds();
			for (var i = 0; i < places.length; i++) {
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x)
				bounds.extend(placePosition);
			}
			map.setBounds(bounds);
			
			//TODO: 현재 프로그램은, 위치를 찾는 것만 신경쓰고 있습니다. - getListItem을 이용해, List를 넣으세요/
			//		- https://apis.map.kakao.com/web/sample/keywordList/
		}

		
		
		// 하단 오른쪽 버튼을 누르면, 현재 위치로 이동합니다.
		$('#set_to_current_location').on('click', function () {
			console.log("to current location");
			
			if (navigator.geolocation) {
			    
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        
			        var lat = position.coords.latitude, // 위도
			            lon = position.coords.longitude; // 경도
			        
			        var locPosition = new kakao.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			        map.setCenter(locPosition);   
			    });
			    
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			    
				alert("현재위치를 찾을 수 없습니다. \n위치 서비스가 켜져 있는지 확인해주세요 ㅠㅠ")
				
			}
		});

		
	</script>
</body>

</html>