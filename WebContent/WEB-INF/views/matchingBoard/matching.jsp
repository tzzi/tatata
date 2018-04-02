<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
당신의 매칭 상대는<br/>
<c:choose>
	<c:when test="${matching.NICK eq null }">
	같은 놀이기구를 선택한 사람이 없습니다.<br/>
	놀이기구를 다시 선택해주시거나
	담력이 비슷 한 사람끼리 매칭 하시겠습니까?<br/>
	<form action="/matchingBoard/matching2.do">
			<button type="submit" id="matching">담력이 비슷한 사람끼리 매칭</button>
			<input type="hidden" value="${mypage.NICK }"/>
		</form>
	
	</c:when>
	<c:otherwise>
<p>
${matching.NICK }님  입니다.<br/>
</p>
 <a href="/matchingBoard//matchingcheck.do"><button type="submit"
						class="btn btn-primary"
						style="padding: 8px; font-size: 12pt; width: 200px">나의 매칭</button></a>
<p>
<br/>
<!-- <a href="/matchingBoard/matchingcheck.do"><input type="submit">나의 매칭</input></a> -->
</p>
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

	</c:otherwise>
	
</c:choose>

</body>
</html>