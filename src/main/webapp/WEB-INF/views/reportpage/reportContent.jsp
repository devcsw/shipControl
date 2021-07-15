<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f71a92fecd7b42434cde225a0893ff1"></script>
<script type="text/javascript">
	$(function name() {
		$("#buttonRegisterAcdHnd").click(function name() {

			let url = "/addAcdHnd";
			let sendData = {
				"acd_id" : ${acdVo.acd_id},
				"acd_hnd_content" : $("#ACD_HND_CONTENT").val(),
				"acd_hnd_take" : $("#ACD_HND_TAKE").val()
			};
			
			$.post(url, sendData, function name(rData) {
				console.log(sendData);
				console.log(rData);
				if (rData == "success") {
					$("#closeModalButton").trigger("click");
					location.reload();
				}
				
			});

		});
	});
</script>


<!-- 상새내역 title -->
<div class="container-fluid">


	<div class="row">
		<div class="col-md-12">
			<h3>조난 상세내역 페이지</h3>

			<dl>
				<dt>사고번호 ${acdVo.acd_id}번 상세내역입니다</dt>
			</dl>
		</div>
	</div>
</div>
<!-- 상새내역 title 끝 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<!-- 지도데이터 div -->
			<div class="row">
				<div class="d-flex justify-content-center">
					<div id="map" style="width: 500px; height: 500px;"></div>
				</div>
			</div>

			<div class="row">
				<div class="d-flex justify-content-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination">

							<c:forEach items="list" var="v" varStatus="vs">
								<li class="page-item"><a class="page-link" href="#">${vs.count}
								</a></li>
							</c:forEach>

						</ul>
					</nav>
				</div>
			</div>
			<script>
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center : new kakao.maps.LatLng(35.44294727060267,
							129.36937385789298), //지도의 중심좌표.
					level : 7
				//지도의 레벨(확대, 축소 정도)
				};

				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

				let xLocation = 35.44294727060267;
				let yLocation = 129.36937385789298;

				$(function name() {

					xLocation = $("#acd_latitude").text();
					yLocation = $("#acd_longitude").text();

					let marker = new kakao.maps.Marker({
						// 지도 중심좌표에 마커를 생성합니다 
						position : map.getCenter()
					});

					marker.setMap(map);

					marker.setPosition(new kakao.maps.LatLng(xLocation,
							yLocation));
					
					kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
					    
					    // 클릭한 위도, 경도 정보를 가져옵니다 
					    var latlng = mouseEvent.latLng; 
					    
					    // 마커 위치를 클릭한 위치로 옮깁니다
					    marker.setPosition(latlng);
					    
					    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
					    message += '경도는 ' + latlng.getLng() + ' 입니다';
					    
					    console.log(message);
					    
					    
					});

				});
				
			</script>
			<!-- 지도데이터 div 끝 -->
		</div>
		<!-- 상세내역 테이블 -->
		<div class="col-md-6">
			<table class="table">

				<tbody>
					<tr>
						<th>사고번호</th>
						<td>${acdVo.acd_id }</td>
					</tr>
					<tr>
						<th>사고 코드</th>
						<td>${acdVo.acd_code_id }</td>
					</tr>
					<tr>
						<th>사고위도</th>
						<td id="acd_latitude">${acdVo.acd_latitude}</td>
					</tr>
					<tr>
						<th>사고경도</th>
						<td id="acd_longitude">${acdVo.acd_longitude}</td>
					</tr>
					<tr>
						<th>사고발생시간</th>
						<td>${acdVo.acd_date }</td>
					</tr>
					<tr>
						<th>선박번호</th>
						<td>${acdVo.sh_id }</td>
					</tr>
					<tr>
						<th>진행상태</th>
						<td>${acdVo.acd_take }</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 상세내역 테이블 끝 -->
	</div>
</div>

<!-- 처리내역 -->

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3>사고 처리내역</h3>
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>사고번호</th>
						<th>처리내용</th>
						<th>진행상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${acdHndList}" var="list" varStatus="vs">
						<tr>
							<td>${list.acd_hnd_id}</td>
							<td>${list.acd_id }</td>
							<td>${list.acd_hnd_content }</td>
							<td>${list.acd_hnd_take }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 처리내역 등록 modal -->

			<a id="modal-903118" href="#modal-container-903118" role="button"
				class="btn btn-primary" data-toggle="modal">처리내역 등록하기</a>

			<div class="modal fade" id="modal-container-903118" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">처리내역 등록하기</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">

							<form role="form" action="/addAcdHnd" method="post"
								id="acdHndForm">

								<div class="form-group">
									<label for="ACD_HND_CONTENT"> 사고 처리 내용 </label>
									<textarea class="form-control" id="ACD_HND_CONTENT"
										name="ACD_HND_CONTENT" rows="5"></textarea>

								</div>
								<div class="form-group">
									<label for="ACD_HND_TAKE"> 사고처리 진행상태 </label> <input
										type="text" class="form-control" id="ACD_HND_TAKE"
										name="ACD_HND_TAKE" />
								</div>
							</form>

						</div>
						<div class="modal-footer">

							<button type="button" class="btn btn-primary"
								id="buttonRegisterAcdHnd">처리내역 등록하기</button>
							<button type="button" class="btn btn-secondary"
								id="closeModalButton" data-dismiss="modal">취소</button>
						</div>
					</div>

				</div>

			</div>

			<!-- 처리내역 등록 modal 끝 -->
			<div class="col-md-12">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn btn-success">수정하기</button>
					<a href="/reportPage" class="btn btn-warning">목록으로</a>
				</div>
			</div>


		</div>
	</div>
</div>

<!-- 처리내역 끝 -->

<%@ include file="../include/footer.jsp"%>