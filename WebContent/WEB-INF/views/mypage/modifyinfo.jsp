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
	
	<div class="w3-container w3-margin-top w3-center" style="width: 600px;">
	<form class="w3-card-4 w3-center" action="/mypage/modifyrst.do" autocomplete="off" method="post">
		<div align="center" >
		<table>
			<tr><td><br/></td></tr>
			<tr>
				<th height="50px">아이디</th>
				<td>&nbsp;&nbsp;</td>
				<td align="center"><input class="w3-input" type="text"
					value="${sessionScope.userId }" disabled
					style="padding: 8px; font-size: 12pt; width: 250px;" /> <input
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
					value="${addinfoload.EMAIL}" placeholder="이메일"
					style="padding: 8px; font-size: 12pt; width: 250px;" disabled /> <input
					type="hidden" name="h_email" value="${addinfoload.EMAIL}" /></td>
			</tr>

			<tr>
				<th height="50px">성별</th>
				<td>&nbsp;&nbsp;</td>
				<td align="center"><input class="w3-radio" type="radio"
					${ gender eq 1 ? 'checked':'' } name="gender" id="man" value="1"
					checked="checked" /> <label for="man">남성</label> <input class="w3-radio"
					type="radio" ${ gender eq 2 ? 'checked':'' } name="gender"
					id="woman" value="2" /> <label for="woman">여성</label></td>
			</tr>

			<tr>
				<th height="50px">생년월일</th>
				<td>&nbsp;&nbsp;</td>
				<td align="center"><select class="w3-select" name="birth_y"
					style="padding: 8px; font-size: 12pt; width: 100px"
					required="required">
						<c:forEach var="x" begin="1910" end="2018" step="1">
							<option ${birth_y == x ? 'selected':'' }>${x }</option>
						</c:forEach>
				</select> <select class="w3-select" name="birth_m" 
					style="padding: 8px; font-size: 12pt; width: 100px"
					required="required">
						<c:forEach var="x" begin="1" end="12" step="1">
							<option ${birth_m == x ? 'selected':'' }>${x }</option>
						</c:forEach>
				</select> <select class="w3-select" name="birth_d"
					style="padding: 8px; font-size: 12pt; width: 100px"
					required="required">
						<c:forEach var="x" begin="1" end="31" step="1">
							<option ${birth_d == x ? 'selected':'' }>${x }</option>
						</c:forEach>
				</select></td>
			</tr>

			<tr>
				<th height="50px">사는 지역</th>
				<td>&nbsp;&nbsp;</td>
				<td align="center"><select class="w3-select"  name="area"
					style="padding: 8px; font-size: 12pt; width: 120px"
					required="required">
						<option>${area }</option>
						<option selected="selected">서울</option>
						<option>경기</option>
						<option>인천</option>
						<option>부산</option>
						<option>대구</option>
						<option>대전</option>
						<option>세종</option>
						<option>광주</option>
						<option>울산</option>
						<option>강원</option>
						<option>충청남도</option>
						<option>충청북도</option>
						<option>전라남도</option>
						<option>전라북도</option>
						<option>경상남도</option>
						<option>경상북도</option>
						<option>제주도</option>
						<option>해외</option>
						<option>기타</option>
				</select></td>
			</tr>

			<tr>
				<th height="50px">담력</th>
				<td>&nbsp;&nbsp;</td>
				<td align="center"><input class="w3-radio" type="radio"
					${ fear eq 1 ? 'checked':'' } name="fear" id="f_high" value="1"
					class="authsuccess" /> <label for="f_high">고수</label> <input class="w3-radio" 
					type="radio" ${ fear eq 2 ? 'checked':'' } name="fear"
					id="f_middle" value="2" class="authsuccess" /> <label
					for="f_middle">중수</label> <input class="w3-radio" type="radio" 
					${ fear eq 3 ? 'checked':'' } name="fear" id="f_low" value="3"
					class="authsuccess" /> <label for="f_low">하수</label></td>
			</tr>

			<tr>
				<th height="50px">매칭 유형</th>
				<td>&nbsp;&nbsp;</td>
				<td align="center"><input class="w3-radio" type="radio"
					${ matchtype eq 1 ? 'checked':'' } name="matchtype" id="m_same"
					value="1" class="authsuccess" /> <label for="m_same">동성</label> <input class="w3-radio" 
					type="radio" ${ matchtype eq 2 ? 'checked':'' } name="matchtype"
					id="m_diff" value="2" class="authsuccess" /> <label for="m_diff">이성</label>
					<input class="w3-radio" type="radio" ${ matchtype eq 3 ? 'checked':'' }
					name="matchtype" id="m_nocare" value="3" class="authsuccess" /> <label
					for="m_nocare">상관없음</label></td>
			</tr>

			<tr>
				<th height="50px">자기 소개</th>
				<td>&nbsp;&nbsp;</td>
				<td align="center"><textarea class="w3-input" rows="10" cols="100" name="intro"
						style="padding: 8px; font-size: 12pt; width: 350px; height: 200px; resize: none;"
						class="authsuccess" required="required">${intro }</textarea></td>
			</tr>

			<tr>
				<td colspan="4" align="center"><br />
					<button type="submit" id="confirm" class="w3-button w3-section w3-theme-l2 w3-ripple"
						style="padding: 8px; font-size: 12pt; width: 100px">확인</button> <a
					href="./mypageindex.do"><button type="button" 
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
	$("#confirm").on("click", function() {
		window.alert("정보 수정이 완료되었습니다.");
	});
</script>