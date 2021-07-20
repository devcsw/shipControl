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
		// $.get, $.post의 원형, JSON.stringify : json 데이터를 문자열로 변환
	$("#ajaxTest").click(function() {

		console.log("ajax 시작")
		var url = "/status/insertStatus";
		
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

	var latitude = (Math.random()  + 35).toFixed(13);
	var longitude = (Math.random()   + 129).toFixed(13);

	console.log("소켓시작");
	let ws = new SockJS("http://localhost:80/echo/");
	//let ws = new WebSocket("ws://localhost:80/echo/");
	ws.onmessage = onMessage;
	ws.onclose = onClose;
	var count = 19;
	
	var plus = 0.01;
	var minus = -0.01; 
	// 메시지 전송
	//function sendMessage() {
	setInterval(function () {
			if($("#sh_id").val() == ""){
				console.log("데이터없음");
			} else{
				today = getTimeStamp(new Date());
				sendData = {
						"sh_id" : $("#sh_id").val(),
						"sh_status_latitude" : latitude ,
						"sh_status_longitude" : longitude ,
						"fire" : Math.floor(Math.random() * 5),
						"temperature" :Math.floor(Math.random() * 5),
						"smoke" : Math.floor(Math.random() * 5),
						"windSpeed" : Math.floor(Math.random() * 5),
						"windDirection" : Math.floor(Math.random() * 5),
						"gyroscope" : Math.floor(Math.random() * 5),
						"date" :  today
					}	
				ws.send(JSON.stringify(sendData));
				//데이터 저장
				count = count + 1;
				console.log("count 체크" + count);
				if (count == 20){
					console.log("count 체크" + count);
					insertData(sendData);
					count = 0;
				}
				// 위도 경도 변경
				var rand = Math.floor(Math.random() * 4);
				console.log("rand:" + rand);
				if (rand == 1) {
				latitude = parseFloat(latitude) + parseFloat(plus);
				longitude = parseFloat(longitude) + parseFloat(plus);
				}
				else if (rand == 2) {
					latitude = parseFloat(latitude) + parseFloat(plus);
					longitude = parseFloat(longitude) - parseFloat(plus);
				}
				else if (rand == 3) {
					latitude = parseFloat(latitude) - parseFloat(plus);
					longitude = parseFloat(longitude) + parseFloat(plus);
				}
				else if (rand == 4) {
					latitude = parseFloat(latitude) - parseFloat(plus);
					longitude = parseFloat(longitude) - parseFloat(plus);
				}
				
			}
		}, 3000);
	//}
	
	
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
				// 처리가 잘 되었다면, 댓글 목록 버튼을 클릭시켜서 목록을 새로 얻음
				if (receivedData == "success") {
					console.log("받음");
				}
			}
		});	
	}
}


</script>
</html>