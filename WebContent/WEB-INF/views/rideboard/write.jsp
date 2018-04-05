<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

<header class="w3-container w3-pale-red w3-center">
  <h1 style="color: white">REGISTER RIDES</h1>
</header>

<div class="w3-container w3-margin-top" align="center">

<form  class="w3-card-4"action="/rideboard/complete.do " method="post"
      enctype="multipart/form-data">

<p>
<input class="w3-input" type="text" name="ride_name" style="width:50%" required>
<label><h5>RIDE NAME</h5></label></p>
<p>
<p>
<input class="w3-input" type="text" name="content" style="width:80%" required>
<label><h5>CONTENT</h5></label></p>
<br/>
<p>
<small  style="font-size: 20px">운영시간</small>&nbsp;&nbsp;
         <select name="time"
            style="padding: 12px; font-size: 12pt; min-height: 5;outline: none;"  
            class="authsuccess" >
            <option>09:00 ~ 18:00</option>
            <option>10:00 ~ 19:00</option>
            <option>10:00 ~ 20:00</option>
            <option>13:00 ~ 22:00</option>
         </select>&nbsp;&nbsp;
         
         <small  style="font-size: 20px">키</small>&nbsp;&nbsp;
         <select name="limit"
            style="padding: 12px; font-size: 12pt; min-height: 5;outline: none;"  
            class="authsuccess" >
            <option>80cm ~</option>
            <option>90cm ~</option>
            <option>100cm ~</option>
            <option>110cm ~</option>
            <option>120cm ~</option>
            <option>130cm ~</option>
            <option>140cm ~</option>
            <option>150cm ~</option>
         </select>&nbsp;&nbsp;
          <small  style="font-size: 20px">이용요금</small>&nbsp;&nbsp;
         <select name="price"
            style="padding: 12px; font-size: 12pt; min-height: 5;outline: none;"  
            class="authsuccess" >
            <option> ~ 3000원</option>
            <option> ~ 4000원</option>
            <option> ~ 5000원</option>
            <option> ~ 6000원</option>
            <option> ~ 7000원</option>
            <option> ~ 8000원</option>
            <option> ~ 9000원</option>
            <option> ~ 10000원</option>
         </select>&nbsp;&nbsp;
         <br/><br/>
<small  style="font-size: 20px">놀이공원</small>&nbsp;&nbsp;
         <select name="park_name"
            style="padding: 12px; font-size: 12pt; min-height: 5;outline: none;"  
            class="authsuccess" >
            <option>선    택</option>
            <option >롯데월드</option>
            <option>에버랜드</option>
            <option>서울랜드</option>
            <option>경주랜드</option>
            <option>e월드</option>
         </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <small  style="font-size: 20px">타  입</small>&nbsp;&nbsp;
         <select name="type"
            style="padding: 12px; font-size: 12pt; width: 120px; height: 50px;"  
            class="authsuccess" >
            <option>선 택</option>
            <option>스릴</option>
            <option>연애</option>
            <option>어린이</option>
         </select>&nbsp;&nbsp;&nbsp;&nbsp;
         </p>
         <div>
         <img src="" style="width: 350px; height: 300px; border-radius: 30px;"
            id="preview" />
      </div>
      <input type="file" name="file" id="photo" style="display: none;" />
<p>
<button class="w3-button w3-section w3-pale-red w3-ripple"><b style="color: white"> 등  록 </b></button></p>
</form>
</div>
</body>
<script>
   document.getElementById("photo").onchange = function() {
      console.log(this.files[0]); // 사용자가 파일 객체가 나오게 됨.
      if (!this.files[0].type.startsWith("image")) {
         window.alert("이미지 파일만 선택가능합니다.");
         return;
      }
      // 미리   보기 를 구현할려면.. XMLHttpRequest 객체 같이..
      var reader = new FileReader();
      reader.readAsDataURL(this.files[0]);
      // console.log(reader);
      reader.onload = function() { // readAsDataURL 이 끝나면 발생하는 이벤트
         document.getElementById("preview").src = this.result;
      }
   }
   document.getElementById("preview").onclick = function() {
      document.getElementById("photo").click();
   };
</script>
</html> 