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
			<input type="hidden" value="${mypage.NICK }"/>
		</form>
	
	</c:when>
	<c:otherwise>
<p>
${matching.NICK }��  �Դϴ�.<br/>
</p>
 <a href="/matchingBoard//matchingcheck.do"><button type="submit"
						class="btn btn-primary"
						style="padding: 8px; font-size: 12pt; width: 200px">���� ��Ī</button></a>
<p>
<br/>
<!-- <a href="/matchingBoard/matchingcheck.do"><input type="submit">���� ��Ī</input></a> -->
</p>
<script>
	$(document).ready(function(){
		$.ajax("/matchingBoard/insertmatching.do",{
			"method" : "post",
			"async" : false,
			"data":{
				"matchingnick" : "${matching.NICK}",
				"fear" : ${matching.FEAR},
				"yellow_card" : ${matching.YELLOW_CARD},
				"gender" : "${matching.GENDER}",
				"mynick" : "${sessionScope.userNick}",
				"email" : "${matching.EMAIL}",
				"overlap" : "${matching.NICK}${sessionScope.userNick}"
			}
		}).done(function(obj){
	         //0(����) or 1(����)
	         if(obj[0].result==1){
	        	window.alert("��Ī�� �����ϼ̽��ϴ�.")
	         }else if(obj[0].result==2){
	        	 window.alert("�̹� ���� ����� ��Ī �Ǿ����ϴ� .(f5 �׸� ����!!!)")
	         }else{
	        	 window.alert("�˼����� ������ ��Ī�� �����ϼ̽��ϴ�.")
	         }
	    });

	});


</script>

	</c:otherwise>
	
</c:choose>

</body>
</html>