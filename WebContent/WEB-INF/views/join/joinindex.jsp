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
				<button type="submit" id="join_bt" style="padding: 8px; font-size: 12pt; width: 250px" id="join">가입하기</button>
			</p>
			<p>
				<a href="../index.do"><button type="button" class="btn btn-primary" style="padding: 8px; font-size: 12pt; width: 250px">돌아가기</button></a>
			</p>
		</form>
		<script>
		$("#join_bt").on("click", function() {
			window.alert("가입이 완료되었습니다. 로그인해주세요.");
		});
		
		var idsc="";
		var passsc="";
		var nicksc="";
		var idcheck="";
		var nickcheck="";
		
		var joinfail = function() {
			$("#join").prop("disabled",true);
		}
		
		joinfail();
		
		var joinok = function() {
			if(idsc=="true" && passsc=="true" && nicksc=="true" && idcheck=="true" && nickcheck=="true") {
				 $("#join").prop("disabled",false);
			} else {
				 $("#join").prop("disabled",true);
			}
		}
		
		var regexp1 = new RegExp("[A-Za-z0-9]+");
		$("#id").keyup(function() {
			var t = regexp1.test($(this).val());
			$("#idtype").html("");
			if(t==false){
				$("#nicktype").html("");
				$("#idtype").html("<small style=\"color:red\">id는 한글 및 특수문자 입력이 불가능합니다. 다시입력하세요.</small>");
				idcheck="false";
			}else{
				$("#idtype").html("");
				idcheck="true";
				joinok();
			}
		});
		
		var regexp2 = new RegExp("[ㄱ-ㅎ가-힇]+");
		$("#nick").keyup(function() {
			var t = regexp2.test($(this).val());
			$("#nicktype").html("");
			if(t==false){
				$("#nicktype").html("");
				$("#nicktype").html("<small style=\"color:red\">닉네임은 한글만 가능합니다. 다시입력하세요.</small>");
				nickcheck="false";
			}else{
				$("#nicktype").html("");
				nickcheck="true";
				joinok();
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
						$("#idcheck").html("");
						$("#idcheck").html("<small style=\"color:red\">이미 사용중인 아이디입니다.</small>");
						idsc="false";
					} else {
						$("#idcheck").html("");
						if(idcheck=="true"){
							$("#idcheck").html("<small style=\"color:green\">없는 아이디입니다. 사용하세요.</small>");
							idsc="true";
						}
						joinok();
					}
				}
			}
			xhr.open("get","./idcheck.do?id=" + val, true);
			xhr.send();
		});
		
		$("#pass2").on("change", function() {
			var pass2 = this.value;
			var xhr = new XMLHttpRequest();
			var pass1 = $("#pass1").val();
			if(pass1 == pass2){
				$("#passcheck").html("");
				$("#passcheck").html("<small style=\"color:green\">비밀번호가 일치합니다.</small>");
				passsc="true";
				joinok();
			} else {
				$("#passcheck").html("");
				$("#passcheck").html("<small style=\"color:red\">비밀번호가 일치하지 않습니다. 다시입력하세요.</small>");
				passsc="false";
			}
		});
		
		 $("#nick").on("change", function() {
			var val = this.value;
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(this.readyState==4) {
					if(this.responseText.trim()=="true"){
						$("#nickcheck").html("");
						$("#nickcheck").html("<small style=\"color:red\">이미 사용중인 닉네임입니다.</small>");
						nicksc="false";
					} else {
						$("#nickcheck").html("");
						if(nickcheck=="true"){
							$("#nickcheck").html("<small style=\"color:green\">없는 닉네임입니다. 사용하세요.</small>");
						}
						nicksc="true";
						joinok();
					}
				}
			}
			xhr.open("get","./nickcheck.do?nick=" + val, true);
			xhr.send();
		});
		</script>
		
	</div>
