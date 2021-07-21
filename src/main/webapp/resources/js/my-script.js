/**
 * my-script.js
 */

//소켓 데이터 수신@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function homesocketonnect() {
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
		var iwContent = '<div style="padding:5px;">Hello World!</div>';
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
//소켓통신끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

//지도 api 함수

//마커생성 함수
function getMarker(result, icon) {
	var marker = new kakao.maps.Marker({ 
		map: map,
	    position: new kakao.maps.LatLng(result.sh_status_latitude, result.sh_status_longitude),
	    title: result.sh_id,
	    image: icon,
	    clickable: true
	}); 
	return marker;
}

//인포윈도우 생성 함수
function getInfowindow(iwContent ){
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : true
	});
	return infowindow;
}
//마커 아이콘
function markerIcon(url){
	return new kakao.maps.MarkerImage(
			url,
		    new kakao.maps.Size(31, 35));
}
//정보얻기
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





//잡다한 함수들..

function make2digits(num) {
	if (num < 10) {
		num = "0" + num;
	}
	return num;
}

function changeDateString(timestamp) {
	var d = new Date(timestamp);
	var year = d.getFullYear();
	var month = make2digits(d.getMonth() + 1);
	var date = make2digits(d.getDate());
	var hour = make2digits(d.getHours());
	var minute = make2digits(d.getMinutes());
	var second = make2digits(d.getSeconds());
	return year + "-" + month + "-" + date 
			+ " " + hour + ":" + minute + ":" + second;
}

function isImage(fileName){
	var dotIndex = fileName.lastIndexOf(".");
	var ext = fileName.substring(dotIndex + 1).toUpperCase();
	if(ext == "JPG" || ext == "GIF" || "PNG"){
			return true;
	}
	return false;
}



//시간함수
function getTimeStamp() {
  var d = new Date();
  var s =
    leadingZeros(d.getFullYear(), 4) + '-' +
    leadingZeros(d.getMonth() + 1, 2) + '-' +
    leadingZeros(d.getDate(), 2) + ' ' +

    leadingZeros(d.getHours(), 2) + ':' +
    leadingZeros(d.getMinutes(), 2) + ':' +
    leadingZeros(d.getSeconds(), 2);

  return s;
}

function leadingZeros(n, digits) {
  var zero = '';
  n = n.toString();

  if (n.length < digits) {
    for (i = 0; i < digits - n.length; i++)
      zero += '0';
  }
  return zero + n;
}
