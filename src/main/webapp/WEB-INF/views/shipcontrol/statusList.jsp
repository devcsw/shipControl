<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<style>
p {
	font-size: 10px;
	margin-bottom:5px;
}
</style>


<div class="container-fluid">
	
	<br>
	<!-- 등록수정버튼 -->
	<div class="row">
		<div class="col-md-9">
		
			<div class="card text-white bg-primary mb-3" style="max-width: 15rem; ">
			  <div class="card-header">${ShipVo.sh_name}</div>
			  <div class="card-body">
			    <h6 class="card-title"  style="font-size: 15px;">${ShipVo.sh_owner}</h6>
			    <p class="card-text" >센서코드 : ${ShipVo.sh_board_code}  </p>
			    <p class="card-text" >선장명 : ${ShipVo.sh_cap_name} </p>
			    <p class="card-text" >선장번호 : ${ShipVo.sh_cap_tel} </p>
			    <p class="card-text" >선주번호 : ${ShipVo.sh_owner_tel} </p>
			  </div>
			</div>
		</div>
		<div class="col-md-3">
			<form class="d-flex">
				
				<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
				href="#" role="button" aria-haspopup="true" aria-expanded="false" id="dropdown" >
					<span id="spanSearchType">검색조건
						<c:choose>
							<c:when test="${searchType == 'id'}">선박번호</c:when>
							<c:when test="${searchType == 'name'}">선박명</c:when>
							<c:when test="${searchType == 'code'}">센서코드</c:when>
						</c:choose>
					</span>
				
				</a>
				
					<div class="dropdown-menu">
						<a class="dropdown-item searchType" href="id" >선박번호</a> 
						<a class="dropdown-item searchType" href="name">선박명</a> 
						<a class="dropdown-item searchType" href="code">센서코드</a>
					</div>
				<input class="form-control me-sm-2" type="text" placeholder="Search" id="txtSearch" value="${keyword}">
				<button class="btn btn-secondary my-2 my-sm-0" type="button" id="btnSearch">Search</button>
			</form>
		</div>
	</div>
	<br>
	<!--//등록수정버튼 -->
	<!--  테이블 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table" id="tb" >
				<thead>
					<tr>
						<th>보고일시</th>
						<th>위도</th>
						<th>경도</th>
						<th>화재</th>
						<th>온도</th>
						<th>연기</th>
						<th>풍속</th>
						<th>풍향</th>
						<th>기울기</th>
					</tr>
				</thead>
				
				<tbody id="tbody">
					<c:forEach var="list" items="${list}">
						<tr >
	    					<td>${list.sh_status_date }</td>
	    					<td>${list.sh_status_latitude }</td>
	    					<td>${list.sh_status_longitude }</td>
	    					<td>
		    					<c:if test="${not empty list.fire }">
	    							<c:out value="${list.fire}" />
								</c:if>
							</td>
	    					<td>
		    					<c:if test="${not empty list.temperature }">
	    							<c:out value="${list.temperature }" />
								</c:if>
							</td>
	    					<td>
	    						<c:if test="${not empty list.smoke }">
	    							<c:out value="${list.smoke}" />
								</c:if>
	    					</td>
	    					<td>
	    						<c:if test="${not empty list.windspeed }">
	    							<c:out value="${list.windspeed}" />
								</c:if>
	    					</td>
	    					<td>
	    						<c:if test="${not empty list.winddirection }">
	    							<c:out value="${list.winddirection}" />
								</c:if>
	    					</td>
	    					<td>
	    						<c:if test="${not empty list.gyroscope }">
	    							<c:out value="${list.gyroscope}" />
								</c:if>
	    					</td>
	    					
	   					</tr>
					</c:forEach>
				</tbody>
				
			</table>
			<!-- //테이블  -->

		</div>
	</div>
</div>



<%@ include file="../include/footer.jsp"%>