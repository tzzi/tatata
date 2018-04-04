<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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


</style>





<div align="center">
	<h1>나의 정보</h1>


	<p>
		<c:choose>
			<c:when test="${mypage.MATCHTYPE eq null }">
  마이 페이지에서 정보수정을 통해 매칭유형과 이메일, 담력등을 선택해주세요<hr />
			</c:when>

			<c:otherwise>
 아아디 : ${mypage.ID}
<br />
나의 성별 : 
<c:choose>
<c:when test="${mypage.GENDER eq 1 }">
男
</c:when>
<c:otherwise>
女
</c:otherwise>
</c:choose>
<br/>

매칭유형 : 
<c:choose>
					<c:when test="${mypage.MATCHTYPE eq 1 }">
	동성	
	</c:when>
					<c:when test="${mypage.MATCHTYPE eq 2 }">
	이성
	</c:when>
					<c:otherwise>
	상관없음
	</c:otherwise>
				</c:choose>


				<br />
이메일 : ${mypage.EMAIL }
<br />
담력 : ${mypage.FEAR}
<br />
경고 : ${mypage.YELLOW_CARD}
<br />
자기소개 : ${mypage.INTRO }
<hr />
장바구니
<br />

			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when
				test="${mybasket.BASKET1 eq null && mybasket.BASKET2 eq null && mybasket.BASKET3 eq null && mybasket.BASKET1 eq null && mybasket.BASKET4 eq null 
	&& mybasket.BASKET5 eq null}">
			장바구니에 정보가 없으면 매칭이 되지 않습니다.<br />
				<a href="/rideboard/list.do"><button type="submit"
						class="btn btn-primary"
						style="padding: 8px; font-size: 12pt; width: 200px">놀이기구
						보러가기</button></a>
			</c:when>
			<c:otherwise>

				<c:choose>
					<c:when test="${mybasket.BASKET1 eq null}">
					</c:when>
					<c:otherwise>${mybasket.BASKET1}    <button
							type="submit" class="delete" id="1">목록에서 빼기</button>
						<br />
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${mybasket.BASKET2 eq null}">
					</c:when>
					<c:otherwise>${mybasket.BASKET2}   <button
							type="submit" class="delete" id="2">목록에서 빼기</button>
						<br />
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${mybasket.BASKET3 eq null}">
					</c:when>
					<c:otherwise>${mybasket.BASKET3}   <button
							type="submit" class="delete" id="3">목록에서 빼기</button>
						<br />
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${mybasket.BASKET4 eq null}">
					</c:when>
					<c:otherwise>${mybasket.BASKET4}   <button
							type="submit" class="delete" id="4">목록에서 빼기</button>
						<br />
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${mybasket.BASKET5 eq null}">
					</c:when>
					<c:otherwise>${mybasket.BASKET5}   <button
							type="submit" class="delete" id="5">목록에서 빼기</button>
						<br />
					</c:otherwise>
				</c:choose>

			</c:otherwise>
		</c:choose>
	<hr />

	<c:choose>
		<c:when test="${checkagree.NICK eq null && (mybasket.BASKET1 ne null || mybasket.BASKET2 ne null || mybasket.BASKET3 ne null || mybasket.BASKET4 ne null || mybasket.BASKET5 ne null)
 	&& mypage.MATCHTYPE ne null}">
			<button type="submit" id="agree">매칭 동의</button>
		</c:when>
		<c:otherwise>
			<!-- 널이 아니라면 -->
			<c:choose>
				<c:when
					test="${(mybasket.BASKET1 ne null || mybasket.BASKET2 ne null || mybasket.BASKET3 ne null || mybasket.BASKET4 ne null || mybasket.BASKET5 ne null)
 	&& mypage.MATCHTYPE ne null }">
					<form action="/matchingBoard/matching.do" method="post">
						<button type="submit" id="heart">매칭하기</button>

					</form>

				</c:when>
				<c:otherwise>
 			장바구니에 정보가 없거나 내정보에서 매칭유형,이메일,담력 등을 설정하지 않으면 매칭을 할 수 없습니다.
 	</c:otherwise>

			</c:choose>

		</c:otherwise>
	</c:choose>



</div>




<script>
	$(".delete").click(function() {
		var id = $(this).attr("id");
		$.ajax("/matchingBoard/delete.do", {
			"method" : "post",
			"async" : false,
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
			"async" : false,
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



