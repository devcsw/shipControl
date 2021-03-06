<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f71a92fecd7b42434cde225a0893ff1"></script>

<script type="text/javascript">
	$(function name() {

		var inputArr = [];

		let acd_code_id = $("#acd_code_id");
		let acd_latitude = $("#acd_latitude");
		let acd_longitude = $("#acd_longitude");
		let acd_day = $("#acd_day");
		let acd_hour = $("#acd_hour");
		let sh_id = $("#sh_id");
		let acd_take = $("#acd_take");

		inputArr.push(acd_code_id);
		inputArr.push(acd_latitude);
		inputArr.push(acd_longitude);
		inputArr.push(acd_day);
		inputArr.push(acd_hour);
		inputArr.push(sh_id);
		inputArr.push(acd_take);

		for (var v = 0; v < inputArr.length; v++) {
			inputArr[v].click(function name() {
				$(this).val("");
			})
		}

		$("#buttonAcdRegister").click(function name() {
			$("#acdReportForm").submit();
		});

		// 코드 확인 modal창 테이블 데이터 setting

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

		$("#modalConfirmShip").one('click', function name() {
			let url = "/getShipCodeAndName";

			$.get(url, function name(rData) {

				for (var v = 0; v < rData.length; v++) {
					let str = "";
					str += "<tr>";
					str += "<th>" + rData[v].sh_id + "</th>";
					str += "<td>" + rData[v].sh_name + "</td>";
					str += "</tr>";

					$("#shipCodeTable").append(str);
				}

			});

		});

		//사고 코드 modal 클릭 시 input value 설정

		$("#acdCodeTable").on('click', "tr", function name() {
			let acdCode = $(this).find("th").text();

			$("#acd_code_id").val(acdCode);
			$("#buttonDismissModal").trigger('click');

		});

		$("#shipCodeTable").on('click', "tr", function name() {
			let shipCode = $(this).find("th").text();

			$("#sh_id").val(shipCode);
			$("#buttonModalDismiss").trigger('click');

		})

		// 현재 시간으로 세팅하기 버튼

		$("#buttonSetTime").click(function name() {

			let date = new Date();
			let fullyear = date.getFullYear();
			let month = date.getMonth() + 1;
			let day = date.getDate();

			if (month < 10) {
				month = "0" + month;
			}
			
			if (day < 10) {
				day = "0" + day;
			}
			let dayFormat = fullyear + "-" + month + "-" + day;

			let time = date.getHours();
			let minutes = date.getMinutes();

			if (time < 10) {
				time = "0" + time;
			}

			if (minutes < 10) {
				minutes = "0" + minutes;
			}

			let seconds = date.getSeconds();

			if (seconds < 10) {
				seconds = "0" + seconds;
			}

			if (seconds == 0) {
				seconds = "00";
			}

			let timeFormat = time + ":" + minutes + ":" + seconds;

			$('#acd_day').val(dayFormat);
			$('#acd_hour').val(timeFormat);
		});

		$("#buttonValidateData").on('click', function name() {

			let validationResults = [];
			let acdCodeValidationResult = false;
			let shipIdValidationResult = false;

			let acdCodeUrl = "/getAcdCode";
			getData(acdCodeUrl).then(function name(receivedData) {
				acdCodeValidationResult = validateAcdIdForm(receivedData);
				console.log(acdCodeValidationResult);
				validationResults.push(acdCodeValidationResult);

			});

			let shipCodeUrl = "/getShipCodeAndName";
			getData(shipCodeUrl).then(function name(rData) {
				shipIdValidationResult = validateShipIdForm(rData);
				console.log(shipIdValidationResult);
				validationResults.push(shipIdValidationResult);
			});

			function validateTimeForm() {
				let result = false;

				let inputDayTime = $("#acd_day").val();
				let inputDayHour = $("#acd_hour").val();

				if (inputDayTime != "" && inputDayHour != "") {
					result = true;
					return result;
				}
				return result;
			}

			let TimeValidationResult = validateTimeForm();

			function validateLocationForm() {
				let result = false;

				let inputLatitude = $("#acd_latitude").val();
				let inputLongitude = $("#acd_longitude").val();

				if (inputLatitude != "" && inputLongitude != "") {
					result = true;
					return result;
				}
				return result;
			}

			let LocationValidationResult = validateLocationForm();
			validationResults.push(TimeValidationResult);
			validationResults.push(LocationValidationResult);

			setTimeout(function name() {
				console.log(validationResults);
				if (validationResults.includes(false)) {
					alert("양식을 다시 확인해주세요");
				} else {
					$("#buttonAcdRegister").attr('disabled', false);
				}

			}, 100);

		});

	});
