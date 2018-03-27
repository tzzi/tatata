<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h1>나의 정보</h1>

닉네임 : ${mypage.NICK}
<br />
매칭유형 : ${mypage.G_MATCH}
<br />
담력 : ${mypage.FEAR}
<br />
경고 : ${mypage.YELLOW_CARD}
<br />

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
		<form action="/matchingBoard/matching.do">
			<button type="submit" id="matching">매칭하기</button>
			<input type="hidden" value="${mypage.NICK }" name="nick" />
		</form>

	</c:otherwise>
</c:choose>
