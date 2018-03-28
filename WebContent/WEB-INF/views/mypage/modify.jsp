<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div align="center" style="min-height: 80%">
		<!-- Section 영역 -->
		<h3>M O D I F Y &nbsp; I N F O R M A T I O N</h3>
		<br/>
		<form action="/mypage/modifyinfo.do" autocomplete="off" method="post">
			
			<table>
				<tr>
				<th height="50px">아이디</th>
				<td></td>
				<td align="center"><input type="text"  value="${sessionScope.userId }" disabled
				style="padding: 8px; font-size: 12pt; width: 250px;"/><input type="hidden" name="id" value="${sessionScope.userId }"/>
				</tr>
				
	
				<tr>
					<th height="50px">닉네임</th>
					<td></td>
					<td align="center"><input type="text" name="nick" value="${sessionScope.userNick }" disabled
					style="padding: 8px; font-size: 12pt; width: 250px;"/>
				</tr>
				<tr>
					<th height="50px">이메일</th>
					<td></td>
					<td align="center">
						<input type="text" name="email" value="${email }" placeholder="이메일"
						style="padding: 8px; font-size: 12pt; width: 250px;"  ${ empty email? 'disabled':'' }/>
					 </td>
				</tr>
				<tr>
					<th height="50px">비밀번호</th>
					<td></td>
					<td align="center">
					<input type="password" name="pass1" id="inputpass"
					 style="padding: 8px; font-size: 12pt; width: 250px;"/></td>
					 <td><button type="button"
						id="pass_bt" style="padding: 7px; font-size: 12pt; width: 50px">확인</button></td>
					
				</tr>
				
				<tr>
					<td></td>
					<td colspan="2" align="center">
						<br/>
						<button type="submit" id="modify" style="padding: 8px; font-size: 12pt; width: 100px" disabled>정보수정</button>
						<a href="/mypage/passupdateform.do"><button type="button" id="updatepass" style="padding: 8px; font-size: 12pt; width: 150px" disabled>비밀번호 변경</button></a>
						<a href="./mypageindex.do"><button type="button" class="btn btn-primary" style="padding: 8px; font-size: 12pt; width: 100px">이전으로</button></a>
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
			$("#modify").prop("disabled", false);
			$("#updatepass").prop("disabled", false);
		}else {
			window.alert("비밀번호가 불일치합니다.");
			$("#inputpass").val("");
			$("#inputpass").focus();
		}
	});
});

</script>