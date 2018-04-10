<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">
<style>

#heart {
    position: relative;
    width: 100px;
    height: 90px;
    animation: heartbeat 1s infinite;
    margin:0 auto
}
#heart:before,
#heart:after {
    position: absolute;
    content: "";
    left: 50px;
    top: 0;
    width: 50px;
    height: 80px;
    background: #f44336;
    -moz-border-radius: 50px 50px 0 0;
    border-radius: 50px 50px 0 0;
    -webkit-transform: rotate(-45deg);
       -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
         -o-transform: rotate(-45deg);
            transform: rotate(-45deg);
    -webkit-transform-origin: 0 100%;
       -moz-transform-origin: 0 100%;
        -ms-transform-origin: 0 100%;
         -o-transform-origin: 0 100%;
            transform-origin: 0 100%;
}
#heart:after {
    left: 0;
    -webkit-transform: rotate(45deg);
       -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
         -o-transform: rotate(45deg);
            transform: rotate(45deg);
    -webkit-transform-origin: 100% 100%;
       -moz-transform-origin: 100% 100%;
        -ms-transform-origin: 100% 100%;
         -o-transform-origin: 100% 100%;
            transform-origin :100% 100%;
}



@keyframes heartbeat
{
  0%
  {
    transform: scale( .75 );
  }
  20%
  {
    transform: scale( 1 );
  }
  40%
  {
    transform: scale( .75 );
  }
  60%
  {
    transform: scale( 1 );
  }
  80%
  {
    transform: scale( .75 );
  }
  100%
  {
    transform: scale( .75 );
  }
}

[class*="col-"] {
	float: left;
	padding: 15px;
}
[class*="colo-"] {
	float: right;
	padding: 15px;
}
.col-6 {
	width: 50%;
}
.colo-4 {
	width: 50%;
}

</style>

<div class="w3-container" align="center">
	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center"> M A T C H I N G &nbsp; I N F O</h1>
	</header>
	<br />
</div>

