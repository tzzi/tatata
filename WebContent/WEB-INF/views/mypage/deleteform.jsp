<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">

<div class="w3-container" align="center" style="min-height: 80%">

	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">D E L E T E &nbsp; I N F O</h1>
	</header>
	<br />

	<div class="w3-container w3-margin-top w3-center" style="width: 500px;">
		<form class="w3-card-4 w3-center" action="/mypage/delete.do" method="post" autocomplete="off">
			<div align="center">
				<table>		
					<tr><td><br/></td></tr>
					<tr>
						<th height="50px">아이디</th>
						<td></td>
						<td align="center">${sessionScope.userId }</td> 
					</tr>
					
					<tr>
						<th height="50px">비밀번호</th>
						<td></td>
						<td align="center">
						<input type="password" class="w3-input" name="pass1" id="inputpass"
						 style="padding: 8px; font-size: 12pt; width: 250px;"/></td>
						 <td>
							 <div class="w3-text-theme">
							 <button type="button" class="w3-button w3-section w3-theme-l2 w3-ripple"
								id="pass_bt" style="padding: 7px; font-size: 12pt; width: 50px">확인</button>
							 </div>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<div class="w3-text-theme">
								<button type="submit" id="confirm" class="w3-button w3-section w3-theme-l2 w3-ripple"
								style="padding: 8px; font-size: 12pt; width: 150px" disabled>회원탈퇴</button>
							</div>
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
		$.ajax({
			"url" : "/mypage/sendPassword.do",
			"data" : {
				"inputpass" : $("#inputpass").val()
			}
		}).done(function(obj){
			if(obj.rst) {
				$("#confirm").prop("disabled", false);
			}else {
				window.alert("비밀번호가 불일치합니다.");
				$("#pass1").val("");
				$("#inputpass").focus();
			}
		});
	});
	
	
	$('#confirm').click(function() { 
		var result = confirm('정말 회원탈퇴를 하시겠습니까?');
		console.log(result);
		if(result==true) { 
			window.alert("회원탈퇴가 완료되었습니다.")
			location.replace('/'); 
		} else { 
			
		} 
	});
		

</script>
	
	
	
	
	
	