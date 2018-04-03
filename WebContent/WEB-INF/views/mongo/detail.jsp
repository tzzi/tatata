<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>Detail</title>
</head>
<body>
	
	<div align="center">
			<br/>
			<p>
			<small><c:forEach items="${list.tag}" var="tag">
				<a href="/mongo/search.do?tag=${fn:replace(tag,'#','%23') }">${tag}</a>
				</c:forEach></small><br/>
				<img src="${applicationScope.path }${list.url }" 
				 style="width:300px;"/><br/>
			</p>
			<br/>
			<p id="cmt">
				<pre>${list.comment }</pre>
			</p>
			
	</div>
	<div align="center">
	<form>
		<a href="/mongo/delete.do?id=${list._id }">삭제</a>
	</form>
	</div>
</body>
<script>
	

</script>

</html> --%>