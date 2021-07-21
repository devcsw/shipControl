<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./include/header.jsp"%>
<div id="map" style="width:100%; height:100%; max-height:800px;"></div>

<script type="text/javascript" 
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e70be96a08733981d994c3517a10a37&libraries=services,clusterer,drawing"></script>
<script>

function homeSocketConnect() {
	let ws = new SockJS("http://localhost:80/echo/");
	socket = ws;
	
	//오픈 했을때
	ws.onopen = function(){
		console.log('Info : connection opend');
	}
	//메세지 받았을때
	ws.onmessage = function(event){
		console.log("Info : onmessage");
		//클라이언트에서 받는 데이터
		var result = JSON.parse(event.data);
		// 각 선박의 index
		var index = parseInt(result.sh_id);
		// 선박의 이전 값이 있으면 마커 삭제
		if (markers[index] != undefined){
			markers[index].setMap(null);
		}
		//마커생성
		var icon = greenShip;
		if(result.fire >=4){
			icon = redShip;
		} else if(result.fire >=2){
			icon = orangeShip;
		}
		var iwContent = '<div class="card mb-3" style="max-width: 15rem;">' +
			'  <h3 class="card-header">Card header</h3>' +
			'  <div class="card-body" >' +
			'    <h5 class="card-title">Special title treatment</h5>' +
			'    <h6 class="card-subtitle text-muted">Support card subtitle</h6>' +
			'  </div>' +
			//'  <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">' +
			//'    <rect width="100%" height="100%" fill="#868e96"></rect>' +
			//'    <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>' +
			//'  </svg>' +
			'  <div class="card-body">' +
			'    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the cards content.</p>' +
			'  </div>' +
			'  <ul class="list-group list-group-flush">' +
			'    <li class="list-group-item">Cras justo odio</li>' +
			'    <li class="list-group-item">Dapibus ac facilisis in</li>' +
			'    <li class="list-group-item">Vestibulum at eros</li>' +
			'  </ul>' +
			'  <div class="card-body">' +
			'    <a href="#" class="card-link">Card link</a>' +
			'   <a href="#" class="card-link">Another link</a>' +
			'  </div>' +
			'  <div class="card-footer text-muted">' +
			'    2 days ago' +
			'  </div>' +
			'</div>' ;
			
			
		markers[index] = getMarker(result, icon);

		console.log("info 이전" );
		infowindows[index] = getInfowindow(iwContent);
		console.log("infowindow값" + infowindows[index]);
		//리스너 추가
		kakao.maps.event.addListener(markers[index], 'click', function() {
			console.log("리스너실행됨")
			infowindows[index].open(map, markers[index]);  
		});
	}
	//끝날때 
	ws.onclose = function(event){
		console.log('Info : connection closed');
		homeSocketonnect();
	}	
	//에러가 생겼을때
	ws.onerror = function(err) {console.log('Error : ', err);}
}

//인포윈도우 생성 함수
function getInfowindow(iwContent ){
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : true
	});
	return infowindow;
}
</script>

<script>
$(document).ready(function() {
	homeSocketConnect();
});

	//지도API
	//map 생성
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(35.44294727060267, 129.36937385789298),
		level : 8
	};
	
	var map = new kakao.maps.Map(container, options);
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도 타입 컨트롤을 지도에 표시합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	//마커 컨트롤
	//마커를 담을 배열
	var markers = [];
	//인포윈도우를 담을 배열
	var infowindows= [];
	//마커 아이콘
	var greenShip = markerIcon('/resources/img/green_ship.png');
	var redShip = markerIcon('/resources/img/red_ship.png');
	var orangeShip = markerIcon('/resources/img/orange_ship.png');
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() ,
	    image: markerIcon('/resources/img/green_ship.png')
	}); 
	
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW)
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

		// 클릭한 위도, 경도 정보를 가져옵니다 
		var latlng = mouseEvent.latLng;
		marker.setPosition(latlng);
		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		message += '경도는 ' + latlng.getLng() + ' 입니다';
		getInfo();
	});
	
	//회원가입
	$(function name() {
		let registerMessage = "${registermsg}";
		if (registerMessage == "success") {
			alert("회원가입에 성공하였습니다");
		}
	});
</script>	

<%@ include file="./include/footer.jsp"%>

