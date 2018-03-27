<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div align="center" style="min-height: 80%">
		<!-- Section 영역 -->
		<h3>D E L E T E &nbsp; I D & I N F O</h3>
		<br/>
		<form action="/mypage/delete.do" autocomplete="off" method="post">
		
		<table>		
			<tr>
				<th height="50px">I D</th>
				<td></td>
				<td align="center">${sessionScope.userId }</td> 
			</tr>
			
			<tr>
				<th height="50px">P A S S</th>
				<td></td>
				<td align="center">
				<input type="password" name="pass1" id="inputpass" placeholder="비밀번호"
				 style="padding: 8px; font-size: 12pt; width: 250px;"/></td>
				 <td><button type="button"
					id="pass_bt" style="padding: 7px; font-size: 12pt; width: 50px">확인</button></td>
				<br/>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<button type="submit" id="confirm" style="padding: 8px; font-size: 12pt; width: 150px" disabled>회원탈퇴</button>
				</td>
			</tr>
			
		</table>
		</form>	
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
		if(result) { 
			window.alert("회원탈퇴가 완료되었습니다.")
			location.replace('/'); 
		} else { 
			
		} 
	});
		

</script>
	
	
	
	
	
	