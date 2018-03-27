<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html {
	font-family: "Lato", sans-serif;
	background: url(/start/start_logo.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 28px;
	padding: 20px;
	width: 200px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
<html>
<head>
<title><tiles:getAsString name="title"></tiles:getAsString></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div align="center">
		<div style="width: 960px">
			<div style="min-height: 100px;"></div>


			<div style="min-height: 200px"></div>
			<div style="min-height: 150px">
			<h1>놀이공원 & 놀이기구 정보를 한눈에</h1>
			<h3><b>생생한 현장 소식을 전하다</b></h3>
			</div>
			<div align="center" style="min-height: 150px;">


				<a href="/join/joinindex.do"><button class="button"
						style="vertical-align: middle">
						<span>J O I N </span>
					</button></a> 
				<a href="/login/loginindex.do"><button class="button"
						style="vertical-align: middle">
						<span>L O G I N</span>
					</button></a>
			</div>
		</div>
	</div>
</body>
</html>