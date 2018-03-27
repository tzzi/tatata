<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
td {
	text-align: center;
}

tr {
	height: 30px;
}
</style>
</head>
<body>
	<div>
		<table style="width: 700px; margin-top: 30px; margin-left: 30px;">
			<thead>
				<tr style="background-color: black; color: white">
					<th style="width: 50px;">no</th>
					<th style="width: 150px;">제목</th>
					<th style="width: 150px;">작성자</th>
					<th style="width: 150px;">작성 날짜</th>
					<th style="width: 150px;">조회수</th>


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
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr />
	</div>
<a href="/qnaboard/writeform.do"><button type="submit">글쓰기</button></a>
</body>