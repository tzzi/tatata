<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.mySlides {
	display: none
}

.w3-left, .w3-right, .w3-badge {
	cursor: pointer
}

.w3-badge {
	height: 13px;
	width: 13px;
	padding: 0
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div class="w3-content w3-display-container"
		style="width: 100%; height: 250">
		<img class="mySlides" src="/image/04.jpg"
			style="width: 100%; height: 250"> <img class="mySlides"
			src="/image/lotte.png" style="width: 100%; height: 250"> <img
			class="mySlides" src="img_mountains_wide.jpg"
			style="width: 100%; height: 250">
		<div
			class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle"
			style="width: 100%">
			<div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
			<div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
			<span class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(1)"></span> <span
				class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(2)"></span> <span
				class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(3)"></span>
		</div>
	</div>
	<hr />
	<div align="left">
		<a href="/rideboard/list.do"><button style="outline: none;"
				class="w3-btn w3-white w3-border">전체보기</button></a>
     <a href="/rideboard/parkdetail.do?park_name=롯데월드"><button style="outline: none;" class="w3-btn w3-white w3-border">롯데월드</button></a> 
	  <a href="/rideboard/parkdetail.do?park_name=에버랜드"><button style="outline: none;" class="w3-btn w3-white w3-border">에버랜드</button></a>
	 <a href="/rideboard/parkdetail.do?park_name=롯데월드"><button style="outline: none;" class="w3-btn w3-white w3-border">서울랜드</button></a>
	 <a href="/rideboard/parkdetail.do?park_name=롯데월드"><button style="outline: none;" class="w3-btn w3-white w3-border">경주월드</button></a>
	<a href="/rideboard/parkdetail.do?park_name=롯데월드"><button style="outline: none;" class="w3-btn w3-white w3-border">e 월 드</button></a>
		<hr />
	</div>
	
	<c:forEach items="${rideboard }" var="ride" varStatus="vs">
	<c:if test="${vs.count %3 == 1}">
		<div class="w3-row-padding">
	</c:if>
    <div class="w3-third w3-container w3-margin-bottom" style="border: 2px;"  >
        <p align="center"><b>${ride.RIDE_NAME }</b></p>
      <a href="/rideboard/detail.do?ride_name=${ride.RIDE_NAME}">
      <img src="${ride.IMAGE }" alt="Norway" 
      style="width:100%;height: 180px;" class="w3-hover-opacity"></a><hr/>
      
      
      <div class="w3-container w3-white">
        
      </div>
    </div>
    <c:if test="${vs.count %3 == 0 || vs.last}">
	</c:if>
    </c:forEach>
		</div>
 
	<br />
</body>

<script>

	var slideIndex = 1;
	showDivs(slideIndex);

	function plusDivs(n) {
		showDivs(slideIndex += n);
	}

	function currentDiv(n) {
		showDivs(slideIndex = n);
	}

	function showDivs(n) {
		var i;
		var x = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("demo");
		if (n > x.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = x.length
		}
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" w3-white", "");
		}
		x[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " w3-white";
	}
</script>
</html>