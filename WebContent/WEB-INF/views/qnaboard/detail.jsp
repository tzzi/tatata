<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:forEach items="${qnadetail}" var="a">
    글제목   :  ${a.TITLE}<br/>
    글내용  :  ${a.CONTENT}<br/>
    조회수  :  ${a.COUNT}<br/>
     
</c:forEach>
<hr/>