<div class="w3-row-padding w3-content" style="max-width: 1400px">
	<div class="col-6">
		<div class="w3-container w3-margin-top w3-center"
			style="width: 550px; height: 700px">
			<form class="w3-card-4 w3-center">
	
		<c:choose>
			<c:when test="${mypage.MATCHTYPE eq null }">
  				<small style="color:red">상단의 본인의 아이디를 클릭하여 이메일 인증 후, 추가 정보를 입력해주세요.</small>
			</c:when>

			<c:otherwise>
			<div align="center">
				<table>
					<tr><td><br/></td></tr>
					<tr>
						<th height="50px">아 이 디</th>
						<td>&nbsp;&nbsp;</td>
						<td align="center">${mypage.ID}</td>
					</tr>
					<tr>
						<th height="50px">이 메 일</th>
						<td>&nbsp;&nbsp;</td>
						<td align="center">${mypage.EMAIL }</td>
					</tr>
					<tr>
						<th height="50px">성 별</th>
						<td>&nbsp;&nbsp;</td>
						<td align="center">
							<c:choose>
								<c:when test="${mypage.GENDER eq 1 }">
									<img src="/image/man_symbol.png" height="30" width="30">
								</c:when>
								<c:otherwise>
									<img src="/image/woman_symbol.png"  height="30" width="30">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th height="50px">담 력</th>
						<td>&nbsp;&nbsp;</td>
						<td align="center">
						<c:choose>
							<c:when test="${mypage.FEAR eq 1}">
								고수
							</c:when>
							<c:when test="${mypage.FEAR eq 2}">
								중수
							</c:when>
							<c:otherwise>
								하수
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
<!-- modelMap : {mypage={FEAR=1, BIRTH_D=3, AREA=서울, INTRO=자기소개를 마음껏 입력하세요., YELLOW_CARD=0, GENDER=1, BIRTH_M=4, ID=wer, EMAIL=kingoyster99@naver.com, BIRTH_Y=2018, MATCHTYPE=1}, mybasket={NICK=헤핳}, checkagree={FEAR=1, BASKET1=후렌치레볼루션2 VR, AREA=서울, NICK=헤핳, YELLOW_CARD=0, GENDER=1, ID=wer, EMAIL=kingoyster99@naver.com, TYPE1=스릴, MATCHTYPE=1}}
 -->
					<tr>
						<th height="50px">자 기 소 개</th>
						<td>&nbsp;&nbsp;</td>
						<td align="center">
						<textarea class="w3-input" rows="10" cols="100" name="intro"
						style="padding: 8px; font-size: 12pt; width: 300px; height: 200px; resize: none;"
						disabled>${mypage.INTRO }</textarea>
						</td>
					</tr>
					<tr>
						<th height="50px">매 칭 유 형</th>
						<td>&nbsp;&nbsp;</td>
						<td align="center">
							<c:choose>
								<c:when test="${mypage.MATCHTYPE eq 1 }">
									<c:choose>
										<c:when test="${mypage.GENDER eq 1 }">
											<img src="/image/man_symbol.png" height="30" width="30">
											&
											<img src="/image/man_symbol.png"  height="30" width="30">
										</c:when>
										<c:otherwise>
											<img src="/image/woman_symbol.png" height="30" width="30">
											&
											<img src="/image/woman_symbol.png"  height="30" width="30">
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${mypage.MATCHTYPE eq 2 }">
									<img src="/image/man_symbol.png" height="30" width="30">
									<i class="material-icons" style="font-size:30px;color:red;">favorite</i>
									<img src="/image/woman_symbol.png"  height="30" width="30">
								</c:when>
								<c:otherwise>
									<img src="/image/question.png" height="30" width="30">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr><td><br/></td></tr>
				</table>
			</div>	
			</c:otherwise>
		</c:choose>
			</form>
		</div>
	</div>
	
	
	<div class="colo-4">
		<div class="w3-container w3-margin-top w3-center" style="width: 550px; height: 700px">
			<form class="w3-card-4 w3-center w3-padding-32">
				<div>
				<c:choose>
			<c:when
				test="${mybasket.BASKET1 eq null && mybasket.BASKET2 eq null && mybasket.BASKET3 eq null && mybasket.BASKET1 eq null && mybasket.BASKET4 eq null 

				&& mybasket.BASKET5 eq null}">
			<small style="color:red">장바구니에 정보가 없으면 매칭이 되지 않습니다.</small><br />
				<a href="/rideboard/list.do"><button type="button"
						class="w3-button w3-section w3-theme-l2 w3-ripple"
						style="padding: 8px; font-size: 12pt; width: 200px">놀이기구
						보러가기</button></a>
			</c:when>
			<c:otherwise>

				<c:choose>
					<c:when test="${mybasket.BASKET1 eq null}">
					</c:when>
					<c:otherwise>${mybasket.BASKET1}    <button
							type="submit" class="delete w3-button w3-section w3-theme-l2 w3-ripple" id="1">삭제</button>
						<br />
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${mybasket.BASKET2 eq null}">
					</c:when>
					<c:otherwise>${mybasket.BASKET2}   <button
							type="submit" class="delete w3-button w3-section w3-theme-l2 w3-ripple" id="2">삭제</button>
						<br />
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${mybasket.BASKET3 eq null}">
					</c:when>
					<c:otherwise>${mybasket.BASKET3}   <button
							type="submit" class="delete w3-button w3-section w3-theme-l2 w3-ripple" id="3">삭제</button>
						<br />
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${mybasket.BASKET4 eq null}">
					</c:when>
					<c:otherwise>${mybasket.BASKET4}   <button
							type="submit" class="delete w3-button w3-section w3-theme-l2 w3-ripple" id="4">삭제</button>
						<br />
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${mybasket.BASKET5 eq null}">
					</c:when>
					<c:otherwise>${mybasket.BASKET5}   <button
							type="submit" class="delete w3-button w3-section w3-theme-l2 w3-ripple" id="5">삭제</button>
						<br />
					</c:otherwise>
				</c:choose>

			</c:otherwise>
		</c:choose>
		<br/>
		<hr/>
		<br/>
		<c:choose>
				<c:when test="${checkagree.NICK eq null && (mybasket.BASKET1 ne null || mybasket.BASKET2 ne null || mybasket.BASKET3 ne null || mybasket.BASKET4 ne null || mybasket.BASKET5 ne null)
		 	&& mypage.MATCHTYPE ne null}">
					<button type="submit" class="w3-button w3-section w3-theme-l2 w3-ripple"
								style="padding: 8px; font-size: 12pt; width: 120px" id="agree">매칭 동의</button>
				</c:when>
				<c:otherwise>
					<!-- 널이 아니라면 -->
					<c:choose>
						<c:when
							test="${(mybasket.BASKET1 ne null || mybasket.BASKET2 ne null || mybasket.BASKET3 ne null || mybasket.BASKET4 ne null || mybasket.BASKET5 ne null)
		 					&& mypage.MATCHTYPE ne null }">
		 				
							<a href="/matchingBoard/matching.do" method="post">
								<button type="button" class="w3-button w3-section w3-ripple"
								style="padding: 8px; font-size: 12pt; width: 120px" id="heart">매칭하기</button>
							</a>
						
						</c:when>
						<c:otherwise>
							<small style="color:red">
		 					장바구니에 정보가 없거나<br/>
		 					이메일 인증 후, 추가 정보를 입력하지 않으면<br/>
		 					매칭이 불가능합니다.</small>
		 				</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		
				</div>
				</form>
			</div>
	</div>
</div>







<script>
	$(".delete").click(function() {
		var id = $(this).attr("id");
		$.ajax("/matchingBoard/delete.do", {
			"method" : "post",
			"async" : true,
			"data" : {
				"nick" : "${sessionScope.userNick}",
				"no" : id
			}
		}).done(function(obj) {
			if (obj[0].result == 1) {
				window.alert("장바구니에서 삭제되었습니다.")
			}
		});
		location.reload();
	});

	$("#agree").click(function() {
		$.ajax("/matchingBoard/agree.do", {
			"method" : "post",
			"async" : true,
			"data" : {
				"nick" : "${sessionScope.userNick}",
				"id" : "${sessionScope.userId}"
			}
		}).done(function(obj) {
			if (obj[0].result == 1) {
				window.alert("매칭에 동의하셨습니다.");
			} else if (obj[0].result == 2) {
				window.alert(obj[0].result)
				window.alert("이미 매칭에 동의하셨습니다.");
			} else {
				window.alert("알 수 없는 이유로 매칭에 동의하지 못했습니다.");
			}
		});
		location.reload();
	});
</script>



