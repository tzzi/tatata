<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
	box-sizing: border-box;
}

.header {
	/*     border: 1px solid red; */
	padding: 15px;
}

.row::after {
	content: "";
	clear: both;
	display: table;
}

[class*="col-"] {
	float: left;
	padding: 15px;
	/*     border: 1px solid red; */
}

[class*="colo-"] {
	float: right;
	padding: 15px;
	/*     border: 1px solid red; */
}

.col-1 {
	width: 8.33%;
}

.col-2 {
	width: 16.66%;
}

.col-3 {
	width: 25%;
}

.colo-4 {
	width: 50%;
}

.col-5 {
	width: 41.66%;
}

.col-6 {
	width: 50%;
}

.colo-7 {
	width: 23%;
}

.cool-8 {
	width: 13.33%;
}

.col-9 {
	width: 75%;
}

.col-10 {
	width: 83.33%;
}

.col-11 {
	width: 91.66%;
}

.col-12 {
	width: 100%;
}
</style>

<title>${qnadetail.TITLE}</title>
<style>
#rcorners2 {
	border-radius: 25px;
	border: 2px solid #73AD21;
	padding: 20px;
	width: 500px;
	height: 600px;
	align-self: center
}

#rcorners1 {
	width: 450px;
	height: 100px;
	color: red;
	align-self: center;
	font-size: 40px;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<div class="w3-container" align="center">
	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">Q N A &nbsp; B O A R D</h1>
	</header>
	<br />
</div>

<div class="w3-row-padding w3-content" style="max-width: 1400px">

	<div class="col-6">
		<div class="w3-container w3-margin-top w3-center"
			style="width: 550px; height: 700px">
			<form class="w3-card-4 w3-center">

				<!-- 글제목 설정 -->
				<div>
					<br /> <label><h4>T I T L E</h4></label>
				</div>
				<div align="center">
					<input class="w3-input" type="text" value="${qnadetail.TITLE}"
						style="width: 300px;" disabled> <br />
				</div>
				<div align="right">
					조 회 수 : ${qnadetail.COUNT} &nbsp;&nbsp;&nbsp;&nbsp;<span
						class="fa fa-thumbs-up button" id="like">&nbsp;${qnadetail.Q_LIKE }</span>&nbsp;&nbsp;&nbsp;
				</div>
				<!-- 내용 입력 -->
				<div>
					<label><h4>C O N T E N T</h4></label>
				</div>
				<div>
					<textarea rows="20" cols="50" disabled>${qnadetail.CONTENT}</textarea>
					<br />
				</div>
				<br />
			</form>
		</div>
	</div>
	<div class="colo-4">
		<div class="w3-container w3-margin-top w3-center"
			style="width: 550px; height: 700px">
			<form class="w3-card-4 w3-center">
				<div class="w3-left">
					<div>
						<br /> <label><h4>C O M M E N T</h4></label>
					</div>
					<p class="w3-justify w3-left">

						<div class="w3-left" align="left" id="rsc"
						style="overflow: scroll; width: 510px; height: 480px; padding: 20px;"><c:forEach items="${qnadetaillist }" var="a">
							<c:choose>
								<c:when test="${gender eq 1 }">
									<img src="/image/man.png" height="50" width="50">
								</c:when>
								<c:when test="${gender eq 2 }">
									<img src="/image/woman.png" height="50" width="50">
								</c:when>
								<c:otherwise>
									<img src="/image/default.png" height="50" width="50">
								</c:otherwise>
							</c:choose>
					${a.ADMIN} : ${a.CONTENT} <br />
						</c:forEach>
					</div>
					</p>
				</div>
				<br />
				<div>
					<div class="w3-text-theme">
						<table align="center">
							<tr>
								<td>
									<textarea class="w3-text" id="content" name="ment"
							style="width: 400px; padding: 3px; height: 80px;"></textarea>
								</td>
								<td>&nbsp;&nbsp;</td>
								<td>
									<button type="button" id="b1"
									class="w3-button w3-section w3-theme-l2 w3-ripple"
									style="width: 51px; padding: 3px; height: 80;">
									<b>작성</b>
									</button>
								</td>
							</tr>
						</table>
					</div>
					<br />
				</div>
			</form>
		</div>
	</div>
