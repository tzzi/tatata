<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    놀이기구 타입으로 찾아낸 너의 상대<br/>
<c:choose>
<c:when test="${matching2.NICK eq null}">
죄송합니다. 매칭 상대를 찾을 수 없습니다.
</c:when>
<c:otherwise>
${matching2.NICK}님이 매칭 되었습니다.
<p>
 <a href="/matchingBoard//matchingcheck.do"><button type="submit"
						class="btn btn-primary"
						style="padding: 8px; font-size: 12pt; width: 200px">나의 매칭</button></a>
	</p>					

</c:otherwise>


</c:choose>


<script>
	$(document).ready(function(){
		$.ajax("/matchingBoard/insertmatching.do",{
			"method" : "post",
			"async" : false,
			"data":{
				"matchingnick" : "${matching2.NICK}",
				"fear" : ${matching2.FEAR},
				"yellow_card" : ${matching2.YELLOW_CARD},
				"gender" : "${matching2.GENDER}",
				"mynick" : "${sessionScope.userNick}",
				"email" : "${matching2.EMAIL}",
				"overlap" : "${matching2.NICK}${sessionScope.userNick}"
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