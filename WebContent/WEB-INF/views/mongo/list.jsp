<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>List</title>
</head>
<body>
	<p align="center">
		<input type="text" placeholder="검색" id="search"/>
	</p>
	<div align="center">
		<h2>전체 게시물 - ${fn:length(list) }</h2>
		<hr/>
		<div style="width: 860px; display: inline-block;">
			<c:forEach var="n" items="${list }">
				<p style="float: left; width: 33%;">
				<small><c:forEach items="${n.tag}" var="tag">
				<a href="/mongo/search.do?tag=${fn:replace(tag,'#','%23') }">${tag}</a>
				</c:forEach></small> <br/>
				<img src="${applicationScope.path }${n.url }" 
					 style="width:200px; height:200px" 
					 onclick="openDialog('${n._id}')"/><br/>
				</p>
			</c:forEach>
		</div>
	</div>
	<hr/>
	<div align="center">
		<form>
			<button type="submit" formaction="/mongo/upload.do">게시물 등록</button>
		</form>
	</div>
	<script>
		function openDialog(id){
			var url = "${applicationScope.path}/mongo/detail.do?id="+id;
			window.open(url, "detail", "width=500,height=700,top=50,left=500");
		}
		document.getElementById("search").onchange = function() {
			var tag = document.getElementById("search").value;
			var xhr = new XMLHttpRequest();
			xhr.open("get", "mongo/search.do?tag="+tag, true);
			xhr.onreadystatechange = function() {
				if(xhr.readyState==4) {
					var obj = JSON.parse(this.responseText);
					document.getElementById("search").innerHTML="";
				}
			}
			xhr.send();
		}
	</script>
</body>
</html>