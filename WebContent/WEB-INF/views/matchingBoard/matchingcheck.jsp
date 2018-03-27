<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
나의 매칭 목록<br/>
<c:forEach items="${matchingcheck}" var="a">
		${a.NICK }  /  ${a.GENDER }   /  ${a.E_MAIL } <br/>
			</c:forEach>

</body>
</html>