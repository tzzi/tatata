<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
</style>

</head>
<body>
	<div class="w3-container" align="center">
		

		<table class="w3-table-all w3-hoverable"
			style="width: 1000px; margin-left: auto; margin-right: auto; text-align: center">

			<thead>
				<tr class="w3-light-grey" align="center">
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
					<tr>

						<td width=5%>${a.Q_NO}</td>
						<td width=30%><a href="/qnaboard/detail.do?q_no=${a.Q_NO}">${a.TITLE}</a></td>
						<td width=15%>${a.WRITER}</td>
						<td width=10%>${a.LEFT_DATE}</td>
						<td width=10%>${a.COUNT}</td>
						<td width=10%>${a.Q_LIKE }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr />
		<c:if test=""></c:if>
	</div >
	
	<div align="center">
<style>
.button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
</head>


<!-- <button class="button">Click Me</button> -->
<a href="/qnaboard/writeform.do"><button type="submit" class="button">글쓰기</button></a>
	
	</div>
	
	
</body>