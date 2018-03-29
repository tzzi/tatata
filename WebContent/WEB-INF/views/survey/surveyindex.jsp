<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 


<div class="w3-container">

	<header class="w3-container w3-pale-red">
	  <h1 style="color: white" align="center">매칭 후기 설문조사</h1>
	</header>


 
  <div class="w3-display-container" style="height:50%;">
    <div class="w3-display-middle w3-padding">
   	 
 		<div class="w3-container w3-margin-top" align="center" style="width:500px;">
 		<form  class="w3-card-4" action="" method="post"
		enctype="multipart/form-data"> 

			<!-- <!-- 글제목 설정 -->
			<p>
			<label><h5>TITLE</h5></label></p>
			<input class="w3-input" type="text" name="title" style="width:60%" required>
			<br/>
			<p>
	
			내용 입력
			<p>
			<label><h5>CONTENT</h5></label></p> 
			<textarea rows="10" cols="100" name="content"></textarea>
			<br/>
			<p>
			<textarea rows="5" cols="40" name="content"></textarea> -->

			<a href="/survey/survey.do"><button type="button" class="w3-button w3-section w3-pale-red w3-ripple"><b style="color: white">설문조사 하러가기</b></button></a>
			<a href=""><button type="button" class="w3-button w3-section w3-pale-red w3-ripple"><b style="color: white">설문조사 결과보기</b></button></a>
			</p>

		</form>
 </div>


	</div>
  </div>
</div>
 