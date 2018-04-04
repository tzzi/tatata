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

/* .button {
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
} */
</style>

</head>
<body>

	<div class="w3-container" align="center">
		<header class="w3-container w3-pale-red">
			<h1 style="color: white" align="center">Q N A &nbsp; B O A R D</h1>
		</header>
		<br />

		<table class="w3-table-all w3-hoverable w3-center"
			style="margin-left: auto; margin-right: auto; text-align: center">
			<thead>
				<tr class="w3-light-grey w3-center" align="center">
					<th width="5%" align="center">no</th>
					<th width="50%" align="center">제목</th>
					<th width="10%" align="center">글쓴이(닉네임)</th>
					<th width="10%" align="center">등록일</th>
					<th width="5%" align="center">조회</th>
					<th width="20%" align="center">좋아요</th>
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

		</table>

		<table class="w3-table"
			style="margin-left: auto; margin-right: auto; text-align: center">
			<tr class="w3-right">
				<td>
					<div class="w3-text-theme w3-right">
						<a href="/qnaboard/writeform.do" style="margin-right: 3px"><button
								class="w3-button w3-section w3-theme-l2 w3-ripple" type="submit"
								class="button">글쓰기</button></a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="w3-center">
						<div class="w3-container">
							<div class="w3-bar">
								<c:choose>
									<c:when test="${paging.page gt  1}">
										<a href="/qnaboard/qnaindex2.do?page=${paging.page-1}" class="w3-button">&laquo;</a>
									</c:when>
								</c:choose>


								<c:forEach var="item" items="${paging}"
									begin="${paging.startPage }" end="${paging.endPage }" step="1"
									varStatus="status">
									<c:choose>
										<c:when test="${status.index eq paging.page}">
											<b>[${paging.page }]</b>
										</c:when>
										<c:otherwise>
											<a href="/qnaboard/qnaindex2.do?page=${status.index }" class="w3-button">[${status.index }]</a>

										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:choose>
									<c:when test="${paging.page lt paging.totalPage }">
										<a href="/qnaboard/qnaindex2.do?page=${paging.page+1 }" class="w3-button">&raquo;</a>
									</c:when>
								</c:choose>

								<c:choose>
									<c:when test="${paging.endPage lt paging.totalPage }">
										<a href="/qnaboard/qnaindex2.do?page=${paging.totalPage }" class="w3-button">끝</a>
									</c:when>

								</c:choose>

							</div>
						</div>
					</div>
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
</style>
		<table class="w3-table-all"
			style="margin-left: auto; margin-right: auto; text-align: center">
			<tr class="w3-right">
				<th></th>

			</tr>
		</table> -->
		<hr />
	</div>

</body>