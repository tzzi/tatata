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
			<input type="hidden" value="${mypage.NICK }" name="nick" />
		</form>
	
	</c:when>
	<c:otherwise>
${matching.NICK }님  입니다.	
<script>
	$(document).ready(function(){
		$.ajax("/matchingBoard/insertmatching.do",{
			"method" : "post",
			"async" : false,
			"data":{
				"nick" : "${matching.NICK}",
				"fear" : ${matching.FEAR},
				"yellow_card" : ${matching.YELLOW_CARD},
				"gender" : "${matching.GENDER}",
				"mynick" : "${mypage.NICK}",
				"e_mail" : "${matching.E_MAIL}"
			}
		}).done(function(obj){
	         //0(실패) or 1(성공)
	         if(obj[0].result==1){
	        	window.alert("매칭에 성공하셨습니다.")
	         }else{
	        	 window.alert("알 수 없는 오류로 매칭에  실패하셧습니다.")
	         }
	    });

	});


</script>

	</c:otherwise>
	
</c:choose>

</body>
</html>