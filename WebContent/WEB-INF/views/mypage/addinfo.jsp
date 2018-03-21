<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center" style="min-height: 80%">
		<!-- Section 영역 -->
		<h3>A D D &nbsp; I N F O R M A T I O N</h3>
		<br/>
		<form action="/mypage/modify.do" autocomplete="off">
		
		<table>
			<tr>
				<th height="50px">이메일 인증</th>
				<td></td>
				<td align="center">
					<input type="text" name="email" placeholder="이메일"
					style="padding: 8px; font-size: 12pt; width: 220px;"/>
					<button type="submit" formaction="/mypage/sendKey.do" formmethod="post" 
					id="email" style="padding: 7px; font-size: 12pt; width: 90px">인증</button>
				 </td>
			</tr>
			
			<tr>
				<th height="50px">인증키 확인</th>
				<td></td>
				<td align="center">
					<input type="text" name="key" placeholder="인증키"
					style="padding: 8px; font-size: 12pt; width: 220px;"/>
					<button type="submit" formaction="/mypage/confirmKey.do" formmethod="post" 
					id="key" style="padding: 7px; font-size: 12pt; width: 90px">확인</button>
					<br/>
					<br/>
			</tr>
			
			<tr>
				<th height="50px">아이디</th>
				<td></td>
				<td align="center"><input type="text" name="id" value="${cookie.id.value }" disabled
				style="padding: 8px; font-size: 12pt; width: 220px;"/>
			</tr>
			
			<tr>
				<th height="50px">성별</th>
				<td></td>
				<td align="center">
					<input type="radio" name="gender" value="남성"/>남성
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="여성"/>여성
				</td>
			</tr>
			
			<tr>
				<th height="50px">생년월일</th>
				<td></td>
				<td align="center">
				</td>
			</tr>
			
			<tr>
				<th height="50px">사는 지역</th>
				<td></td>
				<td align="center">
				</td>
			</tr>
			
			<tr>
				<th height="50px">담력</th>
				<td></td>
				<td align="center">
				</td>
			</tr>
			
			<tr>
				<th height="50px">매칭 유형</th>
				<td></td>
				<td align="center">
				</td>
			</tr>
			
			<tr>
				<th height="50px">자기 소개</th>
				<td></td>
				<td align="center">
					<input type="text" name="myinfo" placeholder="자기소개를 마음껏 입력하세요." 
					style="padding: 8px; font-size: 12pt; width: 350px; height: 200px"/>
				</td>
			</tr>
			
			<tr>
				<td></td>
				<td colspan="2" align="center">
					<br/>
					<button type="submit" class="btn btn-primary" style="padding: 8px; font-size: 12pt; width: 180px">정보수정</button>
					<a href="./mypageindex.do"><button type="button" class="btn btn-primary" style="padding: 8px; font-size: 12pt; width: 180px">돌아가기</button></a>
				</td>
			</tr>
		</table>
			
				
		</form>	
				

	</div>
	
<script>
	$("#email").on("click", function() {
		window.alert("이메일 인증키가 전송되었습니다. 단, 이메일이 잘못되었을 시 전송되지 않습니다.");
	});
	
	
</script>