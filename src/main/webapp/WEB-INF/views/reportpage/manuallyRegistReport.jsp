<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f71a92fecd7b42434cde225a0893ff1"></script>
<script type="text/javascript">
	$(function name() {
		$("#buttonAcdRegister").click(function name() {
			$("#acdReportForm").submit();
		});

		$("#buttonConfirmAcdCode").one('click', function() {

			let url = "/getAcdCode";

			$.get(url, function name(rData) {

				for (var v = 0; v < rData.length; v++) {
					let str = "";
					str += "<tr>";
					str += "<th>" + rData[v].acd_code_id + "</th>";
					str += "<td>" + rData[v].acd_code_name + "</td>";
					str += "</tr>";
					$("#acdCodeTable").append(str);
				}

			});
		});

	});
</script>

<!-- 등록 페이지 title -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3>조난 등록 페이지 입니다</h3>
			<dl>
				<dt>조난 데이터가 자동으로 넘어오지 않아 수동으로 입력하는 페이지 입니다</dt>
			</dl>
		</div>
	</div>
</div>
<!-- 등록 페이지 title ends -->

<!-- 조난 내역 등록 -->
<div class="container-fluid">
	<div class="row">

		<!-- 지도데이터 div -->

		<div class="col-md-6">
			<div class="d-flex justify-content-center">
				<div id="map" style="width: 500px; height: 400px;"></div>
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

				marker.setPosition(new kakao.maps.LatLng(xLocation, yLocation));

				kakao.maps.event.addListener(map, 'click',
						function(mouseEvent) {

							// 클릭한 위도, 경도 정보를 가져옵니다 
							var latlng = mouseEvent.latLng;

							// 마커 위치를 클릭한 위치로 옮깁니다
							marker.setPosition(latlng);

							var message = '클릭한 위치의 위도는 ' + latlng.getLat()
									+ ' 이고, ';
							message += '경도는 ' + latlng.getLng() + ' 입니다';

							console.log(message);

							$(function name() {
								$("#acd_latitude").val(latlng.getLat());
								$("#acd_longitude").val(latlng.getLng());
							});
						});
			});
		</script>
		<!-- 지도데이터 div 끝 -->

		<!-- 상세내역 테이블 -->
		<div class="col-md-6">

			<!-- 조난 수동 등록 form -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<form role="form" action="/registReportRun" method="post"
							id="acdReportForm">
							<div class="form-group">
								<div>
									<label for="acd_code_id"> 사고 코드 </label>

									<!-- Button trigger modal -->
									<button type="button" class="btn btn-success"
										id="buttonConfirmAcdCode" style="margin-left: 100px;"
										data-toggle="modal" data-target="#exampleModal">사고 코드
										확인하기</button>

									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">사고 코드</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">

													<div class="container-fluid">
														<div class="row">
															<div class="col-md-12">

																<table class="table">
																	<tbody id="acdCodeTable">
																		<tr>
																			<th>사고 코드</th>
																			<td>사고 내용</td>
																		</tr>



																	</tbody>
																</table>
															</div>
														</div>
													</div>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">취소</button>
													<button type="button" class="btn btn-primary">적용하기</button>
												</div>
											</div>
										</div>
									</div>


								</div>
								<input type="text" class="form-control" id="acd_code_id"
									name="acd_code_id" />
							</div>

							<div class="form-group">
								<label for="acd_latitude"> 사고 위도 </label> <input type="text"
									class="form-control" id="acd_latitude" name="acd_latitude" />
							</div>

							<div class="form-group">
								<label for="acd_longitude"> 사고 경도 </label> <input type="text"
									class="form-control" id="acd_longitude" name="acd_longitude" />
							</div>

							<div class="form-group">
								<label for="acd_timestamp "> 사고 발생시간 </label> <input type="date"
									class="form-control " id="acd_day" name="acd_day" /> <input
									type="time" class="form-control " id="acd_hour" name="acd_hour" />
							</div>

							<div class="form-group">
								<label for="sh_id "> 선박번호 </label> <input type="text"
									class="form-control" id="sh_id" name="sh_id" />
							</div>

							<div class="form-group">
								<label for="acd_take "> 진행상태 </label> <input type="text"
									class="form-control" id="acd_take" name="acd_take" />
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- 조난 수동 등록 form ends -->

		</div>

		<!-- 상세내역 테이블 끝 -->
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="d-flex justify-content-end">
				<button type="button" class="btn btn-primary" id="buttonAcdRegister">등록하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 조난 내역 등록 ends -->

<%@ include file="../include/footer.jsp"%>