</script>

<!-- 등록 페이지 title -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3>조난 등록 페이지 입니다</h3>
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
			let xLocation = ${shipStatusVo.sh_status_latitude};
			let yLocation = ${shipStatusVo.sh_status_longitude};

			var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(35.7522119867634,
						129.7760734657909), //지도의 중심좌표.
				level : 11
			//지도의 레벨(확대, 축소 정도)
			};

			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);

			console.log(xLocation);
			console.log(yLocation);

			let marker = new kakao.maps.Marker({
				map : map,
			});

			marker.setMap(map);
			marker.setPosition(new kakao.maps.LatLng(xLocation, yLocation));

			$(function name() {

				$("#acd_latitude").change(
						function name() {
							let changedXlocation = $("#acd_latitude").val();
							let changedYlocation = $("#acd_longitude").val();

							marker.setPosition(new kakao.maps.LatLng(
									changedXlocation, changedYlocation));
						});

				$("#acd_longitude").change(
						function name() {
							let changedXlocation = $("#acd_latitude").val();
							let changedYlocation = $("#acd_longitude").val();

							marker.setPosition(new kakao.maps.LatLng(
									changedXlocation, changedYlocation));

						});

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
													<button type="button" class="btn btn-primary"
														id="buttonDismissModal" data-dismiss="modal">확인</button>
												</div>
											</div>
										</div>
									</div>


								</div>
								<input type="text" class="form-control" id="acd_code_id"
									name="acd_code_id" required />
							</div>

							<div class="form-group">
								<label for="acd_latitude"> 사고 위도 </label> <input type="text"
									class="form-control" id="acd_latitude" name="acd_latitude"
									value="${shipStatusVo.sh_status_latitude }" required
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
							</div>

							<div class="form-group">
								<label for="acd_longitude"> 사고 경도 </label> <input type="text"
									class="form-control" id="acd_longitude" name="acd_longitude"
									value="${shipStatusVo.sh_status_longitude }" required
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
							</div>

							<div class="form-group">
								<label for="acd_timestamp "> 사고 발생시간 </label>
								<button type="button" class="btn btn-success" id="buttonSetTime">현재시간으로
									설정하기</button>
								<input type="date" class="form-control " id="acd_day"
									name="acd_day" required /> <input type="time"
									class="form-control " id="acd_hour" name="acd_hour" required step="1" />
							</div>

							<div class="form-group">
								<label for="sh_id "> 선박번호 </label>

								<!-- modal shop table -->
								<a id="modalConfirmShip" href="#modal-container-237494"
									role="button" class="btn btn-success" data-toggle="modal">선박
									확인하기</a>

								<div class="modal fade" id="modal-container-237494"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="myModalLabel">선박 정보</h5>
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body">

												<div class="container-fluid">
													<div class="row">
														<div class="col-md-12">

															<table class="table">
																<tbody id="shipCodeTable">
																	<tr>
																		<th>선박 코드</th>
																		<td>선박 이름</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary"
													data-dismiss="modal" id="buttonModalDismiss">확인</button>
											</div>
										</div>
									</div>

									<!-- modal ship table ends -->

								</div>
								<input type="text" class="form-control" id="sh_id" name="sh_id"
									value="${shipStatusVo.sh_id }" required />
							</div>

							<div class="form-group">
								<label for="acd_take "> 진행상태 </label> <input type="text"
									class="form-control" id="acd_take" name="acd_take" required />
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
				<button type="button" class="btn btn-success"
					id="buttonValidateData">입력확인</button>
				<button type="button" class="btn btn-primary" id="buttonAcdRegister"
					disabled="disabled">등록하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 조난 내역 등록 ends -->

<%@ include file="../include/footer.jsp"%>