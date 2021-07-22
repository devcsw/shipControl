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
	<h2> 선박수 입력하면 자동으로 생성</h2>
	<label for="sh_count">선박수</label>
	<input type="text" id="sh_count" value="10"/>

	<input type="button" id="btnStart" value="실행" />
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
	$("#btnStart").click(function() {
		connect($("#sh_count").val());
	});
});

function connect(shCount){
	var arrlength = shCount;
	var latitude = new Array(arrlength);
	var longitude = new Array(arrlength);
	var count = new Array(arrlength);
	for(var i = 0; i < arrlength; i ++){
		latitude[i] = (Math.random()  + 35).toFixed(13);
		longitude[i] = (Math.random()   + 129).toFixed(13);
		count[i] = 19;
	}
	
	
	console.log("소켓시작");
	let ws = new SockJS("http://localhost:80/echo/");
	ws.onmessage = onMessage;
	ws.onclose = onClose;
	
	
	var plus = 0.01;
	var minus = -0.01; 
	// 메시지 전송
	setInterval(function () {
		
		for(var i = 0;i < arrlength; i ++){
			console.log("선박배열번호 : " + i);
				today = getTimeStamp(new Date());
				sendData = {
						"sh_id" : i + 1,
						"sh_status_latitude" : latitude[i] ,
						"sh_status_longitude" : longitude[i] ,
						"fire" : Math.floor(Math.random() * 5),
						"temperature" :Math.floor(Math.random() * 5),
						"smoke" : Math.floor(Math.random() * 5),
						"windSpeed" : Math.floor(Math.random() * 5),
						"windDirection" : Math.floor(Math.random() * 5),
						"gyroscope" : Math.floor(Math.random() * 5),
						"date" :  today
					}	
				//소켓 데이터 전송
				ws.send(JSON.stringify(sendData));
				//데이터 저장
				count[i] = count[i] + 1;
				if (count[i] == 20){
					insertData(sendData);
					count[i] = 0;
				}
				// 위도 경도 변경
				var rand = Math.floor(Math.random() * 4) + 1;
				if (rand == 1) {
				latitude[i] = parseFloat(latitude[i]) + parseFloat(plus);
				longitude[i] = parseFloat(longitude[i]) + parseFloat(plus);
				}
				else if (rand == 2) {
					latitude[i] = parseFloat(latitude[i]) + parseFloat(plus);
					longitude[i] = parseFloat(longitude[i]) - parseFloat(plus);
				}
				else if (rand == 3) {
					latitude[i] = parseFloat(latitude[i]) - parseFloat(plus);
					longitude[i] = parseFloat(longitude[i]) + parseFloat(plus);
				}
				else if (rand == 4) {
					latitude[i] = parseFloat(latitude[i]) - parseFloat(plus);
					longitude[i] = parseFloat(longitude[i]) - parseFloat(plus);
				}
				
			}
		}, 1000);
	
	
	// 서버로부터 메시지를 받았을 때 -- 본인 페이지에 적용
	function onMessage(msg) {
		var data = JSON.parse(msg.data);
		
		if (data.sh_id == $("#sh_id").val()){
			$("#messageArea").append(msg.data + "<br/>");
		}
	}

	// 서버와 연결을 끊었을 때
	function onClose(event) {
		$("#messageArea").append("연결 끊김");
		console.log(event.data);
		console.log(event);
		connect();
	}
	//비동기 데이터 저장
	function insertData(sendData) {
		console.log("ajax 자동 시작")
		var url = "/status/insertStatus";
		
		console.log(socketData);
		$.ajax({
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json"
			},
			"method" : "post",
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"success" : function(receivedData) {
				console.log(receivedData);
				if (receivedData == "success") {
					console.log("받음");
				}
			}
		});	
	}
}


</script>
</html>