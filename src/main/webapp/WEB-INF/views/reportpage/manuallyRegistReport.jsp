<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
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
		<div class="col-md-6">지도데이터 DIV</div>
		<!-- 지도데이터 div 끝 -->

		<!-- 상세내역 테이블 -->
		<div class="col-md-6">

			<!-- 조난 수동 등록 form -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<form role="form">
							<div class="form-group">
								<label for="acd_code_id"> 사고 코드 </label> <input type="text"
									class="form-control" id="acd_code_id" name="acd_code_id" />
							</div>

							<div class="form-group">
								<label for="acd_location"> 사고 위치 </label> <input type="text"
									class="form-control" id="acd_location" name="acd_location" />
							</div>

							<div class="form-group">
								<label for="acd_date "> 사고 발생시간 </label> <input type="text"
									class="form-control " id="acd_date" name="acd_date" />
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
				<button type="button" class="btn btn-primary">등록하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 조난 내역 등록 ends -->

<%@ include file="../include/footer.jsp"%>