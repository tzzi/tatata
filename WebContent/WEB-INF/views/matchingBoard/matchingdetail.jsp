<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
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
	width: 33.33%;
}

.col-5 {
	width: 41.66%;
}

.col-6 {
	width: 50%;
}

.colo-7 {
	width: 20%;
}

.colo-8 {
	width: 13.33%;
}

.col-9 {
	width:33%;
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

<title>${matchingdetail.TITLE}</title>
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
<div class="w3-light-grey w3-padding-24 w3-margin-bottom w3-center">
	<div class="header"></div>
</div>
<div class="w3-row-padding w3-content" style="max-width: 1400px">

	<div class="col-6">
		<div class="w3-twothird"></div>
		<div id="rcorners2">

			<p id="rcorners1" align="center">
				${matchingdetail.TITLE}<br />
			</p>
			${matchingdetail.CONTENT}
		</div>
		<hr />
	</div>
	<div class="col-4">
		<div class="w3-container w3-light-grey">
			<h2>
				조회수
				:&nbsp;${matchingdetail.COUNT}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="fa fa-thumbs-up w3-xxlarge button" id="like">&nbsp;${matchingdetail.M_LIKE }</span>
			</h2>
		</div>

		<br />


		<div class="w3-container w3-light-grey w3-justify">
			<h2>실시간  리뷰</h2>
			<p class="w3-justify">
			<div id="rsc"
				style="overflow: scroll; width: 451px; height: 200px; padding: 10px;">
				<c:forEach items="${matchingdetaillist }" var="a">
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
	</div>
	<div class="col-4">
		<textarea id="content" name="ment"
			style="width: 400px; padding: 3px; height: 80px;"></textarea>
		<button type="button" id="b1"
			style="width: 51px; padding: 3px; height: 80;">
			<b>작성</b>
		</button>
		<br />
	</div>
	
	<div class="col-9">
	<c:choose>
	<c:when test="${matchingdetail.WRITER eq userNick}">
	<form action="/matchingBoard/modified.do">
	<button type="button" id="delete">삭제</button>
	<button type="submit" id="modified">수정</button>
	<input type=hidden name = "m_no" value="${matchingdetail.M_NO }">
	<input type=hidden name = "title" value="${matchingdetail.TITLE }">
	<input type=hidden name = "content" value="${matchingdetail.CONTENT }">
	</form>
	</c:when>
	</c:choose>
	</div>
	
</div>
<hr />
<div align="center">

	<!--  버튼 색깔
.button1 {background-color: #4CAF50;} /* Green */
.button2 {background-color: #008CBA;} /* Blue */
.button3 {background-color: #f44336;} /* Red */ 
.button4 {background-color: #e7e7e7; color: black;} /* Gray */ 
.button5 {background-color: #555555;} /* Black */ 

${sessionScope.userId}${matchingdetail.M_NO}

-->

	<c:choose>
		<c:when test="${likecheck.MATCHINGLIKE eq null}">
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
</div>
<br />
<br />
<script>
	$("#b1").click(function() {
		$.ajax("/matchingBoard/detailwrite.do",{
			"method" : "post",		// 설정안하면 get
			"async" : true,		// 설정안하면 true
			"data": {
				"m_no" : ${matchingdetail.M_NO},
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
		$.ajax("/matchingBoard/overlap.do",{
			"method" : "post",
			"async": true,
			"data":{
				"overlap" : "${sessionScope.userId}${matchingdetail.M_NO}"
			}
		}).done(function(obj){
			if(obj[0].result==1){
				$.ajax("/matchingBoard/addlike.do",{
				"method" : "post",
				"async" : true,
				"data":{
					"m_no" : ${matchingdetail.M_NO}
				}
				}).done(function(obj){
					if(obj[0].result==1){
						window.alert("추천 되었습니다.")
					}else{
						window.alert("알 수 없는 이유로 추천에 실패하셨습니다.")
					}
				});
			}else{
				$.ajax("/matchingBoard/likecancel.do",{
					"method":"post",
					"async" : true,
					"data":{
						"m_no" : ${matchingdetail.M_NO}
					}
				}).done(function(obj){
					if(obj[0].result==1){
						window.alert("추천이 취소되었습니다.")
					}else{
						window.alert("알 수없는 이유로 추천취소에 실패하셨습니다.")
					}
				});
			}
			location.reload();
		});
	
	});
	
	$("#delete").click(function(){
		window.alert("삭제 버튼 누름")
		$.ajax("/matchingBoard/Postsdelte.do",{
			"method" : "post",
			"data":{
				"m_no" : ${matchingdetail.M_NO}
			}
		}).done(function(obj){
			if(obj[0].result==1){
				window.alert("글이 삭제되었습니다.")
			}else{
				window.alert("알 수없는 이유로 글 삭제에 실패하셨습니다.")
			}
			location.href="/matchingBoard/matchingreview.do";
		});
	});
	
	
	
	
</script>