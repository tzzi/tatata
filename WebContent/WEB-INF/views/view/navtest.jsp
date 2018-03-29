<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- <style type="text/css">
	.font {
	font-family : '굴림'
	}
</style> -->
<link rel="stylesheet" href="/WEB-INF/views/view/style.css">
<div class="w3-container">
	<br>
	<div class="w3-row">
		<div class="w3-col l3 w3-white">
			<div class="w3-bar" align="left" style="text-align: left;">
				<a href="/index.do" style="text-decoration: none;"> <img
					src="/start/logo.jpg" alt="Tatata" height="72.23" width="150"></a>
			</div>
		</div>
		<div class="font-face w3-col l9 w3-white w3-right-align">
			<c:choose>
				<c:when test="${empty sessionScope.auth }">
					<a href="/join/joinindex.do"
						class="font w3-bar-item w3-button w3-hover-none w3-border-white w3-bottombar w3-hover-border-blue w3-hover-text-blue">
						회원가입 </a>
					<a href="/login/loginindex.do"
						class="w3-bar-item w3-button w3-hover-none w3-border-white w3-bottombar w3-hover-border-blue w3-hover-text-blue">
						로그인</a>
				</c:when>
				<c:otherwise>
					<c:choose>
					<c:when test="${gender eq 1 }">
						<img src="/image/man.png" height="50" width="50">
					</c:when>
					<c:when test="${gender eq 2 }">
						<img src="/image/woman.png"  height="50" width="50">
					</c:when>
					<c:otherwise>
						<img src="/image/default.png"  height="50" width="50">
					</c:otherwise>
					</c:choose>
					&nbsp;<b>${userId }</b>&nbsp;
					<a href="/rideboard/list.do"
						class="w3-bar-item w3-button w3-hover-none w3-border-white w3-bottombar w3-hover-border-blue w3-hover-text-blue">
						놀이공원 정보 게시판</a>
					<a href="/qnaboard/qnaindex.do"
						class="w3-bar-item w3-button w3-hover-none w3-border-white w3-bottombar w3-hover-border-blue w3-hover-text-blue">
						Q&A게시판</a>
					<a href="/matchingBoard/matchingIndex.do"
						class="w3-bar-item w3-button w3-hover-none w3-border-white w3-bottombar w3-hover-border-blue w3-hover-text-blue">
						매칭보드</a>
					<a href="/survey/surveyindex.do"
						class="w3-bar-item w3-button w3-hover-none w3-border-white w3-bottombar w3-hover-border-blue w3-hover-text-blue">
						매칭후기</a>
					<a href="/mypage/mypageindex.do"
						class="w3-bar-item w3-button w3-hover-none w3-border-white w3-bottombar w3-hover-border-blue w3-hover-text-blue">
						마이페이지</a>
					<a href="/login/logout.do"
						class="w3-bar-item w3-button w3-hover-none w3-border-white w3-bottombar w3-hover-border-blue w3-hover-text-blue">
						로그아웃</a>
				</c:otherwise>
			</c:choose>

		</div>
	</div>


	<br>

</div>
