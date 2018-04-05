
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div class="w3-container w3-pale-red w3-center">
		<h1 style="color: white">
			A M U S E M E N T &nbsp; P A R K
			<c:choose>
			<c:when test="${admin eq 1}">
			<a href="/rideboard/write.do"><button class="w3-button w3-border w3-black w3-large "><i class="fa fa-upload">게시물 작성</i></button></a>
		</c:when>
		</c:choose>
		</h1>
	</div>
	<div class="w3-container">
		<button style="outline: none;"
			class="w3-button w3-section w3-border w3-large world" id="전체보기"
			onclick="location.href='/rideboard/list.do'">전체보기</button>
		<button style="outline: none;"
			class="w3-button w3-section w3-white w3-border w3-large world" id="롯데월드"
			onclick="location.href='/rideboard/place.do?name=롯데월드'">롯데월드</button>
		<button style="outline: none;"
			class="w3-button w3-section w3-white w3-border w3-large world" id="에버랜드"
			onclick="location.href='/rideboard/place.do?name=에버랜드'">에버랜드</button>
		<button style="outline: none;"
			class="w3-button w3-section w3-white w3-border w3-large world" id="서울랜드"
			onclick="location.href='/rideboard/place.do?name=서울랜드'">서울랜드</button>
		<button style="outline: none;"
			class="w3-button w3-section w3-white w3-border w3-large world" id="경주랜드"
			onclick="location.href='/rideboard/place.do?name=경주랜드'">경주랜드</button>
		<button style="outline: none;"
			class="w3-button w3-section w3-white w3-border w3-large world" id="e월드"
			onclick="location.href='/rideboard/place.do?name=e월드'">e월드</button>
		<br /> <form action=""><select id="type" name="type">
			<option value="스릴">스릴</option>
			<option value="연애">연애</option>
			<option value="어린이">어린이</option>
		</select>
			<input type="text" name="writee" />
			<button type="button" class="w3-button fa fa-search "></button>
			</form>
	</div>
	<c:forEach items="${rideboard }" var="ride" varStatus="vs">
		<c:if test="${vs.count %3 == 1}">
			<div class="w3-row-padding">
		</c:if>
		<div class="w3-third w3-padding w3-container w3-margin-bottom"
			style="border: 2px;">
			<b class="w3-opacity "
				style="font-size: 15pt; color: gray;"> ${ride.RIDE_NAME } </b> <a
				href="/rideboard/detail.do?ride_name=${ride.RIDE_NAME}&no=${ride.NO}">
				<img src="${ride.IMAGE }" alt="Norway"
				style="width: 100%; height: 300px;"
				class="w3-hover-opacity  w3-round-large w3-border">
			</a>
			<div class=" w3-light-gray w3-border">
				<span class="w3-button  w3-light-gray"> <i
					class="fa fa-user w3-text-blue w3-xlarge">&nbsp;&nbsp;${ride.COUNT }</i>
				</span>&nbsp;&nbsp;
				<button type="button" id="${ride.RIDE_NAME }"
					class="w3-button  w3-light-gray  like">
					<i class="fa fa-thumbs-up w3-text-red  w3-xlarge">&nbsp;
						${ride.GOOD_CNT }</i>&nbsp;
				</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="fa fa-tumblr w3-large w3-text-yellow">&nbsp;&nbsp;${ride.TYPE }</span>

			</div>
			<br /> <br />
			<div class="w3-container w3-white"></div>
		</div>
		<c:if test="${vs.count %3 == 0 || vs.last}">
			</div>
		</c:if>
	</c:forEach>
	<br />
</body>
<script>
	//좋아요 버튼 
	$(".like").click(function() {
		var id = $(this).attr("id");
		$.ajax("/rideboard/overlap.do", {
			"method" : "post",
			"async" : false,
			"data" : {
				"ride_name" : id
			}
		}).done(function(obj) {
			if (obj[0].result == 1) {
				$.ajax("/rideboard/ride_like.do", {
					"method" : "post",
					"async" : false,
					"data" : {
						"ride_name" : id
					}
				}).done(function(obj) {
					if (obj[0].result == 1) {
						window.alert("추천되었습니다.")
					} else {
						window.alert("알 수 없는 이유로 추천에 실패하셨습니다.")
					}
				});
			} else {
				window.alert("이미 추천 하셨습니다.")
			}
		});
		location.reload();
	});
</script>
</html>