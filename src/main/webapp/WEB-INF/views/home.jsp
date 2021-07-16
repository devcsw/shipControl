<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./include/header.jsp"%>

<div id="map" style="width:100%; height:100%; max-height:800px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e70be96a08733981d994c3517a10a37&libraries=services,clusterer,drawing"></script>

<script>
$(document).ready(function() {
	//sh_id, sh_name, sh_board_code, sh_owner, sh_owner_tel, 
	//sh_cap_name, sh_cap_tel, sh_type, sh_mmsi, sh_call_sign, sh_date
		connect();
		console.log("아이디 값:" + $('#1').text());
	});

	//소켓 데이터 수신@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	function connect() {
		console.log("onConnect")
		let ws = new SockJS("http://localhost:80/echo/");
		socket = ws;
		
		//한번 오픈하는듯?
		ws.onopen = function(){
			console.log('Info : connection opend');
		}
		//메세지 받았을때
		ws.onmessage = function(event){
			//console.log("ReceiveMessage : ", event.data + '\n');
			var result = JSON.parse(event.data);
			var sh_status_latitude = result.sh_status_latitude;
			var sh_status_longitude = result.sh_status_longitude;
			console.log(sh_status_latitude);
			// 지도 혹은 로드뷰에서 마커의 위치를 지정
			var marker = new kakao.maps.Marker({
			    map: map,
			    position: new kakao.maps.LatLng(sh_status_latitude, sh_status_longitude)
			});
			//여기서 테이블 변경
		}
		//끝날때 보여줌
		ws.onclose = function(event){
			console.log('Info : connection closed');
			connect();
		
		}	
		//에러가 생겼을때
		ws.onerror = function(err) {console.log('Error : ', err);}
	}
	//소켓통신끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	//지도API @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(35.44294727060267, 129.36937385789298),
		level : 7
	};

	var map = new kakao.maps.Map(container, options);

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도 타입 컨트롤을 지도에 표시합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	function getInfo() {
	    // 지도의 현재 중심좌표를 얻어옵니다 
	    var center = map.getCenter(); 
	    
	    // 지도의 현재 레벨을 얻어옵니다
	    var level = map.getLevel();
	    
	    // 지도타입을 얻어옵니다
	    var mapTypeId = map.getMapTypeId(); 
	    
	    // 지도의 현재 영역을 얻어옵니다 
	    var bounds = map.getBounds();
	    
	    // 영역의 남서쪽 좌표를 얻어옵니다 
	    var swLatLng = bounds.getSouthWest(); 
	    
	    // 영역의 북동쪽 좌표를 얻어옵니다 
	    var neLatLng = bounds.getNorthEast(); 
	    
	    // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
	    var boundsStr = bounds.toString();
	    
	    
	    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
	    message += '경도 ' + center.getLng() + ' 이고 <br>';
	    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
	    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
	    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
	    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
	    console.log(message);
	    // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
	    // ex) console.log(message);
	}
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

		// 클릭한 위도, 경도 정보를 가져옵니다 
		var latlng = mouseEvent.latLng;
		marker.setPosition(latlng);
		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		message += '경도는 ' + latlng.getLng() + ' 입니다';
		getInfo();
	});
	
	$(function name() {
		let registerMessage = "${registermsg}";
		if (registerMessage == "success") {
			alert("회원가입에 성공하였습니다");
		}
	});
</script>	

<%@ include file="./include/footer.jsp"%>