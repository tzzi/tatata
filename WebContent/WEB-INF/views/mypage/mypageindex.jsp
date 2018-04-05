<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">

<div class="w3-container" align="center" style="min-height: 80%">

	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">M Y &nbsp; P A G E</h1>
	</header>
	<br />

	<div class="w3-container w3-margin-top w3-center" style="width: 500px;">
		<form class="w3-card-4 w3-center" action="/mypage/modify.do" method="post" autocomplete="off">
			<div align="center">
			<table>
				<tr><td><br/></td></tr>
				<tr>
					<th height="50px">아이디</th>
					<td align="center">${sessionScope.userId }</td>
				</tr>

				<tr>
					<th height="50px">닉네임</th>
					<td align="center">${sessionScope.userNick }</td>
				</tr>

				<tr>
					<th height="50px">인증</th>
					<td align="center">

						<div class="w3-text-theme">
							<a href="/mypage/addinfo.do">
								<button type="button"
									class="w3-button w3-section w3-theme-l2 w3-ripple"
									style="padding: 6px; font-size: 12pt; width: 180px"
									${ empty addinfo? '':'disabled' }>인증하러가기</button>
							</a>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2"><small style="color:red;">※ 이메일을 인증 받으시면, 매칭서비스를 이용하실 수
							있습니다.</small><br /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><br />
						<div class="w3-text-theme">
							<button type="submit"
								class="w3-button w3-section w3-theme-l2 w3-ripple"
								style="padding: 8px; font-size: 12pt; width: 150px">정보수정</button>
							<a href="/mypage/deleteform.do"><button type="button"
									class="w3-button w3-section w3-theme-l2 w3-ripple"
									style="padding: 8px; font-size: 12pt; width: 150px">회원탈퇴</button></a><br />
						</div></td>
				</tr>
			</table>
			</div>
		</form>
	</div>
</div>