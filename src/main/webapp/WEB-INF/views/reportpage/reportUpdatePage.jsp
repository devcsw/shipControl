<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f71a92fecd7b42434cde225a0893ff1"></script>
<script type="text/javascript">
	$(function name() {
		$("#buttonStartUpdate").click(function name() {
			$('input').removeAttr('readonly');
			let acdId = $('#formReport > .form-group > input').first();
			acdId.attr('readonly', true);

		});

		let acdDate = "${acdVo.acd_date}";

		let date = acdDate.substring(0, 10);
		let hour = acdDate.substring(11);

		$("#acd_day").val(date);
		$("#acd_hour").val(hour)

	});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>사고번호 ${acdVo.acd_id} 번 조난내역 수정 페이지 입니다</h2>
				<p>최초 사고 발생 시 작성한 사고의 상세 내역을 수정할 수 있습니다</p>
			</div>
		</div>
	</div>

</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<!-- 지도데이터 div -->
			<div class="row">
				<div class="d-flex justify-content-center">
					<div id="map" style="width: 500px; height: 500px;"></div>
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
			<!-- 지도데이터 div 끝 -->
		</div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12">

					<form role="form" action="/updateReportRun" method="post"
						id="formReport">
						<div class="form-group">
							<label for="acd_id"> 사고번호 </label> <input type="text"
								class="form-control" id="acd_id" name="acd_id"
								value="${acdVo.acd_id }" readonly="readonly" />
						</div>

						<div class="form-group">
							<label for="acd_code_id"> 사고코드 </label> <input type="text"
								class="form-control" id="acd_code_id" name="acd_code_id"
								value="${acdVo.acd_code_id }" readonly="readonly" />
						</div>

						<div class="form-group">
							<label for="acd_latitude"> 사고위도 </label> <input type="text"
								class="form-control" id="acd_latitude" name="acd_latitude"
								value="${acdVo.acd_latitude }" readonly="readonly" />
						</div>

						<div class="form-group">
							<label for="acd_longitude"> 사고경도 </label> <input type="text"
								class="form-control" id="acd_longitude" name="acd_longitude"
								value="${acdVo.acd_longitude }" readonly="readonly" />
						</div>

						<div class="form-group">
							<label for="acd_timestamp "> 사고 발생시간 </label> <input type="date"
								class="form-control " id="acd_day" name="acd_day" required
								readonly="readonly" /> <input type="time" class="form-control "
								id="acd_hour" name="acd_hour" required readonly="readonly" step="1" />
						</div>

						<div class="form-group">
							<label for="sh_id"> 선박번호 </label> <input type="text"
								class="form-control" id="sh_id" name="sh_id"
								value="${acdVo.sh_id }" readonly="readonly" />
						</div>
						<button type="button" class="btn btn-warning"
							id="buttonStartUpdate">수정시작</button>

						<a id="modal-250066" href="#modal-container-250066" role="button"
							class="btn btn-danger" data-toggle="modal">사고 삭제</a>

						<div class="modal fade" id="modal-container-250066" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="myModalLabel">사고 삭제</h5>
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<div class="modal-body">
										정말 삭제하시겠습니까? <br> 삭제한 데이터는 복구할 수 없습니다
									</div>
									<div class="modal-footer">

										<a type="button" class="btn btn-danger"
											href="/deleteReport?acd_id=${acdVo.acd_id}">삭제하기</a>
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">취소</button>
									</div>
								</div>

							</div>

						</div>

						<button type="submit" class="btn btn-success">수정완료</button>
						<a class="btn btn-primary"
							href="reportContent?acd_id=${acdVo.acd_id }&acd_hnd_page=1">취소</a>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>






<%@ include file="../include/footer.jsp"%>