</div>
<div class="colo-7">
<c:choose>
	<c:when test="${qnadetail.WRITER eq userNick}">
	<form action="/qnaboard/modified.do">
	<button type="submit" id="modified">수정</button>
	<button type="button" id="delete1">삭제</button>
	<input type=hidden name = "q_no" value="${qnadetail.Q_NO }">
	<input type=hidden name = "title" value="${qnadetail.TITLE }">
	<input type=hidden name = "content" value="${qnadetail.CONTENT }">
	</form>
	</c:when>
	</c:choose>
	</div>
<hr />
<div align="center">

	<!--  버튼 색깔
.button1 {background-color: #4CAF50;} /* Green */
.button2 {background-color: #008CBA;} /* Blue */
.button3 {background-color: #f44336;} /* Red */ 
.button4 {background-color: #e7e7e7; color: black;} /* Gray */ 
.button5 {background-color: #555555;} /* Black */ 

${sessionScope.userId}${qnadetail.Q_NO}

-->

	<c:choose>
		<c:when test="${likecheck.BOARDLIKE eq null}">
			<style>
.button {
	display: inline-block;
	padding: 5px 9px;
	font-size: 24px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #555555;
	border: none;
	border-radius: 15px;
	box-shadow: 0 9px #999;
}

.button:hover {
	background-color: #555555
}

.button:active {
	background-color: #555555;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}
</style>
		</c:when>
		<c:otherwise>
			<style>
.button {
	display: inline-block;
	padding: 5px 9px;
	font-size: 24px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #f44336;
	border: none;
	border-radius: 15px;
	box-shadow: 0 9px #999;
}

.button:hover {
	background-color: #f44336
}

.button:active {
	background-color: #f44336;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}
</style>
		</c:otherwise>
	</c:choose>


	<!-- <button type="submit" class="button" id="like">글 추천!!</button> -->

</div>
<br />
<br />


<!-- 
<div align="center" style="width: 70%; margin-top: 10px;">
	<textarea id="content"
		style="width: 80%; font-size: small; resize: none;"></textarea>
	<br />
	<button style="width: 81%;" id="b1">
		<small>댓글 남기기</small>
	</button>
</div> -->
<script>
	$("#b1").click(function() {
		$.ajax("/qnaboard/detailwrite.do",{
			"method" : "post",		// 설정안하면 get
			"async" : true,		// 설정안하면 true
			"data": {
				"q_no" : ${qnadetail.Q_NO},
				"content" : $("#content").val()
			}
		}).done(function(obj){
	         //0(실패) or 1(성공)
	         if(obj[0].result==1){
	        	window.alert("글 등록에 성공하셨습니다.")
	         }else{
	        	 window.alert("글 등록에 실패하셧습니다.")
	         }
	    });
		$("#content").val("");
		location.reload();
	});

	$("#like").click(function(){
		$.ajax("/qnaboard/overlap.do",{
			"method" : "post",
			"async": false,
			"data":{
				"overlap" : "${sessionScope.userId}${qnadetail.Q_NO}"
			}
		}).done(function(obj){
			if(obj[0].result==1){
				$.ajax("/qnaboard/addlike.do",{
				"method" : "post",
				"async" : false,
				"data":{
					"q_no" : ${qnadetail.Q_NO}
				}
				}).done(function(obj){
					if(obj[0].result==1){
						window.alert("추천 되었습니다.")
					}else{
						window.alert("알 수 없는 이유로 추천에 실패하셨습니다.")
					}
				});
			}else{
				$.ajax("/qnaboard/likecancel.do",{
					"method":"post",
					"async" : false,
					"data":{
						"q_no" : ${qnadetail.Q_NO}
					}
				}).done(function(obj){
					if(obj[0].result==1){
						window.alert("추천이 취소되었습니다.")
					}else{
						window.alert("알 수없는 이유로 추천취소에 실패하셨습니다.")
					}
				});
			}
		});
		location.reload();
	});
	
	$("#delete1").click(function(){
		window.alert("삭제 버튼 누름")
		$.ajax("/qnaboard/Postsdelte.do",{
			"method" : "post",
			"data":{
				"q_no" : ${qnadetail.Q_NO}
			}
		}).done(function(obj){
			if(obj[0].result==1){
				window.alert("글이 삭제되었습니다.")
			}else{
				window.alert("알 수없는 이유로 글 삭제에 실패하셨습니다.")
			}
			location.href="/qnaboard/qnaindex.do";
		});
	});
	
	
	
	
	
	
</script>