<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">
<body>

<div class="w3-container" align="center">
	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center"> M A T C H I N G &nbsp; R E S U L T</h1>
	</header>
	<br />
</div>

<div class="w3-container" align="center">
	<div class="w3-container w3-margin-top w3-center" style="width: 600px;">
		<div class="w3-container w3-margin-top w3-center"
				style="width: 550px; height: 700px">
				<form class="w3-card-4 w3-center">
					<br/>
					당신의 매칭 상대는<br/>
					<c:choose>
						<c:when test="${matching.NICK eq null }">
						같은 놀이기구를 선택한 사람이 없습니다.<br/>
						놀이기구를 다시 선택해주시거나
						담력이 비슷한 사람끼리 매칭 하시겠습니까?<br/>
						<form action="/matchingBoard/matching2.do">
							<button type="submit" class="w3-button w3-section w3-theme-l2 w3-ripple" 
							style="padding: 8px; font-size: 12pt; width: 100px;"
							id="matching">담력이 비슷한 사람끼리 매칭</button>
							<input type="hidden" value="${mypage.NICK }"/>
						</form>
						
						</c:when>
						<c:otherwise>
					<p>
					${matching.NICK }님  입니다.<br/>
					</p>
					 <a href="/matchingBoard/matchingcheck.do">
					 <button type="button" class="w3-button w3-section w3-theme-l2 w3-ripple"
					style="padding: 8px; font-size: 12pt; width: 100px;">나의 매칭</button></a>
					<!-- <p>
					<br/>
					<a href="/matchingBoard/matchingcheck.do"><input type="submit">나의 매칭</input></a>
					</p> -->
						</c:otherwise>
					</c:choose>
			</form>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$.ajax("/matchingBoard/insertmatching.do",{
			"method" : "post",
			"async" : false,
			"data":{
				"matchingnick" : "${matching.NICK}",
				"fear" : ${matching.FEAR},
				"yellow_card" : ${matching.YELLOW_CARD},
				"gender" : "${matching.GENDER}",
				"mynick" : "${sessionScope.userNick}",
				"email" : "${matching.EMAIL}",
				"overlap" : "${matching.NICK}${sessionScope.userNick}"
			}
		}).done(function(obj){
	         //0(실패) or 1(성공)
	         if(obj[0].result==1){
	        	window.alert("매칭에 성공하셨습니다.")
	         }else if(obj[0].result==2){
	        	 window.alert("이미 같은 사람과 매칭 되었습니다 .(f5 그만 눌러!!!)")
	         }else{
	        	 window.alert("알수없는 이유로 매칭에 싱패하셨습니다.")
	         }
	    });

	});
</script>
</body>