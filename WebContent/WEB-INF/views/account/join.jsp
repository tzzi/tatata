<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String rst = (String)request.getAttribute("rst");
	if (rst.equals("1")){
		%>
			회원가입을 성공적으로 마쳤습니다.
		<%
	}else{
		%>
			회원가입에 실패하였습니다.
		<%
	}
%>