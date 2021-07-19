<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<script>
$(document).ready(function() {
//sh_id, sh_name, sh_board_code, sh_owner, sh_owner_tel, 
//sh_cap_name, sh_cap_tel, sh_type, sh_mmsi, sh_call_sign, sh_date
	connect();
	
	// 검색 옵션 선택
	$(".searchType").click(function(e) {
		e.preventDefault();
		var searchType = $(this).attr("href");
		$("#frmSearch > input[name=searchType]").val(searchType);
		$("#spanSearchType").text($(this).text());
	});
	// 검색버튼
	$("#btnSearch").click(function() {
		var searchType = 
			$("#frmSearch> input[name=searchType]").val();
		if (searchType == "") {
			alert("검색 옵션을 먼저 선택해 주세요");
			return;
		}
		var keyword = $("#txtSearch").val().trim();
		if (keyword == "") {
			alert("검색어를 입력해 주세요");
			return;
		}
		$("#frmSearch > input[name=keyword]").val(keyword);
		$("#frmSearch").submit();
	});
});

//소켓 데이터 수신
function connect() {
	console.log("onConnect")
	let ws = new SockJS("http://localhost:80/echo/");
	socket = ws;
	
	//이벤트 발생시
	ws.onopen = function(){
		console.log('Info : connection opend');
	}
	//메세지 받았을때
	ws.onmessage = function(event){
		//console.log("ReceiveMessage : ", event.data + '\n');
		//여기서 테이블 변경
		tableCreate(event.data);
		
	}
	//끝날때 보여줌
	ws.onclose = function(event){
		console.log('Info : connection closed');
		connect();
	
	}	
	//에러가 생겼을때
	ws.onerror = function(err) {console.log('Error : ', err);}
}


function tableCreate(receivedData){

	var result = JSON.parse(receivedData);
	var id = result.sh_id;
	var fire = result.fire;
	var temperature= result.temperature;
	var smoke = result.smoke;
	var windSpeed = result.windSpeed;
	var windDirection = result.windDirection;
	var gyroscope = result.gyroscope;
	var date = result.date;
	var target = $('#tr'+ id).find("td");
	var emergencyCode =""
	
	// 데이터 받을때마다 위험도 체크
//	if (fire>=4 || temperature>=4 || moke >=4 || windSpeed >=4 || windDirection >=4 || gyroscope >=4){
	if (fire>=4 ){
		emergencyCode = "위험";
	} else if(fire >=2) {
		emergencyCode = "주의";
	} else {
		emergencyCode = "정상"
	}
	
	console.log(target.eq(3).text().trim());
	
	//화면 설정
	if (target.eq(3).text().trim() != "") {	target.eq(3).text(fire);}
	if (target.eq(4).text().trim() != "") {	target.eq(4).text(temperature);	}
	if (target.eq(5).text().trim() != "") {	target.eq(5).text(smoke);}
	if (target.eq(6).text().trim() != "") {	target.eq(6).text(windSpeed);}
	if (target.eq(7).text().trim() != "") {	target.eq(7).text(windDirection);}
	if (target.eq(8).text().trim() != "") {	target.eq(8).text(gyroscope);}
	

	target.eq(9).text(date);
	target.eq(10).text(emergencyCode);
	if (emergencyCode=="위험"){
		$('#tr' + id).css("color", "red");	
	} else if (emergencyCode=="주의") {
		$('#tr' + id).css("color", "orange");
	} else {
		$('#tr' + id).css("color", "green");
	}
}

</script>
<form id="frmSearch" action="/shipcontrol/management" method="get">
	<input type="hidden" name="searchType" value="${searchType}"/>
	<input type="hidden" name="keyword" value="${keyword}"/>
</form>
<!--  선박등록 모달창 -->
<!--  <a id="modal-200855" href="#modal-container-200855" role="button" class="btn" data-toggle="modal">Launch demo modal</a>-->

