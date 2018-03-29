<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center" style="min-height: 80%">
		<!-- Section 영역 -->
		<h3>로그인</h3>
		<form action="./login.do" method="post">
			<p>
				<input type="text" name="id" placeholder="아이디"
				 style="padding: 8px; font-size: 12pt; width: 250px;" pattern="[A-Za-z0-9]+"/>
			</p>
			<p>
				<input type="password" name="pass" placeholder="비밀번호"
				 style="padding: 8px; font-size: 12pt; width: 250px;" pattern="[A-Za-z0-9]+"/>	
			</p>
			<p>
				<button type="submit" style="padding: 8px; font-size: 12pt; width: 250px">로그인</button>
			</p>
		</form>
		<!-- <small>
			<a href="/join/joinindex.do" style="font-size: 8pt;">회원가입</a> | 
			<a href="/login/idfind.do" style="font-size: 8pt">아이디 찾기</a> | 
			<a href="/login/passfind.do" style="font-size: 8pt">비밀번호 찾기</a>
		</small> -->
</div>