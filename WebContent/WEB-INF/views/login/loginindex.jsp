<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center" style="min-height: 80%">
		<!-- Section 영역 -->
		<h3>로그인</h3>
		<form action="./login.do" method="post">
			<p>
				<input type="text" name="id" placeholder="아이디" id="id"
				 style="padding: 8px; font-size: 12pt; width: 250px;" pattern="[A-Za-z0-9]+" required="required"/>
			</p>
			<p>
				<input type="password" name="pass" placeholder="비밀번호" id="pass"
				 style="padding: 8px; font-size: 12pt; width: 250px;" pattern="[A-Za-z0-9]+" required="required"/>	
			</p>
			<p>
				<button type="button" style="padding: 8px; font-size: 12pt; width: 250px" id="login">로그인</button>
			</p>
		</form>
		<!-- <small>
			<a href="/join/joinindex.do" style="font-size: 8pt;">회원가입</a> | 
			<a href="/login/idfind.do" style="font-size: 8pt">아이디 찾기</a> | 
			<a href="/login/passfind.do" style="font-size: 8pt">비밀번호 찾기</a>
		</small> -->
		
</div>
		<script>
		$("#login").click(function(){
			$.ajax("/login/login.do",{
				"method" : "post",
				"async" : false,
				"data" : {
					"id" : $("#id").val(),
					"pass" : $("#pass").val()
				}
			}).done(function(obj){
				if(obj[0].result==1){
					window.alert("아이디나 비밀번호를 확인해주세요")
				}else{
					location.href = "/index.do";
				}
			});
		});
		
		
		</script>