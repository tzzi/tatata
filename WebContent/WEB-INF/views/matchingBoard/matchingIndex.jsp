<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div align="center">
<h1>나의 정보</h1>

아아디 : ${mypage.ID}
<br />
매칭유형 : 
<c:choose>
	<c:when test="${mypage.MATCHTYPE eq 1 }">
	동성	
	</c:when>
	<c:when test="${mypage.MATCHTYPE eq 2 }">
	이성
	</c:when>
	<c:otherwise>
	상관없음
	</c:otherwise>
</c:choose>


<br />
이메일 : ${mypage.EMAIL }
<br/>
담력 : ${mypage.FEAR}
<br />
경고 : ${mypage.YELLOW_CARD}
<br />
자기소개 : ${mypage.INTRO }


<hr />
장바구니
<br />
<c:choose>
	<c:when test="${mybasket.BASKET1 eq null}">
			장바구니에 정보가 없으면 매칭이 되지 않습니다.<br/>
		<a href="/rideboard/list.do"><button type="submit" class="btn btn-primary" style="padding: 8px; font-size: 12pt; width: 200px">놀이기구 보러가기</button></a>	
	</c:when>
	<c:otherwise>
<c:choose>
<c:when test="${mybasket.BASKET1 eq null}">
</c:when>
<c:otherwise>${mybasket.BASKET1}    <button type="submit" class="delete" id="1">목록에서 빼기</button><br/>
</c:otherwise>
</c:choose>

<c:choose>
<c:when test="${mybasket.BASKET2 eq null}">
</c:when>
<c:otherwise>${mybasket.BASKET2}   <button type="submit" class="delete" id="2">목록에서 빼기</button><br/>
</c:otherwise>
</c:choose>

<c:choose>
<c:when test="${mybasket.BASKET3 eq null}">
</c:when>
<c:otherwise>${mybasket.BASKET3}   <button type="submit" class="delete" id="3">목록에서 빼기</button><br/>
</c:otherwise>
</c:choose>

<c:choose>
<c:when test="${mybasket.BASKET4 eq null}">
</c:when>
<c:otherwise>${mybasket.BASKET4}   <button type="submit" class="delete" id="4">목록에서 빼기</button><br/>
</c:otherwise>
</c:choose>

<c:choose>
<c:when test="${mybasket.BASKET5 eq null}">
</c:when>
<c:otherwise>${mybasket.BASKET5}   <button type="submit" class="delete" id="5">목록에서 빼기</button><br/>
</c:otherwise>
</c:choose>


<a href="/rideboard/list.do"><button type="submit">장바구니 추가하기</button></a>

		<hr />
		<form action="/matchingBoard/matching.do" method="post">
			<button type="submit" id="matching">매칭하기</button>
			<input type="hidden" value="${sessionScope.userNick}" name="nick" />
		</form>

	</c:otherwise>
</c:choose>
</div>




<script>
$(".delete").click(function(){
	var id = $(this).attr("id");
	$.ajax("/matchingBoard/delete.do",{
		"method" : "post",
		"async" : false,
		"data": {
			"nick" : "${sessionScope.userNick}",
			"no" : id
		}
	}).done(function(obj){
		if(obj[0].result==1){
			window.alert("장바구니에서 삭제되었습니다.")
		}
	});
});




</script>












