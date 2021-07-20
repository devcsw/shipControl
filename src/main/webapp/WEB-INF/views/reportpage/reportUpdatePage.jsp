<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f71a92fecd7b42434cde225a0893ff1"></script>

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
					level : 7
				//지도의 레벨(확대, 축소 정도)
				};

				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

				let xLocation = 35.44294727060267;
				let yLocation = 129.36937385789298;

				$(function name() {

					xLocation = $("#acd_latitude").val();
					yLocation = $("#acd_longitude").val();

					let marker = new kakao.maps.Marker({
						// 지도 중심좌표에 마커를 생성합니다 
						position : map.getCenter()
					});

					marker.setMap(map);

					marker.setPosition(new kakao.maps.LatLng(xLocation,
							yLocation));

					kakao.maps.event.addListener(marker, 'click', function() {

					});

				});
			</script>
			<!-- 지도데이터 div 끝 -->
		</div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12">
					<form role="form" action="/updateReportRun" method="post">
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
							<label for="acd_date"> 사고발생시간 </label> <input type="text"
								class="form-control" id="acd_date" name="acd_date"
								value="${acdVo.acd_date }" readonly="readonly" />
						</div>

						<div class="form-group">
							<label for="sh_id"> 선박번호 </label> <input type="text"
								class="form-control" id="sh_id" name="sh_id"
								value="${acdVo.sh_id }" readonly="readonly" />
						</div>
						<button type="button" class="btn btn-warning">수정시작</button>
						<a class="btn btn-danger">사고삭제</a>
						<button type="submit" class="btn btn-success">수정완료</button>
						<a class="btn btn-primary" href="/reportPage">목록으로</a>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>






<%@ include file="../include/footer.jsp"%>