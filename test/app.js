// TEST 를 위한 공간, 나중에 지운다.



// 마커가 표시될 위치입니다 
const MARKER_IMG_W = 54;
const MARKER_IMG_H = 54;
const HOVER_MARKER_IMG_W = 62;
const HOVER_MARKER_IMG_H = 62;


// 지도 기본 생성 ---------------------------------------------------------------------
var container = document.getElementById('map');
var options = {
    center: new kakao.maps.LatLng(37.53623519699613, 127.09128956725105),
    level: 3
};

var map = new kakao.maps.Map(container, options);


// 주소-좌표 변환 객체를 생성합니다
// var geocoder = new kakao.maps.services.Geocoder();



// 마커 이미지 세팅 -----------------------------------------------------------------
var positionMarkerImages = [];
var hoverMarkerImages = [];

for (var i = 1; i < 7; i ++) {
    var imageSrc = 'place-' + i + '-48dp.svg', // 마커이미지의 주소입니다    
        markerSize = new kakao.maps.Size(MARKER_IMG_W, MARKER_IMG_H),	 // 마커이미지의 크기입니다
        markerOption = {offset: new kakao.maps.Point(MARKER_IMG_W/2, MARKER_IMG_H)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    var markerImage = new kakao.maps.MarkerImage(imageSrc, markerSize, markerOption);

    var hoverMarkerSize = new kakao.maps.Size(HOVER_MARKER_IMG_W, HOVER_MARKER_IMG_H);
    var hoverMarkerOption = {offset: new kakao.maps.Point(HOVER_MARKER_IMG_W/2, HOVER_MARKER_IMG_H)}; 

    var hoverMarkerImage = new kakao.maps.MarkerImage(imageSrc, hoverMarkerSize, hoverMarkerOption);

    positionMarkerImages.push(markerImage);
    hoverMarkerImages.push(hoverMarkerImage);
}

// 포지션 생성 ---------------------------------------------------------------------
var positions = [
    {
        postitionImage: positionMarkerImages[0],
        hoverImage: hoverMarkerImages[0],
        content: '<div>아크로 리버</div>',
        latlng: new kakao.maps.LatLng(37.53631369818081, 127.09280288987789)
    },
    {
        postitionImage: positionMarkerImages[1],
        hoverImage: hoverMarkerImages[1],
        content: '<div>우리집</div>', 
        latlng: new kakao.maps.LatLng(37.53623519699613, 127.09128956725105)
    },
    {
        postitionImage: positionMarkerImages[4],
        hoverImage: hoverMarkerImages[2],
        content: '<div>테크노마트</div>', 
        latlng: new kakao.maps.LatLng(37.53567613021487, 127.09535044214925)
    },
    {
        postitionImage: positionMarkerImages[5],
        hoverImage: hoverMarkerImages[3],
        content: '<div><%=title%></div>', 
        latlng: new kakao.maps.LatLng(37.53716766581027, 127.09226913292382)
    }
];




for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커의 위치
        image: positions[i].postitionImage // 마커이미지 설정 
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}









/** ---- 주소를 이용하여, LatLng 을 찾는다. 

geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    


**/


// var imageSrc = 'place-1-48dp.svg', // 마커이미지의 주소입니다    
//     markerSize = new kakao.maps.Size(MARKER_IMG_W, MARKER_IMG_H),	 // 마커이미지의 크기입니다
//     markerOption = {offset: new kakao.maps.Point(MARKER_IMG_W/2, MARKER_IMG_H)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

// var markerImage = new kakao.maps.MarkerImage(imageSrc, markerSize, markerOption);

//     markerSize = new kakao.maps.Size(HOVER_MARKER_IMG_W, HOVER_MARKER_IMG_H);
//     markerOption = {offset: new kakao.maps.Point(HOVER_MARKER_IMG_W/2, HOVER_MARKER_IMG_H)}; 

// var hoverMarkerImage = new kakao.maps.MarkerImage(imageSrc, markerSize, markerOption);

// var markerPosition  = new kakao.maps.LatLng(37.53623519699613, 127.09128956725105); 

// //------------------------------------------------------------------------
// // Marker

// // 마커를 생성합니다
// var marker1 = new kakao.maps.Marker({
//     position: markerPosition,
//     image: markerImage,
//     clickable: true
// });

// var marker2 = new kakao.maps.Marker({
//     position: markerPosition,
// });

// // 마커가 지도 위에 표시되도록 설정합니다
// // marker2.setMap(map);
// marker1.setMap(map);


// //------------------------------------------------------------------------
// // Info Window

// // 커스텀 오버레이에 표시할 컨텐츠 입니다
// // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
// // 별도의 이벤트 메소드를 제공하지 않습니다 
// var content = '<div class="wrap">' + 
//             '    <div class="info">' + 
//             '        <div class="title">' + 
//             '            카카오 스페이스닷원' + 
//             '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
//             '        </div>' + 
//             '        <div class="body">' + 
//             '            <div class="desc">' + 
//             '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
//             '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
//             '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
//             '            </div>' + 
//             '        </div>' + 
//             '    </div>' +    
//             '</div>';

// // 마커 위에 커스텀오버레이를 표시합니다
// // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
// var overlay = new kakao.maps.CustomOverlay({
//     content: content,
//     map: map,
//     position: marker1.getPosition()       
// });


// // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
// kakao.maps.event.addListener(marker1, 'click', function() {
//     overlay.setMap(map);
// });

// // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
// function closeOverlay() {
//     overlay.setMap(null);     
// }




// // // Mouse Event
// // // 마커에 클릭이벤트를 등록합니다
// // kakao.maps.event.addListener(marker1, 'click', function() {
// // 	// 마커 위에 인포윈도우를 표시합니다
// // 	infowindow.open(map, marker1);  
// // });


//         // 마커에 마우스오버 이벤트를 등록합니다
// kakao.maps.event.addListener(marker1, 'mouseover', function() {
// // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
//     // infowindow.open(map, marker1);
//     marker1.setImage(hoverMarkerImage);
// });

// // 마커에 마우스아웃 이벤트를 등록합니다
// kakao.maps.event.addListener(marker1, 'mouseout', function() {
//     // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
//     marker1.setImage(markerImage);
// });

