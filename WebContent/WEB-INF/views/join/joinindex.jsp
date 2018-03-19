<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div align="center" style="min-height: 80%">
		<!-- Section 영역 -->
		<h3>J O I N</h3>
		<form action="./join.do" method="post" autocomplete="off">
			<p>
				<input type="text" name="id" id="id" placeholder="아이디"
				 style="padding: 8px; font-size: 12pt; width: 250px;" pattern="[A-Za-z0-9]+"/><br/>
				 <span id="idcheck"></span>
				 <span id="idtype"></span>
			</p>
			<p> 
				<input type="password" name="pass1" id="pass1" placeholder="비밀번호"
				 style="padding: 8px; font-size: 12pt; width: 250px;"/><br/>
			</p>
			<p> 
				<input type="password" name="pass2" id="pass2" placeholder="비밀번호확인"
				 style="padding: 8px; font-size: 12pt; width: 250px;"/><br/>
				 <span id="passcheck"></span>
			</p>
			<p>				
				<input type="text" name="nick" id="nick" placeholder="닉네임" 
				 style="padding: 8px; font-size: 12pt; width: 250px;" pattern="[가-힣]+"/><br/>
				<span id="nickcheck"></span>
				<span id="nicktype"></span>
			</p>
			<p>
				<button type="submit" style="padding: 8px; font-size: 12pt; width: 250px">가입하기</button>
			</p>
			<p>
				<a href="../index.do"><button type="button" class="btn btn-primary" style="padding: 8px; font-size: 12pt; width: 250px">돌아가기</button></a>
			</p>
		</form>
		<script>
		var idsc="";
		var passsc="";
		var nicksc="";
		
		var regexp1 = new RegExp("[A-Za-z0-9]+");
		$("#id").keyup(function() {
			var t = regexp1.test($(this).val());
			$("#idtype").html("");
			if(t==false){
				$("#idtype").html("<small>id는 영문과 숫자 조합만 가능합니다. 다시입력하세요.</small>");
			}else{
				$("#idtype").html("");
			}
		});
		
		var regexp2 = new RegExp("[ㄱ-ㅎ가-힇]+");
		$("#nick").keyup(function() {
			var t = regexp2.test($(this).val());
			$("#nicktype").html("");
			if(t==false){
				$("#nicktype").html("<small>닉네임은 한글만 가능합니다. 다시입력하세요.</small>");
			}else{
				$("#nicktype").html("");
			}
		});
		
		$("#id").on("change", function() {
			var val = this.value;
			var xhr = new XMLHttpRequest();
			var id = $("#id").value;
			$("#idcheck").html("");
			xhr.onreadystatechange = function() {
				if(this.readyState==4) {
					if(this.responseText.trim()=="true"){
						$("#idcheck").html("<small>이미 사용중인 아이디입니다.</small>");
						idsc="true";
					} else {
						$("#idcheck").html("<small>없는 아이디입니다. 사용하세요.</small>");
						idsc="false";
					}
				}
			}
			xhr.open("get","./idcheck.do?id=" + val, true);
			xhr.send();
		});
		
		 $("#nick").on("change", function() {
			var val = this.value;
			var xhr = new XMLHttpRequest();
			$("#nickcheck").html("");
			xhr.onreadystatechange = function() {
				if(this.readyState==4) {
					if(this.responseText.trim()=="true"){
						$("#nickcheck").html("");
						$("#nickcheck").html("<small>이미 사용중인 닉네임입니다.</small>");
						nicksc="false";
					} else {
						$("#nickcheck").html("");
						$("#nickcheck").html("<small>없는 닉네임입니다. 사용하세요.</small>");
						nicksc="true";
					}
				}
			}
			xhr.open("get","./nickcheck.do?nick=" + val, true);
			xhr.send();
		});
			
		 $("#pass2").on("change", function() {
			var pass2 = this.value;
			var xhr = new XMLHttpRequest();
			var pass1 = $("#pass1").val();
			if(pass1 == pass2){
				$("#passcheck").html("");
				$("#passcheck").html("<small>비밀번호가 일치합니다.</small>");
				passsc="true";
			} else {
				$("#passcheck").html("");
				$("#passcheck").html("<small>비밀번호가 일치하지 않습니다. 다시입력하세요.</small>");
				passsc="false";
			}
		});
		 
		</script>
		
	</div>
