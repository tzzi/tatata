<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
	<head>
	<title>
		<tiles:getAsString name="title"></tiles:getAsString>
	</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/WEB-INF/views/view/style.css">
	
	</head>
	<body>
	<div>
		<div style="width: 100%">
			<div style="min-height: 70px">
				<tiles:insertAttribute name="nav"></tiles:insertAttribute>
			</div>
			<div style="min-height: 500px">
				<tiles:insertAttribute name="body"></tiles:insertAttribute>
			</div>
			<div style="min-height: 120px">
				<tiles:insertAttribute name="footer"></tiles:insertAttribute>
			</div>
		</div>
	</div>
	</body>
</html> 