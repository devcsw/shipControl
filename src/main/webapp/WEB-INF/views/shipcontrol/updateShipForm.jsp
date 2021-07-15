<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--sh_id,sh_name,sh_board_code,sh_owner,sh_owner_tel,sh_cap_name,sh_cap_tel,sh_type,sh_mmsi,sh_call_sign,sh_date -->
	<div class="row">
		<div class="col-md-12">
			<form role="form">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="sh_id"> 선박번호 </label> <input type="text"
								class="form-control" id="sh_id" />
						</div>
						<div class="form-group">
							<label for="sh_board_code"> 센서코드 </label> <input type="text"
								class="form-control" id="sh_board_code" />
						</div>
						<div class="form-group">
							<label for="sh_id"> 선박번호 </label> <input type="text"
								class="form-control" id="sh_id" />
						</div>
						<div class="form-group">
							<label for="sh_board_code"> 센서코드 </label> <input type="text"
								class="form-control" id="sh_board_code" />
						</div>
						<div class="form-group">
							<label for="sh_board_code"> 센서코드 </label> <input type="text"
								class="form-control" id="sh_board_code" />
						</div>
						<div class="checkbox">

							<label> <input type="checkbox" /> Check me out
							</label>
						</div>
						<div class="checkbox">

							<label> <input type="checkbox" /> Check me out
							</label>
						</div>
						<div class="checkbox">

							<label> <input type="checkbox" /> Check me out
							</label>
						</div>
						<br>
						<br>
						<div>
							<button type="submit" class="btn btn-primary">수정</button>
							<button type="button" class="btn btn-danger">삭제</button>

						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="sh_id"> 선박번호 </label> <input type="text"
								class="form-control" id="sh_id" />
						</div>
						<div class="form-group">
							<label for="sh_board_code"> 센서코드 </label> <input type="text"
								class="form-control" id="sh_board_code" />
						</div>
						<div class="form-group">
							<label for="sh_id"> 선박번호 </label> <input type="text"
								class="form-control" id="sh_id" />
						</div>
						<div class="form-group">
							<label for="sh_board_code"> 센서코드 </label> <input type="text"
								class="form-control" id="sh_board_code" />
						</div>
						<div class="form-group">
							<label for="sh_board_code"> 센서코드 </label> <input type="text"
								class="form-control" id="sh_board_code" />
						</div>
						<div class="checkbox">

							<label> <input type="checkbox" /> Check me out
							</label>
						</div>
						<div class="checkbox">

							<label> <input type="checkbox" /> Check me out
							</label>
						</div>
						<div class="checkbox">

							<label> <input type="checkbox" /> Check me out
							</label>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>

</body>
</html>

<!--  
				<fieldset class="form-group">
						<legend class="mt-4">Checkboxes</legend>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault"> <label class="form-check-label"
								for="flexCheckDefault"> Default checkbox </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckChecked" checked=""> <label
								class="form-check-label" for="flexCheckChecked"> Checked
								checkbox </label>
						</div>
					</fieldset>
-->
<%@ include file="../include/footer.jsp"%>