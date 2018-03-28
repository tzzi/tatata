<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
이메일 : ${mypage.E_MAIL }
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
	<c:when test="${mypage.BASKET1 eq null}">
			장바구니에 정보가 없으면 매칭이 되지 않습니다.
	</c:when>
	<c:otherwise>
	${mypage.BASKET1}<br />
${mypage.BASKET2}<br />
${mypage.BASKET3}<br />
${mypage.BASKET4}<br />
${mypage.BASKET5}<br />
		<hr />
		<form action="/matchingBoard/matching.do" method="post">
			<button type="submit" id="matching">매칭하기</button>
			<input type="hidden" value="${mypage.NICK }" name="nick" />
		</form>

	</c:otherwise>
</c:choose>