<div class="modal fade" id="modal-container-200855" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<form action="/shipcontrol/insertShip" method="post" id="insertForm">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">
					선박등록
				</h5> 
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			
			<div class="modal-body">
			
				<div class="row">
					<div class="col-md-6">
	<!-- sh_id, sh_name, sh_board_code, sh_owner, sh_owner_tel, 
	sh_cap_name, sh_cap_tel, sh_type, sh_mmsi, sh_call_sign, sh_date -->
						<label for="sh_id">
							선박번호
						</label>
						<input type="text" class="form-control" id="sh_id" name="sh_id" />
						
						<label for="sh_board_code">
							센서코드
						</label>
						<input type="text" class="form-control" id="sh_board_code" name="sh_board_code" />
						
						<label for="sh_owner">
							선주
						</label>
						<input type="text" class="form-control" id="sh_owner" name="sh_owner" />
						
						<label for="sh_cap_name">
							선장이름
						</label>
						<input type="text" class="form-control" id="sh_cap_name" name="sh_cap_name" />
						
						<label for="sh_call_sign">
							호출부호
						</label>
						<input type="text" class="form-control" id="sh_call_sign" name="sh_call_sign" />
						<br>
					
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name=fire id="fire" value="1"/> 화재 센서
							</label>
						</div> 
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name="smoke" id="smoke" value="3"/> 연기 센서
							</label>
						</div>  
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name="windDirection" id="windDirection" value="5"/> 풍향 센서
							</label>
						</div> 
				
						
					</div>
					<div class="col-md-6">
					
						<label for="sh_name">
							선박이름
						</label>
						<input type="text" class="form-control" id="sh_name" name="sh_name" />
						
						<label for="sh_mmsi">
							mmsi
						</label>
						<input type="text" class="form-control" id="sh_mmsi" name="sh_mmsi" />
						
						<label for="sh_owner_tel">
							선주번호
						</label>
						<input type="text" class="form-control" id="sh_owner_tel" name="sh_owner_tel" />
						
						<label for="sh_cap_tel">
							선장번호
						</label>
						<input type="text" class="form-control" id="sh_cap_tel" name="sh_cap_tel" />
						
						<label for="sh_type">
							선박타입
						</label>
						<input type="text" class="form-control" id="sh_type" name="sh_type" />
						<br>
						
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name="temperature" id="temperature" value="2"/> 온도 센서
							</label>
						</div>
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name="windSpeed" id="windSpeed"  value="4"/> 풍속 센서
							</label>
						</div> 
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name="gyroscope" id="gyroscope" value="6" /> 기울기 센서
							</label>
						</div> 
					</div>
				</div>
		
		</div>
		
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary" id="btnShipInsert">
					저장하기
				</button> 
				
				<button type="button" class="btn btn-secondary" data-dismiss="modal">
					닫기
				</button>
			</div>
			</form>
			
		</div>
	</div>
</div>
<!--  //선박등록 모달창 -->

<div class="container-fluid">
	<br>
	<!-- 검색버튼 -->
	<div class="row">
		<div class="col-md-2">
			<a type="button" class="btn btn-primary" data-toggle="modal"  href="#modal-container-200855">등록</a>
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-1"></div>
		<div class="col-md-3">
				
			<form class="d-flex">
				
				<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
				href="#" role="button" aria-haspopup="true" aria-expanded="false" id="dropdown" >
					<span id="spanSearchType">검색조건
						<c:choose>
							<c:when test="${searchType == 'id'}">선박번호</c:when>
							<c:when test="${searchType == 'name'}">선박명</c:when>
							<c:when test="${searchType == 'code'}">센서코드</c:when>
						</c:choose>
					</span>
				
				</a>
				
					<div class="dropdown-menu">
						<a class="dropdown-item searchType" href="id" >선박번호</a> 
						<a class="dropdown-item searchType" href="name">선박명</a> 
						<a class="dropdown-item searchType" href="code">센서코드</a>
					</div>
				<input class="form-control me-sm-2" type="text" placeholder="Search" id="txtSearch" value="${keyword}">
				<button class="btn btn-secondary my-2 my-sm-0" type="button" id="btnSearch">Search</button>
			</form>
		</div>
	</div>


	<br>
	<!--//등록수정버튼 -->
	<!--  테이블 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table" id="tb" >
				<thead>
					<tr>
						<th>선박번호</th>
						<th>선박명</th>
						<th>센서코드</th>
						<th>화재</th>
						<th>온도</th>
						<th>연기</th>
						<th>풍속</th>
						<th>풍향</th>
						<th>기울기</th>
						<th>보고일시</th>
						<th>긴급여부</th>
						<th><a>상세보기</a></th>
					</tr>
				</thead>
				
				<tbody id="tbody">
					<c:forEach var="list" items="${list}">
						<tr id="tr${list.sh_id}">
	    					<td id="${list.sh_id}"><a href="/shipcontrol/updateShipForm?sh_id=${list.sh_id}"  >${list.sh_id}</a></td>
	    					<td>${list.sh_name }</td>
	    					<td>${list.sh_board_code }</td>
	    					<td>
		    					<c:if test="${not empty list.fire }">
	    							<button class="btn btn-secondary btn-sm">on</button>
								</c:if>
							</td>
	    					<td>
		    					<c:if test="${not empty list.temperature }">
	    							<button class="btn btn-secondary btn-sm">on</button>
								</c:if>
							</td>
	    					<td>
	    						<c:if test="${not empty list.smoke }">
	    							<button class="btn btn-secondary btn-sm">on</button>
								</c:if>
	    					</td>
	    					<td>
	    						<c:if test="${not empty list.windspeed }">
	    							<button class="btn btn-secondary btn-sm">on</button>
								</c:if>
	    					</td>
	    					<td>
	    						<c:if test="${not empty list.winddirection }">
	    							<button class="btn btn-secondary btn-sm">on</button>
								</c:if>
	    					</td>
	    					<td>
	    						<c:if test="${not empty list.gyroscope }">
	    							<button class="btn btn-secondary btn-sm">on</button>
								</c:if>
	    					</td>
	    					<td></td>
	    					<td></td>
	    					<td><a class="btn btn-primary" 
	    					href="/shipcontrol/statusList?sh_id=${list.sh_id}" 
	    					>내역</a>
	    					</td>
	   					</tr>
					</c:forEach>
				</tbody>
				
			</table>
			<!-- //테이블  -->

		</div>
	</div>
</div>



<%@ include file="../include/footer.jsp"%>