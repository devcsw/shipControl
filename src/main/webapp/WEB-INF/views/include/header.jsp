<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Dashboard - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<style type="text/css">
#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 70px;
	background: #ccc;
}
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

<script type="text/javascript">
	
</script>
<body class="sb-nav-fixed">


	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">선박관제시스템☆선박관제</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="/">전체상황 </a></li>
<<<<<<< HEAD
					<li class="nav-item"><a class="nav-link" href="/management">선박관리</a></li>
					<li class="nav-item"><a class="nav-link" href="#">조난내역</a></li>
					<li class="nav-item"><a class="nav-link" href="#">처리현황</a></li>
=======
					<li class="nav-item"><a class="nav-link" href="#">선박관리</a></li>
					<li class="nav-item"><a class="nav-link" href="/reportPage">조난내역</a></li>
>>>>>>> branch 'main' of https://github.com/devcsw/shipControl
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

								<a id="modal-109186" href="#modal-container-109186"
									class="btn btn-light" data-toggle="modal">로그인</a>

								<div class="modal fade" id="modal-container-109186"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
															<form role="form">
																<div class="form-group">

																	<label for="user_id"> 아이디 </label> <input type="text"
																		class="form-control" id="user_id" name="user_id" />
																</div>
																<div class="form-group">

																	<label for="user_pw"> 패스워드 </label> <input
																		type="password" class="form-control" id="user_pw"
																		name="user_pw" />
																</div>

															</form>
														</div>
													</div>
												</div>

											</div>
											<div class="modal-footer">

												<button type="button" class="btn btn-primary">로그인</button>
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">취소</button>
											</div>
										</div>

									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>