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
     var checkid = document.getElementById("id").value;
     document.getElementById("btnId").onclick = function() {
        var xhr = new XMLHttpRequest();
        xhr.open("get", "/idcheck.do?id="+checkid, true);
        xhr.send();
        xhr.onreadystatechange = function(){
           if(this.readyState == 4){
              var obj = this.responseText;
              if(obj==1){
                 window.alert("중복된 아이디가 있습니다.");
              }else{
                 window.alert("멋진아이디입니다.")
              }
           }
        }
     }
     var checknick = document.getElementById("nick").value;
     document.getElementById("btnnick").onclick = function() {
        var xhr = new XMLHttpRequest();
        xhr.open("get", "/nickcheck.do?id="+checknick, true);
        xhr.send();
        xhr.onreadystatechange = function(){
           if(this.readyState ==4){
              var obj = this.responseText;
              if(obj==1){
                 window.alert("중복된 닉네임이 있습니다.");
              }else{
                 window.alert("멋진 닉네임입니다.");
              }
           }
        }
     }
     
     
   </script>