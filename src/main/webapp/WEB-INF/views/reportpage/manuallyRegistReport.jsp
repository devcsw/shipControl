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
				level : 7, //지도의 레벨(확대, 축소 정도)
			};

			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

			let marker = new kakao.maps.Marker({
				// 지도 중심좌표에 마커를 생성합니다 
				position : map.getCenter()
			});

			// 지도에 마커를 표시합니다
			marker.setMap(map);
			
			let xLocation = 35.44294727060267;
			let yLocation = 129.36937385789298;
			
			$(function name() {
				$("#acd_latitude").change(function name() {
					xLocation = $(this).val();
					marker.setPosition(new kakao.maps.LatLng(xLocation, yLocation));
				});
				
				$("#acd_longitude").change(function name() {
					yLocation = $(this).val();
					marker.setPosition(new kakao.maps.LatLng(xLocation, yLocation));
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
						<form role="form" action="/registReportRun" method="post" id="acdReportForm">
							<div class="form-group">
								<label for="acd_code_id"> 사고 코드 </label> <input type="text"
									class="form-control" id="acd_code_id" name="acd_code_id" />
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
								<label for="acd_timestamp "> 사고 발생시간 </label>
								<input type="date"
									class="form-control " id="acd_day" name="acd_day" /> 
								<input type="time"
									class="form-control " id="acd_hour" name="acd_hour" />
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