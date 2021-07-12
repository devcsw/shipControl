<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!-- 페이지 설명 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3>조난내역 조회 페이지입니다</h3>
			<dl>
				<dt>조난 내역 조회 기능</dt>
				<dd>사고번호 및 사고 코드로 조난 내역을 조회 가능합니다</dd>
				<dt>조난 내역 등록 기능</dt>
				<dd>조난 신고가 자동으로 들어오지 않았을 때 조난 내역을 수동으로 등록 가능합니다</dd>
				<dt>처리내역 등록 기능</dt>
				<dd>조난 상세내역 페이지에서 처리내역을 등록 가능합니다</dd>
				<dt>처리내역 수정 삭제기능</dt>
				<dd>처리내역을 수정 및 삭제 가능합니다</dd>
			</dl>
		</div>
	</div>
</div>
<!-- 페이지 설명 끝 -->

<div class="container-fluid">
	<div class="row">
		<!-- 검색바 -->
		<div class="col-md-12">
			<div class="dropdown"></div>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<form class="form-inline">
						<input class="form-control mr-sm-2" type="text" />
						<button class="btn btn-primary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown">사고 번호</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#">사고 번호</a> <a
								class="dropdown-item" href="#">사고 코드</a>
						</div>
						<button style="margin-left: 10px"
							class="btn btn-primary my-2 my-sm-0" type="submit">검색하기</button>
					</form>
				</div>

				<!-- 검색바 끝 -->
			</nav>

			<!-- 테이블 -->
			<table class="table">
				<thead>
					<tr>
						<th>사고 번호</th>
						<th>사고 코드</th>
						<th>사고 위치</th>
						<th>사고 발생시간</th>
						<th>선박 번호</th>
						<th>진행상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>1202</td>
						<td>위도,경도</td>
						<td>2021.07.09 12:46</td>
						<td>106547</td>
						<td>신고 접수</td>
					</tr>
				</tbody>
			</table>

			<!-- 테이블 끝 -->

			<button type="button" class="btn btn-primary justify-content-end">등록하기</button>

			<!-- pagination -->
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">이전</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">이후</a></li>
				</ul>
			</nav>

			<!-- pagination 끝 -->
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>