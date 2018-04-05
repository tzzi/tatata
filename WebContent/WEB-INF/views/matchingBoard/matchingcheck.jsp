<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">
	
<body>
<div class="w3-container" align="center">
	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">M A T C H I N G &nbsp; S I T U A T I O N</h1>
	</header>
	<br />
	<div class="w3-container w3-margin-top w3-center" style="width: 600px;">
		<form class="w3-card-4 w3-center">
		<br/>
		<c:choose>
			<c:when test="${list1.list1 eq 0 }">
				<small style="color:red">내가 매칭한 사람이 없습니다.</small><br/>
			</c:when>
			<c:otherwise>
			<h3>내가 매칭한 사람</h3>
			<c:forEach items="${matchingcheck }" var="a">
			${a.MATCHINGNICK } /
			 <c:choose>
				<c:when test="${a.GENDER eq 1}">
					<img src="/image/man_symbol.png" height="30" width="30">
				</c:when>
				<c:when test="${a.GENDER eq 2}">
					<img src="/image/woman_symbol.png"  height="30" width="30">
				</c:when>
			 </c:choose>
			 / ${a.EMAIL } /
			 <c:choose>
				<c:when test="${a.FEAR eq 1}">
				고수
				</c:when>
				<c:when test="${a.FEAR eq 2}">
				중수
				</c:when>
				<c:otherwise>
				하수
				</c:otherwise>
			</c:choose>
			<hr/> 
			</c:forEach>
			
			</c:otherwise>
		</c:choose>
		<br/>
		
		<h3>나를 매칭한 사람</h3>
		<c:choose>
			<c:when test="${list2.list2 eq 0 }">
			 <small style="color:red">나를 매칭한 사람이 없습니다.</small><br/>
			</c:when>
			<c:otherwise>
					<c:forEach items="${matchingforme }" var="b">
					${b.MYNICK}<br/>
					</c:forEach>
			</c:otherwise>
		</c:choose>
		<br/>
		</form>
	</div>
</div>

</body>
