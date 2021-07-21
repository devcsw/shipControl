<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
	$(document).ready(
			function name() {
				$(".modalAcdTake").on(
						"click",
						function name(e) {
							let acd = $(this).parent().parent().find(
									"td:first-child").text();
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
									str += "<td>" + rData[v].acd_hnd_id
											+ "</th>";
									str += "<td>" + rData[v].acd_hnd_content
											+ "</td>";

									let date = new Date(rData[v].acd_hnd_date);
									let formattedDate = date.getFullYear()
											+ "-" + (date.getMonth() + 1) + "-"
											+ date.getDate();
									let formattedTime = date.getHours() + ":"
											+ date.getMinutes() + ":"
											+ date.getSeconds();

									str += "<td>" + formattedDate + " "
											+ formattedTime + "</td>";
									str += "<td>" + rData[v].acd_hnd_take
											+ "</td>";
									str += "</tr>";
									$("#tableAcdHnd").append(str);
								}
							});
						});

				$(".modalShipInfo").on(
						'click',
						function name() {
							let sh_id = $(this).text();
							console.log(sh_id);

							let url = "/getShipInfo";
							let sendData = {
								"sh_id" : sh_id
							};

							$.get(url, sendData, function name(rData) {
								console.log(rData);
								let shipTable = $("#tableShipInfo");
								$("#tableShipInfo").empty();

								let base = "<tr>";
								base += "<th>선박번호</th>";
								base += "<td>" + rData.sh_id + "</td>";
								base += "</tr>";
								base += "<th>선박이름</th>";
								base += "<td>" + rData.sh_name + "</td>";
								base += "</tr>";
								base += "<th>선박보드</th>";
								base += "<td>" + rData.sh_board_code + "</td>";
								base += "</tr>";
								base += "<th>선주</th>";
								base += "<td>" + rData.sh_owner + "</td>";
								base += "</tr>";
								base += "<th>선주전화번호</th>";
								base += "<td>" + rData.sh_owner_tel + "</td>";
								base += "</tr>";
								base += "<th>선장</th>";
								base += "<td>" + rData.sh_cap_name + "</td>";
								base += "</tr>";
								base += "<th>선장전화번호</th>";
								base += "<td>" + rData.sh_cap_tel + "</td>";
								base += "</tr>";
								base += "<th>선박유형</th>";
								base += "<td>" + rData.sh_type + "</td>";
								base += "</tr>";
								base += "<th>MMSI</th>";
								base += "<td>" + rData.sh_mmsi + "</td>";
								base += "</tr>";
								base += "<th>CALL_SIGN</th>";
								base += "<td>" + rData.sh_call_sign + "</td>";
								base += "</tr>";
								base += "<th>등록일자</th>";

								let date = new Date(rData.sh_date);
								let formattedDate = date.getFullYear() + "-"
										+ (date.getMonth() + 1) + "-"
										+ date.getDate();
								let formattedTime = date.getHours() + ":"
										+ date.getMinutes() + ":"
										+ date.getSeconds();

								base += "<td>" + formattedDate + " "
										+ formattedTime + "</td>";
								base += "</tr>";

								$("#tableShipInfo").append(base);

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
					<div>
						<c:if test="${map != null}">${map.searchType} ${map.searchWord }번의 검색 결과입니다</c:if>
						<c:if test="${map == null }">전체 사고내역 조회 결과입니다</c:if>
					</div>
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
							<td><a
								href="/reportContent?acd_id=${list.acd_id }&acd_hnd_page=1">${list.acd_id }</a></td>
							<td>${list.acd_code_id }</td>
							<td>(${list.acd_latitude } , ${list.acd_longitude })</td>
							<td>${list.acd_date }</td>
							<td><a id="modalShipInfo" href="#modal-container-124126"
								role="button" class="btn btn-success modalShipInfo"
								data-toggle="modal">${list.sh_id }</a></td>
							<td><a id="modalAcdTake" href="#modal-container-120818"
								role="button" class="btn btn-success modalAcdTake"
								data-toggle="modal">${list.acd_take }</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 선박 정보 모달 -->
			<div class="modal fade" id="modal-container-124126" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="shipModalLabel">선박 정보</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">

							<table class="table" id="tableShipInfo">


							</table>

						</div>
						<div class="modal-footer">


							<button type="button" class="btn btn-primary"
								data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 선박 정보 모달 끝 -->


			<!-- 진행상태 모달 -->

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

			<!-- 진행상태 모달 끝 -->


			<!-- 테이블 끝 -->
			<a type="button" class="btn btn-primary justify-content-end"
				href="/manuallyRegistReport">등록하기</a>
			<!-- pagination -->
			<nav>
				<ul class="pagination justify-content-center">



					<c:if test="${dto.startPage != 1 }">
						<li class="page-item"><a class="page-link"
							href="/reportPage?currentPage=${dto.startPage - 10 }">이전</a></li>
					</c:if>

					<c:forEach begin="${dto.startPage}" end="${dto.endPage}" var="v">
						<li
							class="page-item <c:if test="${v == dto.currentPage}">active</c:if> "><a
							class="page-link" href="/reportPage?currentPage=${v}">${v}</a></li>
					</c:forEach>

					<c:if test="${dto.startPage/10 != dto.wholePage/10 }">
						<li class="page-item"><a class="page-link"
							href="/reportPage?currentPage=${dto.startPage + 10 }">이후</a></li>
					</c:if>
				</ul>
			</nav>
			<!-- pagination 끝 -->
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>