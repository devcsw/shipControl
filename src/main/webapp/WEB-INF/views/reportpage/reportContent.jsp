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
		
		$(".acdhndUpdateButton").click(function name() {
			let handleId = $(this).parent().parent().find('td:first-child').text();
			
			let url = "/getAcdVoById";
			let sendData = {
				"acd_hnd_id" : handleId	
			};
			
			$.get(url, sendData, function name(rData) {
				console.log(rData);
				
				$("#acd_hnd_id").val(rData.acd_hnd_id);
				$("#acd_hnd_content").val(rData.acd_hnd_content);
				$("#acd_hnd_take").val(rData.acd_hnd_take);
				
			})
			
			
		});
		
		$("#buttonUpdateAcdHnd").click(function name() {
			$("#acdHndUpdateForm").submit();
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
					<div id="map" style="width: 800px; height: 500px;"></div>
				</div>
			</div>

			<div class="row">
				<div class="d-flex justify-content-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination">

							<c:forEach items="${acdHndList}" var="v" varStatus="vs">
								<li
									class="page-item <c:if test="${acd_hnd_page == vs.count}"> active</c:if>"><a
									class="page-link"
									href="/reportContent?acd_id=${acdVo.acd_id}&acd_hnd_page=${vs.count}">${vs.count}
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
					level : 11
				//지도의 레벨(확대, 축소 정도)
				};

				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

				map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);
				
				let xLocation = 35.44294727060267;
				let yLocation = 129.36937385789298;

				$(function name() {
					
					// x, y location -> text에서 추출하지 말고 처리시간 기준으로 ship_status_tb 에서 +- 2분? 정도에서 위도, 경도 값 받아올것
					// $("#acd_latitude").text(), $("#acd_longitude").text() 또한 값 수정할 것
					xLocation = $("#acd_latitude").text();
					yLocation = $("#acd_longitude").text();

					let marker = new kakao.maps.Marker({
						// 지도 중심좌표에 마커를 생성합니다 
						position : map.getCenter()
					});

					marker.setMap(map);

					marker.setPosition(new kakao.maps.LatLng(xLocation,
							yLocation));
					
					let iwPosition = new kakao.maps.LatLng(xLocation,yLocation);
					let iwContent = '<div class="card mb-3 p-3" style="width:400px">';
					iwContent += '<h5 class="card-header">';
					iwContent += '처리상황';
					iwContent += '</h5>';
					iwContent += '<div class="card-body">';
					iwContent += '<p class="card-text">';
					iwContent += '<div>';
					iwContent += '위도 : <br>';
					iwContent += '경도 : <br>';
					iwContent += '처리시간 : ${acdHndList[acd_hnd_page-1].acd_hnd_date}<br>';
					iwContent += '처리내용 : ${acdHndList[acd_hnd_page-1].acd_hnd_content}<br>';
					iwContent += '진행상태 : ${acdHndList[acd_hnd_page-1].acd_hnd_take}<br>';
					iwContent += '</div>';
					iwContent += '</p>';
					iwContent += '</div>';
					iwContent += '</div>';
					
					let infoWindow = new kakao.maps.InfoWindow({
						content : iwContent,
						position : iwPosition,
					});
					
					infoWindow.open(map, marker);
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

			<div class="d-flex justify-content-end">
				<a type="button" class="btn btn-success"
					href="/reportUpdatePage?acd_id=${acdVo.acd_id }">수정하기</a> <a
					href="/reportPage" class="btn btn-primary">목록으로</a>
			</div>
		</div>



		<!-- 상세내역 테이블 끝 -->
	</div>
</div>

<!-- 처리내역 -->

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div>
				<h3>사고 처리내역</h3>
				<a id="modal-903118" href="#modal-container-903118" role="button"
					class="btn btn-primary" data-toggle="modal">처리내역 등록하기</a>
			</div>

			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>사고번호</th>
						<th>처리내용</th>
						<th>진행상태</th>
						<th>수정하기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${acdHndList}" var="list" varStatus="vs">
						<tr>
							<td>${list.acd_hnd_id}</td>
							<td>${list.acd_id }</td>
							<td>${list.acd_hnd_content }</td>
							<td>${list.acd_hnd_take }</td>
							<td><a id="modal-807875" href="#modal-container-807875"
								role="button" class="btn btn-success acdhndUpdateButton"
								data-toggle="modal">처리내역 수정하기</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 처리내역 수정 modal -->

			<div class="modal fade" id="modal-container-807875" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">처리내역 수정 페이지</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<form role="form" action="/updateAcdHndById" method="post"
								id="acdHndUpdateForm">
								<input type="hidden" id="acd_id" name="acd_id"
									value="${acdVo.acd_id}">
								<div class="form-group">
									<label for="acd_hnd_id"> # </label> <input type="text"
										class="form-control" id="acd_hnd_id" name="acd_hnd_id"
										readonly="readonly" />
								</div>

								<div class="form-group">
									<label for="acd_hnd_content"> 신고 내용 </label>
									<textarea class="form-control" rows="5" cols="10"
										id="acd_hnd_content" name="acd_hnd_content"></textarea>
								</div>

								<div class="form-group">
									<label for="acd_hnd_take"> 진행 상태 </label> <input type="text"
										class="form-control" id="acd_hnd_take" name="acd_hnd_take" />
								</div>
							</form>
						</div>
						<div class="modal-footer">

							<button type="button" class="btn btn-primary"
								id="buttonUpdateAcdHnd">처리내역 수정하기</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
						</div>
					</div>

				</div>

			</div>



			<!-- 처리내역 등록 modal -->



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



		</div>
	</div>
</div>

<!-- 처리내역 끝 -->

<%@ include file="../include/footer.jsp"%>