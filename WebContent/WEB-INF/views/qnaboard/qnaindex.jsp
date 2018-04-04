<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">
<!doctype html>
<style>
/* td {
	text-align: center;
}

tr {
	text-align: center;
	height: 30px;

table style="margin-left: auto; margin-right: auto;"

} */
table {
	width: 60%;
	height: 100px;
	margin: auto;
	text-align: center;
}

.button {
	display: inline-block;
	padding: 2px 3px;
	font-size: 18px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #4CAF50;
	border: none;
	border-radius: 15px;
	 	box-shadow: 0 5px #999;
}

.button:hover {
	background-color: #3e8e41
}

.button:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}
</style>

</head>
<body>

	<div class="w3-container" align="center">
		<header class="w3-container w3-pale-red">
			<h1 style="color: white" align="center">Q N A &nbsp; B O A R D</h1>
		</header>
		<br />

		<table class="w3-table-all w3-hoverable"
			style="margin-left: auto; margin-right: auto; text-align: center">

			<thead>
				<tr class="w3-red w3-center" align="center">
					<th>no</th>
					<th>제목</th>
					<th>글쓴이(닉네임)</th>
					<th>등록일</th>
					<th>조회</th>
					<th>좋아요</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${qnalist}" var="a">
					<tr class="w3-center">
						<td width=5%>${a.Q_NO}</td>
						<td width=30%><a href="/qnaboard/detail.do?q_no=${a.Q_NO}">${a.TITLE}</a></td>
						<td width=15%>${a.WRITER}</td>
						<td width=10%>${a.LEFT_DATE}</td>
						<td width=10%>${a.COUNT}</td>
						<td width=10%>${a.Q_LIKE }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tr>
				<td colspan="6" align="right">
					<a href="/qnaboard/writeform.do" style="margin-right: 3px" ><button type="submit"
					class="button">글쓰기</button></a>
				</td>
			</tr>
		</table>
		
		
				
		<!-- <style>
		table {
	height: 15px;
	margin: auto;
	text-align: center;
}
th {
    text-align: center;
  }
		</style> -->
		<!-- <table class="w3-table-all"
			style="margin-left: auto; margin-right: auto; text-align: center">
			<tr class="w3-right" >
				<th>
				
				</th>
			
				</tr>
		</table>-->
		
		<hr/>
		
		
		<!-- <p align="right">
		<button class="button">Click Me</button>
	
		</p> -->
	</div>
	<div class="w3-center">
		<div class="w3-container">
			<div class="w3-bar">
				<a href="#" class="w3-button">«</a> <a href="#"
					class="w3-button w3-green">1</a> <a href="#" class="w3-button">2</a>
				<a href="#" class="w3-button">3</a> <a href="#" class="w3-button">4</a>
				<a href="#" class="w3-button">»</a>
			</div>
		</div>
	</div>
	<br/>



</body>