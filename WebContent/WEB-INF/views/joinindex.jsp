<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<form  name="regForm" action="join.do" method="post">
   ���̵� <input type="text" name="id" id="id" placeholder="�̸��� �Է��ϼ���." maxlength="10" />  <input type="button" value="ID�ߺ�Ȯ��" id="btnId">
  <p id="idcheck"></p>
   
   ��й�ȣ <input type="password" name="pass" placeholder="��й�ȣ�� �Է��ϼ���." maxlength="20" /><br/>  
   <p></p>
   �г���<input type="text" name="nick" id="nick" placeholder="�г��� �Է��ϼ���." maxlength="10" />  <input type="button" value="�г��� �ߺ�Ȯ��" id="btnnick">
  <p id="nickcheck"></p>    
       
       <button type="submit">ȸ������</button>
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
                 window.alert("�ߺ��� ���̵� �ֽ��ϴ�.");
              }else{
                 window.alert("�������̵��Դϴ�.")
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
                 window.alert("�ߺ��� �г����� �ֽ��ϴ�.");
              }else{
                 window.alert("���� �г����Դϴ�.");
              }
           }
        }
     }
     
     
   </script>