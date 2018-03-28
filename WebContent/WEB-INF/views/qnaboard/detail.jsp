<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
글제목 : ${qnadetail.TITLE}
<br />
글내용 : ${qnadetail.CONTENT}
<br />
조회수 : ${qnadetail.COUNT}
<br />
추천수 : ${qnadetail.Q_LIKE }
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<hr />
<div>
	<table style="width: 700px; margin-top: 30px; margin-left: 30px;">
		<thead>
			<tr style="background-color: black; color: white">
				<th style="width: 50px;">no</th>
				<th style="width: 150px;">내용</th>
				<th style="width: 150px;">작성자</th>
				<th style="width: 150px;">작성 날짜</th>
			<!-- 추천 미구현 -->	<th style="width: 150px;">추천수</th>


			</tr>

		</thead>
		<tbody>
			<c:forEach items="${qnadetaillist}" var="a">
				<tr>
					<td width=5%>${a.A_NO}</td>
					<td width=30%>${a.CONTENT}</td>
					<td width=15%>${a.ADMIN}</td>
					<td width=10%>${a.LEFT_DATE}</td>
					<td width=10%>${a.COUNT}</td><!-- 추천 -->

				</tr>
			</c:forEach>

		</tbody>
	</table>
</div>
<hr />
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
<button type="submit" class="button" id="like">추천!!</button>

</div>




<div align="center" style="width: 70%; margin-top: 10px;">
	<textarea id="content"
		style="width: 80%; font-size: small; resize: none;"></textarea>
	<br />
	<button style="width: 81%;" id="b1">
		<small>댓글 남기기</small>
	</button>


</div>
<script>
	$("#b1").click(function() {
		$.ajax("/qnaboard/detailwrite.do",{
			"method" : "post",		// 설정안하면 get
			"async" : false,		// 설정안하면 true
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
		window.alert("시작")
		$.ajax("/qnaboard/addlike.do",{
			"method" : "post",
			"async": false,
			"data":{
				"q_no" : ${qnadetail.Q_NO}
			}
		}).done(function(obj){
			if(obj[0].result==1){
				window.alert("추천 되었습니다.")
			}else{
				window.alert("추천을 하루에 두번 이상 할 수 없습니다.")
			}
		});
		location.reload();
	});
	
	
	
	
</script>