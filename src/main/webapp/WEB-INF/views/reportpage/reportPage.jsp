<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
	$(document).ready(function name() {
		$(".modalAcdTake").on("click", function name(e) {
			let acd = $(this).parent().parent().find("td:first-child").text();
			// console.log(acd); //확인완료

			let url = "/getAcdHnd";
			let sendData = {
				"acd_id" : acd
			};

			$.get(url, sendData, function name(rData) {
				console.log(rData);
				$("#tableAcdHnd").empty();

				let base = "<tr>";
				base += "<th>#</th>";
				base += "<th>처리내용</th>";
				base += "<th>처리시간</th>";
				base += "<th>처리상태</th>";
				base += "</tr>";

				$("#tableAcdHnd").append(base);

				for (var v = 0; v < rData.length; v++) {
					let str = "";
					str += "<tr>";
					str += "<td>" + rData[v].acd_hnd_id + "</th>";
					str += "<td>" + rData[v].acd_hnd_content + "</td>";
					str += "<td>" + rData[v].acd_hnd_date + "</td>";
					str += "<td>" + rData[v].acd_hnd_take + "</td>";
					str += "</tr>";
					$("#tableAcdHnd").append(str);
				}
			});
		});

		$(".dropdown-item").click(function name() {
			let thistext = $(this).text();
			$("#dropdownMenuButton").text(thistext);
		});

		$("#searchInput").on("submit", function name(e) {
			let searchType = $("#dropdownMenuButton").text();
			$("#searchType").val(searchType);
		});

	})
</script>

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
					<form class="form-inline" id="searchInput"
						action="/getAcdListBySerachType" method="get">
						<input type="hidden" id="searchType" name="searchType" /> <input
							class="form-control mr-sm-2" type="text" id="searchWord"
							name="searchWord" />
						<button class="btn btn-primary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown">사고 번호</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#" id="dropDownAcdId">사고 번호</a> <a
								class="dropdown-item" href="#" id="dropDownAcdCode">사고 코드</a>
						</div>
						<button style="margin-left: 10px" id="buttonSearch"
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
					<c:forEach items="${list}" var="list">
						<tr>
							<td><a href="/reportContent?acd_id=${list.acd_id }">${list.acd_id }</a></td>
							<td>${list.acd_code_id }</td>
							<td>(${list.acd_latitude } , ${list.acd_longitude })</td>
							<td>${list.acd_date }</td>
							<td>${list.sh_id }</td>
							<td><a id="modalAcdTake" href="#modal-container-120818"
								role="button" class="btn btn-success modalAcdTake"
								data-toggle="modal">${list.acd_take }</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="modal fade" id="modal-container-120818" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">진행상태</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table" id="tableAcdHnd">


							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">돌아가기</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 테이블 끝 -->
			<a type="button" class="btn btn-primary justify-content-end"
				href="/manuallyRegistReport">등록하기</a>
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