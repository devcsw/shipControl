<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./include/header.jsp"%>
<div id="map" style="width:100%; height:100%; max-height:800px;"></div>

<script type="text/javascript" 
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e70be96a08733981d994c3517a10a37&libraries=services,clusterer,drawing"></script>


<script>
$(document).ready(function() {
	homeSocketConnect();
});

	//지도API
	//map 생성
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(35.44294727060267, 129.36937385789298),
		level : 11
	};
	
	var map = new kakao.maps.Map(container, options);
	
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

	//회원가입
	$(function name() {
		let registerMessage = "${registermsg}";
		if (registerMessage == "success") {
			alert("회원가입에 성공하였습니다");
		}
	});
</script>	

<%@ include file="./include/footer.jsp"%>

