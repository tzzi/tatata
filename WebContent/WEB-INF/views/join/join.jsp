<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>회원가입완료</h2>
<div align="center">
<p>
"타타타" 홈페이지에 가입해 주셔서 감사합니다.<br/>
가입이 정상적으로 처리되었습니다.<br/>
아이디 : ${requestScope.id }<br/>
닉네임 : ${requestScope.nick }<br/>
<a href="../index.do"><button type="button" class="btn btn-primary" style="padding: 8px; font-size: 12pt; width: 100px">돌아가기</button></a>
</p>
</div>