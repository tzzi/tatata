<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">

<div align="center" style="min-height: 80%">
	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">M O D I F Y &nbsp; P A S
			S W O R D</h1>
	</header>
	<br />

	<div class="w3-container w3-margin-top w3-center" style="width: 400px;">
		<form class="w3-card-4 w3-center" action="/mypage/passupdate.do"
			autocomplete="off" method="post">
			<div align="center">
				<table>
					<tr>
						<td><br /></td>
					</tr>
					<tr>
						<td align="center"><input class="w3-input" type="password"
							name="pass1" id="pass1" placeholder="새 비밀번호"
							style="padding: 8px; font-size: 12pt; width: 250px;" /><br /></td>
					</tr>

					<tr>
						<td align="center"><input class="w3-input" type="password"
							name="pass2" id="pass2" placeholder="비밀번호확인"
							style="padding: 8px; font-size: 12pt; width: 250px;" /><br /> <span
							id="passcheck"></span>
					</tr>

					<tr>
						<td align="center">
							<button type="submit" id="passconfirm"
								class="w3-button w3-section w3-theme-l2 w3-ripple"
								style="padding: 8px; font-size: 12pt; width: 120px" disabled>확인</button>
							<a href="./modify.do"><button type="button"
									class="w3-button w3-section w3-theme-l2 w3-ripple"
									style="padding: 8px; font-size: 12pt; width: 120px">이전으로</button></a>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>
<script>
	$("#pass2")
			.on(
					"change",
					function() {
						var pass2 = this.value;
						var pass1 = $("#pass1").val();
						if (pass1 == pass2) {
							$("#passcheck").html("");
							$("#passcheck")
									.html(
											"<small style=\"color:green\">비밀번호가 일치합니다.</small>");
							$("#passconfirm").prop("disabled", false);
						} else {
							$("#passcheck").html("");
							$("#passcheck")
									.html(
											"<small style=\"color:red\">비밀번호가 일치하지 않습니다. 다시입력하세요.</small>");
							$("#passconfirm").prop("disabled", true);
						}
					});

	$("#passconfirm").on("click", function() {
		window.alert("비밀번호 변경이 완료되었습니다.");
	});
</script>