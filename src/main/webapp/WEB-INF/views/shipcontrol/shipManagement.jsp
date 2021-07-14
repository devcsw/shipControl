<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<script>
$(document).ready(function() {
//sh_id, sh_name, sh_board_code, sh_owner, sh_owner_tel, 
//sh_cap_name, sh_cap_tel, sh_type, sh_mmsi, sh_call_sign, sh_date
	connect();
});

console.log('함수시작점')
//소켓 데이터 수신
function connect() {
	console.log('함수안')
	let ws = new SockJS("http://localhost:80/echo/");
	socket = ws;
	
	//한번 오픈하는듯?
	ws.onopen = function(){
		console.log('Info : connection opend');
	}
	//메세지 받았을때
	ws.onmessage = function(event){
		console.log("ReceiveMessage : ", event.data + '\n');
		//여기서 테이블 변경
	}
	//끝날때 보여줌
	ws.onclose = function(event){
		console.log('Info : connection closed');
		/*
		setTimeout(() => {
			connect();
		}, 1000);
		*/
	}	
	//에러가 생겼을때
	ws.onerror = function(err) {console.log('Error : ', err);}
}

</script>

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
								<input type="checkbox" name="windSpeed" id="windSpeed"  value="3"/> 풍속 센서
							</label>
						</div> 
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name="gyroscope" id="gyroscope" value="5" /> 기울기 센서
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
								<input type="checkbox" name="smoke" id="smoke" value="4"/> 연기 센서
							</label>
						</div>  
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name="windDirection" id="windDirection" value="6"/> 풍향 센서
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
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-1"></div>
		<div class="col-md-3">
			<form class="d-flex">
				<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
				href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">선박명</a> 
						<a class="dropdown-item" href="#">긴급여부</a> 
						<a class="dropdown-item" href="#">센서코드</a>
					</div>
				<input class="form-control me-sm-2" type="text" placeholder="Search">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</div>
	<br>
	<!-- //검색버튼 -->
	<!-- 등록수정버튼 -->
	<div class="row">
		<div class="col-md-12">
			<a type="button" class="btn btn-primary" data-toggle="modal"  href="#modal-container-200855">등록</a>
			<!--  <button type="button" class="btn btn-secondary">수정</button> -->
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
				
				<tbody>
					<c:forEach var="list" items="${list}">
						<tr >
	    					<td>${list.sh_id }</td>
	    					<td>${list.sh_name }</td>
	    					<td>${list.sh_board_code }</td>
	    					<td>${list.fire }</td>
	    					<td>${list.temperature }</td>
	    					<td>${list.smoke }</td>
	    					<td>${list.windspeed }</td>
	    					<td>${list.widdirection }</td>
	    					<td>${list.gyroscope }</td>
	    					<td></td>
	    					<td></td>
	    					<td></td>
	   					</tr>
					</c:forEach>
				</tbody>
				
			</table>
			<!-- //테이블  -->
			
			<!-- 
			<div class="row">
				<div class="col-md-2">
					<div>
						<ul class="pagination pagination-sm">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
			</div>
		  -->
		</div>

	</div>
</div>



<%@ include file="../include/footer.jsp"%>