<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<form  name="regForm" action="join.do" method="post">
   아이디 <input type="text" name="id" id="id" placeholder="이름을 입력하세요." maxlength="10" />  <input type="button" value="ID중복확인" id="btnId">
  <p id="idcheck"></p>
   
   비밀번호 <input type="password" name="pass" placeholder="비밀번호를 입력하세요." maxlength="20" /><br/>  
   <p></p>
   닉네임<input type="text" name="nick" id="nick" placeholder="닉네임 입력하세요." maxlength="10" />  <input type="button" value="닉네임 중복확인" id="btnnick">
  <p id="nickcheck"></p>    
       
       <button type="submit">회원가입</button>
    </form>

   <script>
  	var check = document.getElementById("id").value;
  	doucument.getElementById("btnId").onclick({
  		var xhr = new XMLHttpRequest();
  		xhr.open("get", "idCheck.do?id="+check, true);
  		xhr.send();
  		xhr.onreadystatechange = function(){
  			if(this.readyState ==4){
  				var obj = this.responseText;
  				if(obj==1){
  					doucument.getElementById("idcheck").innetHTML = "중복된 아이디가 있습니다.";
  				}else{
  					doucument.getElementById("idcheck").innetHTML = "멋진 아이디입니다.";
  				}
  			}
  		}
  	})
  
  	var check = document.getElementById("nick").value;
  	doucument.getElementById("btnnick").onclick({
  		var xhr = new XMLHttpRequest();
  		xhr.open("get", "nickCheck.do?id="+check, true);
  		xhr.send();
  		xhr.onreadystatechange = function(){
  			if(this.readyState ==4){
  				var obj = this.responseText;
  				if(obj==1){
  					doucument.getElementById("nickcheck").innetHTML = "중복된 닉네임이 있습니다.";
  				}else{
  					doucument.getElementById("nickcheck").innetHTML = "멋진 닉네임 입니다.";
  				}
  			}
  		}	
  	})
  	
   </script>