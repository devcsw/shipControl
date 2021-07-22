<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./include/header.jsp"%>
<div id="map" style="width: 100%; height: 100%; max-height: 800px;"></div>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e70be96a08733981d994c3517a10a37&libraries=services,clusterer,drawing"></script>


<script>
$(document).ready(function() {
	//소켓
	homeSocketConnect();
	//회원가입
	$(function name() {
		let registerMessage = "${registermsg}";
		if (registerMessage == "success") {
			alert("회원가입에 성공하였습니다");
		}
	});
});


	//지도API
	//map 생성
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(35.44294727060267, 129.36937385789298),
		level : 11
	};
	
	var map = new kakao.maps.Map(container, options),
    overlays = []; // 지도에 그려진 도형을 담을 배열
    
	//관제구역 설정 
	//return 값 {"ha":129.22870495222276,"qa":34.941863044484165,"oa":131.06753657753313,"pa":35.86708230321422}
    var controlSector = JSON.stringify(displayArea());
    console.log("controlSector:" + controlSector);
   
    //console.log("parse:" + parse);
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	// default 스카이뷰 설정 코드
	map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);
	
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

	// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
	var manager = new kakao.maps.Drawing.DrawingManager(getDrawingOption());

	// Toolbox를 생성합니다. 
	// Toolbox 생성 시 위에서 생성한 DrawingManager 객체를 설정합니다.
	// DrawingManager 객체를 꼭 설정해야만 그리기 모드와 매니저의 상태를 툴박스에 설정할 수 있습니다.
	var toolbox = new kakao.maps.Drawing.Toolbox({drawingManager: manager});

	// 지도 위에 Toolbox를 표시합니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOP은 위 가운데를 의미합니다.
	map.addControl(toolbox.getElement(), kakao.maps.ControlPosition.TOP);
	
	
	// 그리기가 끝나면 발생한다.
	manager.addListener('drawend', function(data) {
		var mData = JSON.stringify(manager.getData());
		console.log('drawendJson',mData);
	});
	//그리기 요소를 선택하면 발생한다.
	//manager.addListener('select', function(e) {
	//    console.log(e.overlayType);
	//});
	
</script>

<%@ include file="./include/footer.jsp"%>
<script>
</script>
