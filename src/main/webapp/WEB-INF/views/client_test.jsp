<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./include/header.jsp"%>

<!--  소켓통신 테스트 페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>소켓통신 테스트 페이지</title>
</head>
<body>
	<h1>소켓통신 테스트 페이지</h1>
	<h2> 테스트 할려면  선박번호에 등록된 번호를 입력해놓으면 자동으로 찾아서 보여줌</h2>
	<label for="sh_id">선박번호</label>
	<input type="text" id="sh_id" />
	<br>
	<label for="sh_status_latitude">위도</label>
	<input type="text" id="sh_status_latitude" />
	<br>
	<label for="sh_status_longitude">경도</label>
	<input type="text" id="sh_status_longitude" />
	<br>
	<!-- 센서 데이터 //센서는 Null값이 넘어올 수 있음 -->
	<label for="fire">화재</label>
	<input type="text" id="fire" />
	<br>
	<label for="temperature">온도</label>
	<input type="text" id="temperature" />
	<br>
	<label for="smoke">연기</label>
	<input type="text" id="smoke" />
	<br>
	<label for="windSpeed">풍속</label>
	<input type="text" id="windSpeed" />
	<br>
	<label for="windDirection">풍향</label>
	<input type="text" id="windDirection" />
	<br>
	<label for="gyroscope">기울기</label>
	<input type="text" id="gyroscope" />
	<br>

	<input type="button" id="sendBtn" value="보내기" />
	<input type="button" id="ajaxTest" value="데이터저장" />
	<br>
	<!-- 정상 /센서등록되어있는데 데이터 없을시 연결실패/ 센서별 red코드일시에 긴급 /  -->
	<!--  센서별 코드 1:정상 2:연결실패 3:redcode 4:orangecode 5:yellocode -->
	<div id="messageArea"></div>
</body>

<!--
오른쪽 밑 35.33739730025277/129.59474464012257
오른쪽 위 35.472543181966444/129.5849838182228
왼쪽끝 35.46939737546278/129.3438031220253
왼쪽 밑 35.36703907063168/129.3584398895261
-->

<script type="text/javascript">

//저장용 데이터
var socketData = "";

$(document).ready(function() {
	
		connect();
		
		console.log("ajax 시작")
		var url = "/status/insertStatus";
		
		// $.get, $.post의 원형, JSON.stringify : json 데이터를 문자열로 변환
	$("#ajaxTest").click(function() {
		console.log(socketData);
		$.ajax({
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json"
			},
			"method" : "post",
			"dataType" : "text",
			"data" : JSON.stringify(socketData),
			"success" : function(receivedData) {
				console.log(receivedData);
				// 처리가 잘 되었다면, 댓글 목록 버튼을 클릭시켜서 목록을 새로 얻음
				if (receivedData == "success") {
					console.log("받음");
				}
			}
		});	
	});

});

function connect(){
	console.log("소켓시작");
	let ws = new SockJS("http://localhost:80/echo/");
	ws.onmessage = onMessage;
	ws.onclose = onClose;
	
	
	// 메시지 전송
	//function sendMessage() {
	setInterval(function () {
		console.log("함수 시작");
		//var dataArray = new Array();
			console.log("자동 전송 시작");
			today = getTimeStamp(new Date());
			sendData = {
					"sh_id" : $("#sh_id").val(),
					"sh_status_latitude" : (Math.random()  + 35).toFixed(13),
					"sh_status_longitude" : (Math.random()   + 129).toFixed(13),
					"fire" : Math.floor(Math.random() * 5),
					"temperature" :Math.floor(Math.random() * 5),
					"smoke" : Math.floor(Math.random() * 5),
					"windSpeed" : Math.floor(Math.random() * 5),
					"windDirection" : Math.floor(Math.random() * 5),
					"gyroscope" : Math.floor(Math.random() * 5),
					"date" :  today
				}	
			ws.send(JSON.stringify(sendData));
			socketData = sendData;
		}, 3000);
	//}
	
	
	// 서버로부터 메시지를 받았을 때 -- 본인 페이지에 적용
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
	}

	// 서버와 연결을 끊었을 때
	function onClose(event) {
		$("#messageArea").append("연결 끊김");
		connect();
	}
}


//메세지 버튼전송
$("#sendBtn").click(function() {
	sendData = {
		"sh_id" : $("#sh_id").val(),
		"sh_status_latitude" : $("#sh_status_latitude").val(),
		"sh_status_longitude" : $("#sh_status_longitude").val(),
		"fire" : $("#fire").val(),
		"temperature" : $("#temperature").val(),
		"smoke" : $("#smoke").val(),
		"windSpeed" : $("#windSpeed").val(),
		"windDirection" : $("#windDirection").val(),
		"gyroscope" : $("#gyroscope").val()
	}
	sendMessage(sendData);
	$('#message').val('')
});

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
</script>
</html>