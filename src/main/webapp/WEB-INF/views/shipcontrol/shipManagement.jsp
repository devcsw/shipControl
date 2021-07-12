<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<script>
$(document).ready(function() {
//sh_id, sh_name, sh_board_code, sh_owner, sh_owner_tel, 
//sh_cap_name, sh_cap_tel, sh_type, sh_mmsi, sh_call_sign, sh_date
	$('#btnShipInsert').click(function() {	
		
		$("#insertForm").submit();

	});
});
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
								<input type="checkbox" name="fire" /> 화재 센서
							</label>
						</div> 
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name="windSpeed"  /> 풍속 센서
							</label>
						</div> 
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name="gyroscope"  /> 기울기 센서
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
								<input type="checkbox" name="temperature"/> 온도 센서
							</label>
						</div>
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name="smoke" /> 연기 센서
							</label>
						</div>  
						<div class="checkbox">					 
							<label>
								<input type="checkbox" name="windDirection" /> 풍향 센서
							</label>
						</div> 
				
					</div>
				</div>
		
		</div>
		
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btnShipInsert">
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
			<table class="table">
				<thead>
					<tr>
						<th>선박번호</th>
						<th>선박명</th>
						<th>센서코드</th>
						<th>센서1</th>
						<th>센서2</th>
						<th>센서3</th>
						<th>센서4</th>
						<th>센서5</th>
						<th>보고일시</th>
						<th>긴급여부</th>
						<th><a>상세보기</a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
					</tr>
					<tr>
						<td>2</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
					</tr>

				</tbody>
			</table>
			<!-- //테이블  -->
			
			<!-- 페이징  -->
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
			<!-- //페이징  -->
		</div>

	</div>
</div>




<%@ include file="../include/footer.jsp"%>