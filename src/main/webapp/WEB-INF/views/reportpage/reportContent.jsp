<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 상새내역 title -->
<div class="container-fluid">


	<div class="row">
		<div class="col-md-12">
			<h3>조난 상세내역 페이지</h3>
			<dl>
				<dt>사고번호 ? 번 상세내역입니다</dt>
			</dl>
		</div>
	</div>
</div>
<!-- 상새내역 title 끝 -->
<div class="container-fluid">
	<div class="row">

		<!-- 지도데이터 div -->
		<div class="col-md-6">지도데이터 DIV</div>
		<!-- 지도데이터 div 끝 -->

		<!-- 상세내역 테이블 -->
		<div class="col-md-6">
			<table class="table">

				<tbody>
					<tr>
						<th>사고번호</th>
						<td>1</td>
					</tr>
					<tr>
						<th>사고 코드</th>
						<td>1202</td>
					</tr>
					<tr>
						<th>사고위치</th>
						<td>위도, 경도</td>
					</tr>
					<tr>
						<th>사고발생시간</th>
						<td>21.07.12 12:47</td>
					</tr>
					<tr>
						<th>선박번호</th>
						<td>157342</td>
					</tr>
					<tr>
						<th>진행상태</th>
						<td>신고접수</td>
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
						<th>Product</th>
						<th>Payment Taken</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Default</td>
					</tr>
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

							<form role="form">
								<div class="form-group">
									<label for="ACD_HND_ID"> ACD_HND_ID </label> <input type="text"
										class="form-control" id="ACD_HND_ID" name="ACD_HND_ID" />
								</div>
								<div class="form-group">
									<label for="ACD_HND_CONTENT"> ACD_HND_CONTENT </label> <input
										type="text" class="form-control" id="ACD_HND_CONTENT"
										name="ACD_HND_CONTENT" />
								</div>
								<div class="form-group">
									<label for="ACD_HND_TAKE"> ACD_HND_TAKE </label> <input
										type="text" class="form-control" id="ACD_HND_TAKE"
										name="ACD_HND_TAKE" />
								</div>
							</form>

						</div>
						<div class="modal-footer">

							<button type="button" class="btn btn-primary">처리내역 등록하기</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
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