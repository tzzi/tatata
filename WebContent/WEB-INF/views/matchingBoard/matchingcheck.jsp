<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div align="center">
</head>
<body>
<h1>내가 매칭한  사람</h1><br/>
<c:forEach items="${matchingcheck }" var="a">
${a.MATCHINGNICK } /
<c:choose>
	<c:when test="${a.GENDER eq 1}">
	남성
	</c:when>
	<c:when test="${a.GENDER eq 2}">
	여성
	</c:when>
</c:choose>
/  ${a.EMAIL } <hr/> 
</c:forEach>
<h1>나를 매칭한 사람</h1><br/>

<c:forEach items="${matchingforme }" var="b">
${b.MYNICK}<br/>
</c:forEach>
</div>
</body>
</html>