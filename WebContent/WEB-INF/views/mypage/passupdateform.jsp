<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div align="center" style="min-height: 80%">
		<!-- Section 영역 -->
		<h3>M O D I F Y &nbsp; P A S S W O R D</h3>
		<br/>
		<form action="/mypage/passupdate.do" autocomplete="off" method="post">
		
		<table>		
			<tr>
				<td align="center">
				<input type="password" name="pass1" id="pass1" placeholder="새 비밀번호"
				 style="padding: 8px; font-size: 12pt; width: 250px;"/></td>
			</tr>
			
			<tr>
				<td align="center">
				<input type="password" name="pass2" id="pass2" placeholder="비밀번호확인"
				 style="padding: 8px; font-size: 12pt; width: 250px;"/><br/>
				 <span id="passcheck"></span>
			</tr>
			
			<tr>
				<td align="center">
					<br/>
					<button type="submit" id="passconfirm" style="padding: 8px; font-size: 12pt; width: 120px" disabled>확인</button>
					<a href="./modify.do"><button type="button" style="padding: 8px; font-size: 12pt; width: 120px">이전으로</button></a>
				</td>
			</tr>
			
		</table>
		</form>	
	</div>
	

<script>
		
	$("#pass2").on("change", function() {
		var pass2 = this.value;
		var pass1 = $("#pass1").val();
		if(pass1 == pass2){
			$("#passcheck").html("");
			$("#passcheck").html("<small style=\"color:green\">비밀번호가 일치합니다.</small>");
			$("#passconfirm").prop("disabled", false);
		} else {
			$("#passcheck").html("");
			$("#passcheck").html("<small style=\"color:red\">비밀번호가 일치하지 않습니다. 다시입력하세요.</small>");
			$("#passconfirm").prop("disabled", true);
		}
	});
	
	$("#passconfirm").on("click", function() {
		window.alert("비밀번호 변경이 완료되었습니다.");
	});
</script>
	
	
	
	
	
	