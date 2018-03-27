<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div align="center" style="min-height: 80%">
		<!-- Section 영역 -->
		<h3>M Y &nbsp; P A G E</h3>
		<br/>
		<form action="/mypage/modify.do" method="post" autocomplete="off">
		<table>
			<tr>
				<th height="50px">I D</th>
				<td align="center">${sessionScope.userId }</td> 
			</tr>
			
			<tr>
				<th height="50px">N I C K</th>
				<td align="center">${sessionScope.userNick }</td>
			</tr>
			
			<tr>
				<th height="50px">A U T H</th>
				<td align="center">
				
				<a href="/mypage/addinfo.do"><button type="button" class="btn btn-primary" style="padding: 6px; font-size: 12pt; width: 180px"> 
				인증하러가기</button></a>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<small>※ 이메일을 인증 받으시면, 매칭서비스를 이용하실 수 있습니다.</small><br/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<br/>
					<button type="submit" class="btn btn-primary" style="padding: 8px; font-size: 12pt; width: 180px">정보수정</button>
					<a href="/mypage/deleteform.do"><button type="button" style="padding: 8px; font-size: 12pt; width: 180px">회원탈퇴</button></a><br/>
				</td>
			</tr>
			
		</table>
		
		</form>	
			
	</div>

