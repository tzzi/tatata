<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="w3-container">

	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">STATISTICS</h1>
	</header>

	<div class="w3-row w3-center">
		<div class="w3-col w3-container">
			<div class="w3-container w3-margin-top" style="width: 800px;">
				<form class="w3-card-4">
				<p>
					<h3>사는 지역 TOP3</h3>
					1위 : ${area_1 }<br/>
					2위 : ${area_2 }<br/>
					3위 : ${area_3 }<br/>
				</p>
				<p>
					<h3>성별 비율</h3>
					남자 : <fmt:formatNumber value="${man_rate }" pattern="##.##" />%<br/>
					여자 : <fmt:formatNumber value="${woman_rate }" pattern="##.##" />%<br/>
				</p>
				<p>	
					<h3>담력도 비율</h3>
					고수 : <fmt:formatNumber value="${fear_1_rate }" pattern="##.##" />%<br/>
					중수 : <fmt:formatNumber value="${fear_2_rate }" pattern="##.##" />%<br/>
					하수 : <fmt:formatNumber value="${fear_3_rate }" pattern="##.##" />%<br/>
				</p>
				<p>
					<h3>매칭유형 비율</h3>
					동성 : <fmt:formatNumber value="${matchtype_1_rate }" pattern="##.##" />%<br/>
					이성 : <fmt:formatNumber value="${matchtype_2_rate }" pattern="##.##" />%<br/>
					상관없음 : <fmt:formatNumber value="${matchtype_3_rate }" pattern="##.##" />%<br/>
				</p>
				</form>
			</div>
		</div>
	</div>
	
	<div class="w3-display-container" style="height: 50%;">
		<div class="w3-display-middle w3-padding"></div>
	</div>
</div>