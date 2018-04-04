<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">

<div class="w3-container" align="center" style="min-height: 80%">

	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">M O D I F Y &nbsp; I N F O R M A T I O N</h1>
	</header>
	<br />

	<div class="w3-container w3-margin-top w3-center" style="width: 550px;">
		<form class="w3-card-4 w3-center" action="/mypage/modifyinfo.do" autocomplete="off" method="post">
			<div align="center" >
			<table>
				<tr><td><br/></td></tr>
				<tr>
					<th height="50px">아이디</th>
					<td>&nbsp;&nbsp;</td>
					<td align="center"><input class="w3-input" type="text" 
						value="${sessionScope.userId }" disabled
						style="padding: 8px; font-size: 12pt; width: 250px;" /><input
						type="hidden" name="id" value="${sessionScope.userId }" />
				</tr>


				<tr>
					<th height="50px">닉네임</th>
					<td>&nbsp;&nbsp;</td>
					<td align="center"><input class="w3-input" type="text" name="nick"
						value="${sessionScope.userNick }" disabled
						style="padding: 8px; font-size: 12pt; width: 250px;" />
				</tr>
				<tr>
					<th height="50px">이메일</th>
					<td>&nbsp;&nbsp;</td>
					<td align="center"><input class="w3-input" type="text" name="email"
						value="${addinfoload.EMAIL }" placeholder="이메일"
						style="padding: 8px; font-size: 12pt; width: 250px;" disabled />
						<input type="hidden" id="email" name="email_h"
						value="${addinfoload.EMAIL }" /></td>
				</tr>
				<tr>
					<th height="50px">비밀번호</th>
					<td>&nbsp;&nbsp;</td>
					<td align="center">
					<input class="w3-input" type="password" name="pass1"
						id="inputpass"
						style="padding: 8px; font-size: 12pt; width: 250px;" />
					</td>
					<td><button type="button" id="pass_bt" class="w3-button w3-section w3-theme-l2 w3-ripple"
							style="padding: 7px; font-size: 12pt; width: 50px">확인</button></td>
				
				</tr>
				<tr>
					<td colspan="4"><small>※ 이메일 인증을 받으셔야 정보수정이 가능합니다.</small></td>
				</tr>
				<tr>

					<td colspan="4" align="center"><br />
						<button type="submit" id="modify" class="w3-button w3-section w3-theme-l2 w3-ripple"
							style="padding: 8px; font-size: 12pt; width: 100px" disabled>정보수정</button>
						<a href="/mypage/passupdateform.do"><button type="button" class="w3-button w3-section w3-theme-l2 w3-ripple"
								id="updatepass"
								style="padding: 8px; font-size: 12pt; width: 150px" disabled>비밀번호
								변경</button></a> <a href="./mypageindex.do"><button type="button"
								class="w3-button w3-section w3-theme-l2 w3-ripple"
								style="padding: 8px; font-size: 12pt; width: 100px">이전으로</button></a>
					</td>
				</tr>
			</table>
			</div>

		</form>
	</div>

</div>
<script>
	$("#pass_bt").on("click", function() {
		var t = $("#inputpass").val();
		var e = $("#email").val();
		$.ajax({
			"url" : "/mypage/sendPassword.do",
			"data" : {
				"inputpass" : $("#inputpass").val()
			}
		}).done(function(obj) {
			if (obj.rst) {
				if ($.trim($("#email").val()) == '') {
					$("#updatepass").prop("disabled", false);
				} else {
					$("#modify").prop("disabled", false);
					$("#updatepass").prop("disabled", false);
				}
			} else {
				window.alert("비밀번호가 불일치합니다.");
				$("#inputpass").val("");
				$("#inputpass").focus();
			}
		});
	});
</script>