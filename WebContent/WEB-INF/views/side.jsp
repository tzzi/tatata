<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div align="left">
	<h3>빨리오거라</h3>
	<ul>
		<c:forEach var="obj" items="${data2 }">
			<li>${obj }</li>
		</c:forEach>
	</ul>
</div>