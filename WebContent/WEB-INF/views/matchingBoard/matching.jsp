<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
����� ��Ī ����<br/>
<c:choose>
	<c:when test="${matching.NICK eq null }">
	���� ���̱ⱸ�� ������ ����� �����ϴ�.<br/>
	���̱ⱸ�� �ٽ� �������ֽðų�
	����� ��� �� ������� ��Ī �Ͻðڽ��ϱ�?<br/>
	<form action="/matchingBoard/matching2.do">
			<button type="submit" id="matching">����� ����� ������� ��Ī</button>
			<input type="hidden" value="${mypage.NICK }" name="nick" />
		</form>
	
	</c:when>
	<c:otherwise>
${matching.NICK }��  �Դϴ�.	
	</c:otherwise>
	
</c:choose>

</body>
</html>