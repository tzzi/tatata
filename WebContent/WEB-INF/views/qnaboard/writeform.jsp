<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">

<div class="w3-container" align="center">
	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">Q N A &nbsp; B O A R D</h1>
	</header>
	<br />
	<div class="w3-container w3-margin-top w3-center" style="width: 600px;">
		<form class="w3-card-4 w3-center" action="/qnaboard/write.do"
			method="post" enctype="multipart/form-data">


			<!-- session에서 가져오는 것으로 대체 -->
			<!--  <p>
<label><h5>NAME</h5></label></p>
<input class="w3-input" type="text" name="writer" style="width:50%" required>
<p>
controller에서 넘김
 -->
			<br/>
			<!-- 글제목 설정 -->
			<div>
				<label><h5>TITLE</h5></label>
			</div>
			<div align="center">
			<input class="w3-input" type="text" name="title" style="width: 300px;"
				required> <br />
			</div>

				<!-- 내용 입력 -->
			<div>
				<label><h5>CONTENT</h5></label>
			</div>
			<div>
			<textarea rows="20" cols="50" name="content"></textarea>
			<br />
			</div>
			<div class="w3-text-theme">
				<button class="w3-button w3-section w3-theme-l2 w3-ripple">
					<b style="color: white">글 등록 </b>
				</button>
			</div>

		</form>
	</div>
</div>