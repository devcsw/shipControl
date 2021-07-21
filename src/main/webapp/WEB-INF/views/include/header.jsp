<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="ㅎㅇ" />
<meta name="author" content="ㅎㅇ" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>선박관제시스템</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<style type="text/css">
</style>
</head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="/resources/js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="/resources/assets/demo/chart-area-demo.js"></script>
<script src="/resources/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="/resources/js/datatables-simple-demo.js"></script>

<link href="/resources/css/bootstrap.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- socket통신 
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>-->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>	
<script src="/resources/js/my-script.js"></script>

<script type="text/javascript">
	$(function name() {
		$("#loginButton").click(function name() {
			$("#loginForm").submit();
		});
	});
</script>
<body class="sb-nav-fixed">

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="/"> 
			<img name="ig" src="/resources/img/green_ship.png"  width="40" height="40" border="3"/>
			선박관제시스템</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="/">전체상황 </a></li>
					<li class="nav-item"><a class="nav-link" href="/shipcontrol/management">선박관리</a></li>
					<li class="nav-item"><a class="nav-link" href="/reportPage">조난내역</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-haspopup="true" aria-expanded="false">통계</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">그래프</a> <a
								class="dropdown-item" href="#">다른거</a> <a class="dropdown-item"
								href="#">또다른거</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">또또다른거</a>
						</div></li>
				</ul>



				<div class="d-flex">

					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">

								<c:choose>
									<c:when test="${loginVo==null }">

										<a id="modal-109186" href="#modal-container-109186"
											class="btn btn-light" data-toggle="modal">로그인</a>

										<div class="modal fade" id="modal-container-109186"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="myModalLabel">로그인 하기</h5>
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">×</span>
														</button>
													</div>
													<div class="modal-body">

														<div class="container-fluid">
															<div class="row">
																<div class="col-md-12">
																	<form role="form" action="/loginRun" method="post"
																		id="loginForm">
																		<div class="form-group">

																			<label for="user_id"> 아이디 </label> <input type="text"
																				class="form-control" id="login_user_id"
																				name="user_id" />
																		</div>
																		<div class="form-group">

																			<label for="user_pw"> 패스워드 </label> <input
																				type="password" class="form-control"
																				id="login_user_pw" name="user_pw" />
																		</div>
																	</form>
																</div>
															</div>
														</div>

													</div>
													<div class="modal-footer">
														<a type="button" class="btn btn-success"
															href="/registerPage">회원가입</a>
														<button type="button" class="btn btn-primary"
															id="loginButton">로그인</button>
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">취소</button>
													</div>
												</div>
											</div>
										</div>

									</c:when>
									<c:otherwise>
										<div class="dropdown">
											<button class="btn btn-success dropdown-toggle" type="button"
												id="dropdownMenuButton" data-toggle="dropdown">
												<div style="color: white;">${loginVo.user_name}</div>
											</button>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">내 정보</a> <a
													class="dropdown-item" href="/logout">로그아웃</a> <a
													class="dropdown-item" href="#">Something else here</a>
											</div>
										</div>
									</c:otherwise>
								</c:choose>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>