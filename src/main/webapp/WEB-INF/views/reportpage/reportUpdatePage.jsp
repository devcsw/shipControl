<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f71a92fecd7b42434cde225a0893ff1"></script>
<script type="text/javascript">
	$(function name() {
		$("#modal-250066").hide();
		$("#buttonConfirmFormData").hide();
		$("#buttonSubmitForm").hide();
		
		
		$("#buttonStartUpdate").click(function name() {
			$('input').removeAttr('readonly');
			let acdId = $('#formReport > .form-group > input').first();
			acdId.attr('readonly', true);
			
			$("#modal-250066").show();
			$("#buttonConfirmFormData").show();
		});

		let acdDate = "${acdVo.acd_date}";

		let date = acdDate.substring(0, 10);
		let hour = acdDate.substring(11);

		$("#acd_day").val(date);
		$("#acd_hour").val(hour)
		
		
		$("#buttonConfirmFormData").on('click', function name() {
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
				
				if (inputLatitude != "" && inputLongitude!= "") {
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
					alert("????????? ?????? ??????????????????");
				} else {
					$("#buttonSubmitForm").show();
					alert('?????? ?????? ????????? ???????????????');
					$('input').attr('readonly', true);
				}
				
			}, 100);
		});

	});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>???????????? ${acdVo.acd_id} ??? ???????????? ?????? ????????? ?????????</h2>
				<p>?????? ?????? ?????? ??? ????????? ????????? ?????? ????????? ????????? ??? ????????????</p>
			</div>
		</div>
	</div>

</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<!-- ??????????????? div -->
			<div class="row">
				<div class="d-flex justify-content-center">
					<div id="map" style="width: 500px; height: 500px;"></div>
				</div>
			</div>

			<script>
				var container = document.getElementById('map'); //????????? ?????? ????????? DOM ????????????
				var options = { //????????? ????????? ??? ????????? ?????? ??????
					center : new kakao.maps.LatLng(35.44294727060267,
							129.36937385789298), //????????? ????????????.
					level : 11
				//????????? ??????(??????, ?????? ??????)
				};

				var map = new kakao.maps.Map(container, options); //?????? ?????? ??? ?????? ??????

				map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);
				
				let xLocation = 35.44294727060267;
				let yLocation = 129.36937385789298;

				$(function name() {

					xLocation = $("#acd_latitude").val();
					yLocation = $("#acd_longitude").val();

					let marker = new kakao.maps.Marker({
						position : map.getCenter()
					});

					marker.setMap(map);

					marker.setPosition(new kakao.maps.LatLng(xLocation,
							yLocation));
					
					$("#acd_latitude").change(function name() {
						let changedXlocation = $("#acd_latitude").val();
						let changedYlocation = $("#acd_longitude").val();
						
						marker.setPosition(new kakao.maps.LatLng(changedXlocation,
								changedYlocation));
					});

					$("#acd_longitude").change(function name() {
						let changedXlocation = $("#acd_latitude").val();
						let changedYlocation = $("#acd_longitude").val();
						
						marker.setPosition(new kakao.maps.LatLng(changedXlocation,
								changedYlocation));

					});
					

					kakao.maps.event.addListener(marker, 'click', function() {

					});

				});
			</script>
			<!-- ??????????????? div ??? -->
		</div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12">

					<form role="form" action="/updateReportRun" method="post"
						id="formReport" onsubmit="return false">
						<div class="form-group">
							<label for="acd_id"> ???????????? </label> <input type="text"
								class="form-control" id="acd_id" name="acd_id"
								value="${acdVo.acd_id }" readonly="readonly" />
						</div>

						<div class="form-group">
							<label for="acd_code_id"> ???????????? </label> <input type="text"
								class="form-control" id="acd_code_id" name="acd_code_id"
								value="${acdVo.acd_code_id }" readonly="readonly" />
						</div>

						<div class="form-group">
							<label for="acd_latitude"> ???????????? </label> <input type="text"
								class="form-control" id="acd_latitude" name="acd_latitude"
								value="${acdVo.acd_latitude }" readonly="readonly" />
						</div>

						<div class="form-group">
							<label for="acd_longitude"> ???????????? </label> <input type="text"
								class="form-control" id="acd_longitude" name="acd_longitude"
								value="${acdVo.acd_longitude }" readonly="readonly" />
						</div>

						<div class="form-group">
							<label for="acd_timestamp "> ?????? ???????????? </label> <input type="date"
								class="form-control " id="acd_day" name="acd_day" required
								readonly="readonly" /> <input type="time" class="form-control "
								id="acd_hour" name="acd_hour" required readonly="readonly" step="1" />
						</div>

						<div class="form-group">
							<label for="sh_id"> ???????????? </label> <input type="text"
								class="form-control" id="sh_id" name="sh_id"
								value="${acdVo.sh_id }" readonly="readonly" />
						</div>
						<button type="button" class="btn btn-warning"
							id="buttonStartUpdate">????????????</button>

						<a id="modal-250066" href="#modal-container-250066" role="button"
							class="btn btn-danger" data-toggle="modal" >?????? ??????</a>

						<div class="modal fade" id="modal-container-250066" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="myModalLabel">?????? ??????</h5>
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">??</span>
										</button>
									</div>
									<div class="modal-body">
										?????? ????????????????????????? <br> ????????? ???????????? ????????? ??? ????????????
									</div>
									<div class="modal-footer">

										<a type="button" class="btn btn-danger"
											href="/deleteReport?acd_id=${acdVo.acd_id}">????????????</a>
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">??????</button>
									</div>
								</div>

							</div>

						</div>
						<button type="button" class="btn btn-success" id="buttonConfirmFormData">????????????</button>
						<button type="submit" class="btn btn-success" id="buttonSubmitForm">????????????</button>
						<a class="btn btn-primary"
							href="reportContent?acd_id=${acdVo.acd_id }&acd_hnd_page=1">??????</a>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>






<%@ include file="../include/footer.jsp"%>