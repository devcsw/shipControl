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
	<br>
	<!-- 정상 /센서등록되어있는데 데이터 없을시 연결실패/ 센서별 red코드일시에 긴급 /  -->
	<!--  센서별 코드 1:정상 2:연결실패 3:redcode 4:orangecode 5:yellocode -->
	<div id="messageArea"></div>
</body>



<script type="text/javascript">
	$(document).ready(function() {

		//계속 데이터를 쏴주는 코드 작성
		//생성되는 데이터 기준으로 화면 변경 및 데이터 베이스 입력
		playAlert = setInterval(function() {
			// 리스트에 선박데이터 배열 100개 생성 코드
			//생성 될 때마다 테이블 변경
			// 추후 생성 될 때마다 지도 api에 위치 마크업
			// 서버에서 데이터 받는 방법 짜기
			var dataArray = new Array();
			console.log("자동 전송 시작");

			//for (var v = 0; v < 3; v++) {

			sendData = {
				"sh_id" :Math.floor(Math.random() * 10),
					"sh_status_latitude" : Math.floor(Math.random() * 100),
					"sh_status_longitude" : Math.floor(Math.random() * 100),
					"fire" : Math.floor(Math.random() * 5),

					"temperature" :Math.floor(Math.random() * 100),
					"smoke" : Math.floor(Math.random() * 100),
					"windSpeed" : Math.floor(Math.random() * 100),
					"windDirection" : Math.floor(Math.random() * 100),
					"gyroscope" : Math.floor(Math.random() * 100),
					"date" :  today
				}
			 	dataArray.push(sendData);
			
			
		//	}
		var sJson = JSON.stringify(dataArray);
		sendTest("test");
		sendMessage(sendData);
		

		
	}, 1000);
});
				"sh_id" : Math.floor(Math.random() * 10),
				"sh_status_latitude" : Math.floor(Math.random() * 100),
				"sh_status_longitude" : Math.floor(Math.random() * 100),
				"fire" : Math.floor(Math.random() * 100),
				"temperature" : Math.floor(Math.random() * 100),
				"smoke" : Math.floor(Math.random() * 100),
				"windSpeed" : Math.floor(Math.random() * 100),
				"windDirection" : Math.floor(Math.random() * 100),
				"gyroscope" : Math.floor(Math.random() * 100)
			}
			dataArray.push(sendData);
			//	}
			var sJson = JSON.stringify(dataArray);
			sendTest("test");
			sendMessage(sendData);
		}, 1000);
	});

	//메세지 전송시에 데이터처리
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

	let sock = new SockJS("http://localhost:80/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;

	// 메시지 전송
	function sendMessage(sendData) {
		sock.send(JSON.stringify(sendData));
	}
	// 메시지 전송
	function sendTest(msg) {
		sock.send(msg);
	}
	// 서버로부터 메시지를 받았을 때 -- 본인 페이지에 적용
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
	}

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");
		setTimeout(socketInit, 300);
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
</script>
</html>