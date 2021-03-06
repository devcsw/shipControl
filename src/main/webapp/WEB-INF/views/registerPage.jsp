<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<script>
	$(function name() {
		$("#buttonRegister").click(function name(e) {
			e.preventDefault();

			let user_pw = $("#user_pw").val();
			let user_pw_confirm = $("#user_pw_confirm").val();
			
			if (user_pw != user_pw_confirm) {
				alert("비밀번호를 확인해주세요");
				$("#user_pw").val("");
				$("#user_pw_confirm").val("");
				$("#user_pw").focus();
			}

			if (user_pw == user_pw_confirm) {
				$("#registerForm").submit();
			}

		});
	});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3>회원가입 페이지 입니다</h3>
			<br>
		</div>
	</div>
</div>


<!-- 회원가입 form -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/registerRun" method="post"
				id="registerForm">
				<div class="form-group">
					<label for="user_id"> 아이디* </label> <input type="text"
						class="form-control" id="user_id" name="user_id" />
				</div>

				<div class="form-group">
					<label for="user_pw"> 비밀번호* </label> <input type="password"
						class="form-control" id="user_pw" name="user_pw" />
				</div>

				<div class="form-group">
					<label for="user_pw"> 비밀번호 확인* </label> <input type="password"
						class="form-control" id="user_pw_confirm" name="user_pw_confirm" />
				</div>

				<div class="form-group">
					<label for="user_name"> 이름* </label> <input type="text"
						class="form-control" id="user_name" name="user_name" />
				</div>

				<div class="form-group">
					<label for="user_rank "> 직위* </label> <input type="text"
						class="form-control" id="user_rank " name="user_rank" />
				</div>

				<div class="form-group">
					<label for="user_phone "> H.P* </label> <input type="text"
						class="form-control" id="user_phone " name="user_phone" />
				</div>

				<button type="submit" class="btn btn-primary" id="buttonRegister">회원가입</button>
				<a href="/" class="btn btn-warning">돌아가기</a>
			</form>
		</div>
	</div>
</div>

<!-- 회원가입 form ends -->

<%@ include file="include/footer.jsp"%>