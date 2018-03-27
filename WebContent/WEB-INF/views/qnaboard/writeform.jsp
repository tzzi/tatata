<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
 
<header class="w3-container w3-pale-red">
  <h1 style="color: white" align="center">글 등록</h1>
</header>
 <div class="w3-container w3-margin-top" align="center">
 <form  class="w3-card-4"action="/qnaboard/write.do" method="post"
		enctype="multipart/form-data">
 

<!-- session에서 가져오는 것으로 대체 -->
 <p>
<label><h5>NAME</h5></label></p>
<input class="w3-input" type="text" name="writer" style="width:50%" required>
<p>


<!-- 글제목 설정 -->
<p>
<label><h5>TITLE</h5></label></p>
<input class="w3-input" type="text" name="title" style="width:60%" required>
<br/>
<p>

<!-- 내용 입력 -->
<p>
<label><h5>CONTENT</h5></label></p>
<textarea rows="10" cols="100" name="content"></textarea>
<br/>
<p>


<button class="w3-button w3-section w3-pale-red w3-ripple"><b style="color: white">글 등록 </b></button></p>

</form>
</div>