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
  	var check = document.getElementById("id").value;
  	doucument.getElementById("btnId").onclick({
  		var xhr = new XMLHttpRequest();
  		xhr.open("get", "idCheck.do?id="+check, true);
  		xhr.send();
  		xhr.onreadystatechange = function(){
  			if(this.readyState ==4){
  				var obj = this.responseText;
  				if(obj==1){
  					doucument.getElementById("idcheck").innetHTML = "�ߺ��� ���̵� �ֽ��ϴ�.";
  				}else{
  					doucument.getElementById("idcheck").innetHTML = "���� ���̵��Դϴ�.";
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
  					doucument.getElementById("nickcheck").innetHTML = "�ߺ��� �г����� �ֽ��ϴ�.";
  				}else{
  					doucument.getElementById("nickcheck").innetHTML = "���� �г��� �Դϴ�.";
  				}
  			}
  		}	
  	})
  	
   </script>