<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:forEach items="${qnadetail}" var="a">
    글제목   :  ${a.TITLE}<br/>
    글내용  :  ${a.CONTENT}<br/>
    조회수  :  ${a.COUNT}<br/>
     
</c:forEach>
<hr/>
<div>
		<table style="width: 700px; margin-top: 30px; margin-left: 30px;">
			<thead>
				<tr style="background-color: black; color: white">
					<th style="width: 50px;">no</th>
					<th style="width: 150px;">내용</th>
					<th style="width: 150px;">작성자</th>
					<th style="width: 150px;">작성 날짜</th>
					<th style="width: 150px;">조회수</th>


				</tr>

			</thead>
			<tbody>
				<c:forEach items="${qnadetaillist}" var="a">
					<tr>
						<td width=5%>${a.A_NO}</td>
					<td width=30%>${a.CONTENT}</td>
						<td width=15%>${a.ADMIN}</td>
						<td width=10%>${a.LEFT_DATE}</td>
						<td width=10%>${a.COUNT}</td>
						
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
<hr/>

<form action="/qnaboard/detailwrite.do">
<input type="text" name="content" placeholder="내용을 입력해주세요" id="content" required="required"><br/>

<button type="submit" id="write">댓글달기</button>
</form>

<!-- 

<script>
document.getElementById("write").onclick = function(){
	var writer = document.getElementById("writer").value;
	var content = document.getElementById("content").value;
	
	var xhr = new XMLHttpRequest();
	xhr.open("get", "/qnaboard/detailwrite.do?writer="+writer+"content="+content, true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(this.readyState ==4){
			var obj = this.responseTest;
			if(obj==1){
				window.alert("리플이 성공적으로 등록되었습니다.");
				
			}
		}
	}
}



</script> -->