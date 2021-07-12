<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./include/header.jsp"%>

<div class="container-fluid">

	<br>
	<!-- 검색버튼 -->
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-1"></div>
		<div class="col-md-3">
			<form class="d-flex">
				<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
				href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">선박명</a> 
						<a class="dropdown-item" href="#">긴급여부</a> 
						<a class="dropdown-item" href="#">센서코드</a>
					</div>
				<input class="form-control me-sm-2" type="text" placeholder="Search">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</div>
	<br>
	<!-- //검색버튼 -->
	<!--  테이블 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>선박명</th>
						<th>센서코드</th>
						<th>센서1</th>
						<th>센서2</th>
						<th>센서3</th>
						<th>센서4</th>
						<th>센서5</th>
						<th>보고일시</th>
						<th>긴급여부</th>
						<th><a>상세보기</a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
					</tr>
					<tr>
						<td>2</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
						<td>Default</td>
					</tr>

				</tbody>
			</table>
			<!-- //테이블  -->
			<!-- 등록수정버튼 -->
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2">

					<div class="btn-group" role="group" aria-label="Basic example">
						<button type="button" class="btn btn-primary">등록</button>
						<button type="button" class="btn btn-secondary">수정</button>
					</div>
				</div>
			</div>
			<!--//등록수정버튼 -->
			<!-- 페이징  -->
			<div class="row">
				<div class="col-md-2">
					<div>
						<ul class="pagination pagination-sm">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
			</div>
			<!-- //페이징  -->
		</div>

	</div>
</div>




<%@ include file="./include/footer.jsp"%>