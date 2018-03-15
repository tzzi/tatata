<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form name="regForm" action="join.do" method="post">
	아이디 <input type="text" name="id" id="id" placeholder="이름을 입력하세요." 
		maxlength="10" /> <input type="button" value="ID중복확인" id="btnId">
	<span id="idcheck"></span>
	<p></p>

	비밀번호 <input type="password" name="pass" id="pass" placeholder="비밀번호를 입력하세요."
		maxlength="20" /><br />
	<p></p>
	닉네임<input type="text" name="nick" id="nick" placeholder="닉네임 입력하세요."
		maxlength="10" /> <input type="button" value="닉네임 중복확인" id="btnnick">
	<span id="nickcheck"></span>
	<button type="submit" id="submit" disabled="disabled">회원가입</button>
</form>

<script>
	
	var idok = "";
	var nickok = "";
	var passok = "";
	
	document.getElementById("nick").onchange = function(){
		document.getElementById("submit").disabled = true;
		nickok = "";
	};
	
	document.getElementById("id").onchange = function(){
		document.getElementById("submit").disabled = true;
		idok = "";
	}
	
	document.getElementById("pass").onchange = function(){
		if (document.getElementById("pass").value != ""){
			passok = "ok";
			if (nickok == "ok" && idok == "ok" && passok == "ok"){
			  		document.getElementById("submit").disabled = false;
			  	}else{
			  		document.getElementById("submit").disabled = true;
			}
		}else{
			passok = "";
			document.getElementById("submit").disabled = true;
		}
	}
	
	
  	document.getElementById("btnnick").onclick = function(){
  		var checknick = document.getElementById("nick").value;
  		if (checknick != ""){
  			var xhr = new XMLHttpRequest();
  	  		xhr.open("get", "/account/nickcheck.do?nick="+checknick, true);
  	  		xhr.send();
  	  		xhr.onreadystatechange = function(){
  	  			if(this.readyState ==4){
  	  			var obj = this.responseText;
  	  			console.log(obj);
  	  				if(obj==1){
  	  					document.getElementById("nickcheck").innerHTML = "중복된 닉네임이 있습니다.";
  	  					nickok = "";
  	  					document.getElementById("submit").disabled = true;
  	  				}else{
  	  					document.getElementById("nickcheck").innerHTML = "멋진 닉네임입니다.";
  	  					nickok = "ok";
  	  					if (nickok == "ok" && idok == "ok" && passok == "ok"){
  	  				  		document.getElementById("submit").disabled = false;
  	  				  	}else{
  	  				  		document.getElementById("submit").disabled = true;
  	  				  	}
  	  				}	
  	  			}
  	  		}
  		}else{
  			document.getElementById("nickcheck").innerHTML = "닉네임을 입력해주세요.";
  		}
  	};
  	
 
 	
  	document.getElementById("btnId").onclick = function(){
  		var checkid = document.getElementById("id").value;
  		if (checkid != ""){
  			var xhr = new XMLHttpRequest();
  	  		console.log("아이디 : " + checkid);
  	  		xhr.open("get", "/account/idcheck.do?id="+checkid, true);
  	  		xhr.send();
  	  		xhr.onreadystatechange = function(){
  	  			if(this.readyState ==4){
  	  			var obj = this.responseText;
  	  			console.log(obj);
  	  				if(obj==1){
  	  					document.getElementById("idcheck").innerHTML = "중복된 아이디가 있습니다.";
  	  					idok = "";
  	  					document.getElementById("submit").disabled = true;
  	  				}else{
  	  					document.getElementById("idcheck").innerHTML = "멋진 아이디입니다.";
  	  					idok = "ok";
  	  					if (nickok == "ok" && idok == "ok" && passok == "ok"){
  	  				  		document.getElementById("submit").disabled = false;
  	  				  	}else{
  	  				  		document.getElementById("submit").disabled = true;
  	  				  	}
  	  				}
  	  			}
  	  		}
  		}else{
  			document.getElementById("idcheck").innerHTML = "아이디를 입력해주세요.";
  		}
  	};
  	
  

  	</script>