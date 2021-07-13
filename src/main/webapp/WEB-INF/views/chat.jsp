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
	 <label for="message">메세지</label><input type="text" id="message" />
	<input type="button" id="sendBtn" value="submit"/><br>
	<label for="sh_id">선박번호</label><input type="text" id="sh_id" /><br>
	<label for="sh_status_latitude">위도</label><input type="text" id="sh_status_latitude" /><br>
	<label for="sh_status_longitude">경도</label><input type="text" id="sh_status_longitude" /><br>
	<!-- 센서 데이터 //센서는 Null값이 넘어올 수 있음 -->
	<label for="fire">화재</label><input type="text" id="message" /><br>
	<label for="temperature">온도</label><input type="text" id="message" /><br>
	<label for="smoke">연기</label><input type="text" id="message" /><br>
	<label for="windSpeed">풍속</label><input type="text" id="message" /><br>
	<label for="windDirection">풍향</label><input type="text" id="message" /><br>
	<label for="gyroscope">기울기</label><input type="text" id="message" /><br>
	<!-- 정상 /센서등록되어있는데 데이터 없을시 연결실패/ 센서별 red코드일시에 긴급 /  -->
	<!--  센서별 코드 1:정상 2:연결실패 3:redcode 4:orangecode 5:yellocode -->
	<div id="messageArea"></div>
</body>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
			
<script type="text/javascript">
	//소켓으로 보낼 필요가 있나?
	// API 형태로 받았을 시에 처리.
	//메세지 전송시에 데이터처리
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});
	
	let sock = new SockJS("http://localhost:80/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
	}
	// 서버로부터 메시지를 받았을 때 -- 본인 페이지에 적용
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
</script>
</html>