<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-green.css">


<div class="w3-container" align="center">
	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">S T A T I S T I C S &nbsp; A B O U T &nbsp; U S E R S</h1>
	</header>
	<br />
	
	<div class="w3-container w3-margin-top w3-center" style="width: 550px;">
		<form class="w3-card-4 w3-center">
			<div class="w3-padding-large">
				<p>
					<div class="w3-container" align="left">
					  <div class="w3-panel w3-pale-red w3-leftbar w3-border-red">
					    <p><b>AREA TOP3</b></p>
					    <p>1 : ${area_1 }</p>
					    <p>2 : ${area_2 }</p>
					    <p>3 : ${area_3 }</p>
					  </div>
					</div>
				</p>
				<div class="w3-container" align="left">
				<p>
					<%-- <div class="w3-container" align="left">
					  <div class="w3-panel w3-theme-l5 w3-leftbar w3-border-purple">
					    <p><b>GENDER RATE</b></p>
					    <p><img src="/image/man_symbol.png" height="20" width="20"> : 
					    <fmt:formatNumber value="${man_rate }" pattern="##.##" />%<br/></p>
					    <p><img src="/image/woman_symbol.png" height="20" width="20"> : 
					    <fmt:formatNumber value="${woman_rate }" pattern="##.##" />%</p>
					  </div>
					</div> --%>
					<b>GENDER RATE</b>
					<div class="w3-row" style="width:100%">
					    <div class="w3-col w3-pale-blue w3-container" style="width:${man_rate }%">
					   	<p><small><b><img src="/image/man_symbol.png" height="20" width="20"> <fmt:formatNumber value="${man_rate }" pattern="##.##" />%</b></small></p></div>
					   	<div class="w3-col w3-pale-red w3-container" style="width:${woman_rate }%">
					   	<p><small><b><img src="/image/woman_symbol.png" height="20" width="20"> <fmt:formatNumber value="${woman_rate }" pattern="##.##" />%</b></small></p></div>
					</div>
				</p>
				<p>	
					<%-- <div class="w3-container" align="left">
					  <div class="w3-panel w3-pale-blue w3-leftbar w3-border-blue">
					    <p><b>FEAR RATE</b></p>
					    <p>고수 : <fmt:formatNumber value="${fear_1_rate }" pattern="##.##" />%</p>
					    <p>중수 : <fmt:formatNumber value="${fear_2_rate }" pattern="##.##" />%</p>
					    <p>하수 : <fmt:formatNumber value="${fear_3_rate }" pattern="##.##" />%</p>
					   </div>
					</div> --%>
					<b>FEAR RATE</b>
					<div class="w3-row" style="width:100%">
					    <div class="w3-col w3-theme-l4 w3-container" style="width:${fear_1_rate }%">
					   	<p><small><b>고수<br/> <fmt:formatNumber value="${fear_1_rate }" pattern="##.##" />%</b></small></p></div>
					   	<div class="w3-col w3-theme-l3 w3-container" style="width:${fear_2_rate }%">
					   	<p><small><b>중수<br/> <fmt:formatNumber value="${fear_2_rate }" pattern="##.##" />%</b></small></p></div>
					   	<div class="w3-col w3-theme-l2 w3-container" style="width:${fear_3_rate }%">
				    	<p><small><b>하수<br/> <fmt:formatNumber value="${fear_3_rate }" pattern="##.##" />%</b></small></p></div>
					</div>
				</p>
				<p>
					<%-- <div class="w3-container" align="left">
					  <div class="w3-panel w3-pale-green w3-leftbar w3-border-green">
					    <p><b>MATCHTYPE RATE</b></p>
					    <p>동성 : <fmt:formatNumber value="${matchtype_1_rate }" pattern="##.##" />%</p>
					    <p>이성 : <fmt:formatNumber value="${matchtype_2_rate }" pattern="##.##" />%</p>
					    <p>상관없음 : <fmt:formatNumber value="${matchtype_3_rate }" pattern="##.##" />%</p>
					  </div>
					</div> --%>
					<b>MATCHTYPE RATE</b>
					<div class="w3-row" style="width:100%">
					    <div class="w3-col w3-theme-l1 w3-container" style="width:${matchtype_1_rate }%">
					   	<p><small><b>동성<br/> <fmt:formatNumber value="${matchtype_1_rate }" pattern="##.##" />%</b></small></p></div>
					   	<div class="w3-col w3-theme w3-container" style="width:${matchtype_2_rate }%">
					   	<p><small><b>이성<br/> <fmt:formatNumber value="${matchtype_2_rate }" pattern="##.##" />%</b></small></p></div>
					   	<div class="w3-col w3-theme-d1 w3-container" style="width:${matchtype_3_rate }%">
				    	<p><small><b>무관<br/> <fmt:formatNumber value="${matchtype_3_rate }" pattern="##.##" />%</b></small></p></div>
					</div>
				</p>
				</div>
			</div>
		</form>
				
	</div>
</div>