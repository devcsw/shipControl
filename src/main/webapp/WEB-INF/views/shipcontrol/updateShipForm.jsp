<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선박수정</title>
</head>
<body>
	<!--sh_id,sh_name,sh_board_code,sh_owner,sh_owner_tel,sh_cap_name,sh_cap_tel,sh_type,sh_mmsi,sh_call_sign,sh_date -->
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/shipcontrol/updateShipRun" method="post">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="sh_id"> 선박번호 </label> <input type="text"
								class="form-control" id="sh_id" name="sh_id" value="${ShipVo.sh_id}" readonly/>
						</div>
						<div class="form-group">
							<label for="sh_board_code"> 센서코드 </label> <input type="text"
								class="form-control" id="sh_board_code" name="sh_board_code" value="${ShipVo.sh_board_code}" />
						</div>
						<div class="form-group">
							<label for="sh_owner"> 선주 </label> <input type="text"
								class="form-control" id="sh_owner" name="sh_owner" value="${ShipVo.sh_owner}" />
						</div>
						
						<div class="form-group">
							<label for="sh_cap_name"> 선장이름 </label> <input type="text"
								class="form-control" id="sh_cap_name" name="sh_cap_name" value="${ShipVo.sh_cap_name}"/>
						</div>
						<div class="form-group">
							<label for="sh_call_sign"> 호출부호 </label> <input type="text"
								class="form-control" id="sh_call_sign" name="sh_call_sign" value="${ShipVo.sh_call_sign}" />
						</div>
						<div class="checkbox">
	
							<label> 
							<input type="checkbox"  id="fire" name="fire" value="1"  
								<c:if test="${not empty SensorDto.fire}">
									checked
								</c:if>
							/>화재센서
							</label>
						</div>
						<div class="checkbox">
		
							<label> 
							<input type="checkbox" id="smoke" name="smoke" value="3"
								<c:if test="${not empty SensorDto.smoke}">
									checked
								</c:if>
							/> 연기센서
							</label>
						</div>
						<div class="checkbox">
		
							<label> 
							<input type="checkbox" id="windDirection" name="windDirection" value="5"
								<c:if test="${not empty SensorDto.windDirection}">
									checked
								</c:if> 
							/> 풍향센서
							</label>
						</div>
						
						<br>
						<br>
						<div>
							<button type="submit" class="btn btn-primary">수정</button>
							<a type="button" class="btn btn-danger" href="/shipcontrol/deleteShipRun?sh_id=${sh_id}">삭제</a>
						</div>
					</div>
	<!--sh_id,sh_name,sh_board_code,sh_owner,sh_owner_tel,sh_cap_name
	,sh_cap_tel,sh_type,sh_mmsi,sh_call_sign,sh_date -->
					<div class="col-md-6">
						<div class="form-group">
							<label for="sh_name"> 선박이름 </label> <input type="text"
								class="form-control" id="sh_name" name="sh_name" value="${ShipVo.sh_name}"/>
						</div>
						<div class="form-group">
							<label for="sh_mmsi"> mmsi </label> <input type="text"
								class="form-control" id="sh_mmsi" name="sh_mmsi" value="${ShipVo.sh_mmsi}"/>
						</div>
						<div class="form-group">
							<label for="sh_owner_tel"> 선주번호 </label> <input type="text"
								class="form-control" id="sh_owner_tel" name="sh_owner_tel" value="${ShipVo.sh_owner_tel}" />
						</div>
						
						<div class="form-group">
							<label for="sh_cap_tel"> 선장번호 </label> <input type="text"
								class="form-control" id="sh_cap_tel" name="sh_cap_tel" value="${ShipVo.sh_cap_tel}"/>
						</div>
						<div class="form-group">
							<label for="sh_type"> 선박타입 </label> <input type="text"
								class="form-control" id="sh_type" name="sh_type" value="${ShipVo.sh_type}"/>
						</div>
						<div class="checkbox">
		
							<label> 
							<input type="checkbox"  id="temperature" name="temperature" value="2"
								<c:if test="${not empty SensorDto.temperature}">
									checked
								</c:if>
							/>온도센서
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" id="windSpeed" name="windSpeed" value="4"
								<c:if test="${not empty SensorDto.windSpeed}">
									checked
								</c:if>
							/> 풍속센서
							</label>
						</div>
						<div class="checkbox">
	
							<label> <input type="checkbox" id="gyroscope" name="gyroscope" value="6" 
								<c:if test="${not empty SensorDto.gyroscope}">
									checked
								</c:if>
							/> 기울기센서
							</label>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

<%@ include file="../include/footer.jsp"%>