<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
html {
	font-family: "Lato", sans-serif;
	background: url(/start/MainPage.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: none;
	border: none;
	color: none;
	text-align: center;
	font-size: 28px;
	padding: 20px; 
	width: 200px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.my-transparent-button {
	display: inline-block;
	border-radius: 4px;
    background-color: transparent !important;
    background-image: none !important;
    border-color: transparent;
    border: none;
    outline: none;
    color: #FFFFFF; 
    padding: 20px; 
	width: 200px;
	font-size: 28px;
	text-align: center;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
    
} 

.my-transparent-button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.my-transparent-button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.my-transparent-button:hover span {
	padding-right: 25px;
}

.my-transparent-button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
<html>
<head>
<title><tiles:getAsString name="title"></tiles:getAsString></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>














<body>
	<div align="center">
		<div style="width: 960px">
			<div style="min-height: 400px;"></div>


			<div style="min-height: 100px"></div>
			<div style="min-height: 170px"> 
			<!-- <h1>놀이공원 & 놀이기구 정보를 한눈에</h1>
			<h3><b>생생한 현장 소식을 전하다</b></h3> -->
			</div>
			<div align="center" style="min-height: 150px;">


				<!-- <a href="/join/joinindex.do"> --><button onclick="document.getElementById('id02').style.display='block'" class="my-transparent-button"
						style="vertical-align: middle">
						<span>J O I N </span>
					</button><!-- </a> --> 
				<!-- <a href="/login/loginindex.do"> --><button onclick="document.getElementById('id01').style.display='block'"class="my-transparent-button"
						style="vertical-align: middle">
						<span>L O G I N</span>
					</button><!-- </a> -->
			
<div class="w3-container">

  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">×</span>
        <img src="img_avatar4.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
      </div>

      <form class="w3-container" action="/login/login.do" method="post">
        <div class="w3-section">
          <label><b>아이디</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Username" name="id"  id="id1" pattern="[A-Za-z0-9]+" required>
          <label><b>비밀번호</b></label>
          <input class="w3-input w3-border" type="password" placeholder="Password" name="pass" id="password" pattern="[A-Za-z0-9]+" required>
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">로그인</button>
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red" id="cancel1">Cancel</button>
        <!-- <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span> -->
      </div>

    </div>
  </div>
  
  <div id="id02" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">×</span>
        <img src="img_avatar4.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
      </div>

      <form class="w3-container" action="join/join.do" method="post">
        <div class="w3-section">
        <p>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디" name="id" id="id" pattern="[A-Za-z0-9]+" required>
          <span id="idcheck"></span>
			<span id="idtype"></span>
			</p>
			<p>
          <input class="w3-input w3-border" type="password" placeholder="비밀번호" name="pass1" id="pass1" required>
          </p>
          <p>
          <input class="w3-input w3-border" type="password" placeholder="비밀번호 확인" name="pass2" id="pass2" required>
          <span id="passcheck"></span>
          </p>
          <p>
          <input class="w3-input w3-border" type="text" placeholder="닉네임 " name="nick" id="nick" pattern="[가-힣]+" required>
          <span id="nickcheck"></span>
			<span id="nicktype"></span>
          </p>
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit" id="join_bt" disabled>가입하기</button>
        </div>
      </form>




      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-button w3-red" id="cancel2">Cancel</button>
        <!-- <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span> -->
      </div>

    </div>
  </div>
  
  
</div>		
					
					
					
			</div>
		</div>
	</div>
</body>
<script>		
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
				 $("#join_bt").prop("disabled",false);
				 $("#join_bt").on("click", function() {
						window.alert("가입이 완료되었습니다. 로그인해주세요.");
					});
			} else {
				 $("#join_bt").prop("disabled",true);
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
		
		$("#id").change(function(){
			var id = $("#id").value;
			var val = this.value;
			$.ajax("/join/idcheck.do",{
				"method" : "post",
				"async" : false,
				"data":{
					"id" : val				
				}
			}).done(function(obj){
				if(obj==true){
					$("#idcheck").html("");
					$("#idcheck").html("<small style=\"color:red\">이미 사용중인 아이디입니다.</small>");
					idsc="false";
				}else{
					$("#idcheck").html("");
					if(idcheck=="true"){
						$("#idcheck").html("<small style=\"color:green\">없는 아이디입니다. 사용하세요.</small>");
						idsc="true";
					}
					joinok();
				}
			});
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
			xhr.open("get","join/nickcheck.do?nick=" + val, true);
			xhr.send();
		});
		 
		 $("#cancel2").click(function(){
			 $("#id").val("");
			 $("#pass1").val("");
			 $("#pass2").val("");
			 $("#nick").val("");
			 $("#idcheck").html("");
			 $("#idtype").html("");
			 $("#nickcheck").html("");
			 $("#nicktype").html("");
			 $("#passcheck").html("");
		 })
		 
		 $("#cancel1").click(function(){
			 $("#id1").val("");
			 $("#password").val("");
		 })
		 
		 
		</script>











</html>