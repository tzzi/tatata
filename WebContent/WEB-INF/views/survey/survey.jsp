<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-purple.css">
<style>
input[type=radio] {
	-ms-transform: scale(1.0); /* IE 9 */
    -webkit-transform: scale(1.0); /* Chrome, Safari, Opera */
    transform: scale(1.0);
    width: 15px;
}
</style>
<div class="w3-container">


	<div>
		<header class="w3-container w3-pale-red">
			<h1 style="color: white" align="center">매칭 후기 설문조사</h1>
		</header>
	</div>
	<div class="w3-display-container" style="min-height: 75%;">
		<div class="w3-display-middle w3-padding">

			<div class="w3-container w3-margin-top" align="center"
				style="width: 1000px;">
				<form class="w3-container w3-card-4" action="/survey/surveyrst.do" method="post" enctype="multipart/form-data">
					<div>
						<br />
						<div class="w3-container">
							<small>매칭 후 놀이공원에 다녀오신 분들께 받는 매칭 후기 설문조사입니다.<br/>
							소중한 시간 내어주셔서 감사합니다.<br/></small>
							<br/>
							<table class="w3-table-all w3-hoverable">
								<thead>
									<tr class="w3-light-grey">
										<th width="50%">질 문</th>
										<th width="50%">선 택</th>
									</tr>
								</thead>
								<tr>
									<td>매칭된 상대방에 대한 총평</td>
									<td>
										<p>
											<input class="w3-radio" type="radio" name="total"  value="total_5"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="total"  value="total_4"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="total"  value="total_3"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="total" value="total_2"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="total" value="total_1"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;"></label>
										</p> 
									</td>
								</tr>
								<tr>
									<td>본인의 매칭 유형 선택</td>
									<td>
									<input class="w3-radio" type="radio" name="match_type" value="type_1"><label>동성</label>
									<input class="w3-radio" type="radio" name="match_type" value="type_2"><label>이성</label>
									<input class="w3-radio" type="radio" name="match_type" value="type_3"><label>무관</label>
									</td>
								</tr>
								<tr>
									<td>상대방의 첫인상에 대한 만족도는?</td>
									<td>
										<p>
											<input class="w3-radio" type="radio" name="m_first" value="first_5"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_first" value="first_4"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_first" value="first_3"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_first" value="first_2"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_first" value="first_1"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;"></label>
										</p>
									</td>
								</tr>
								<tr>
									<td>상대방은 약속시간을 잘 지켰다</td>
									<td>
										<p>
											<input class="w3-radio" type="radio" name="m_pr_time"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_pr_time"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_pr_time"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_pr_time"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_pr_time"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
										</p>
									</td>
								</tr>
								<tr>
									<td>상대방의 도덕성에 대해 평가하자면?</td>
									<td>
										<p>
											<input class="w3-radio" type="radio" name="m_moral"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_moral"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_moral"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_moral"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_moral"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
										</p>
									</td>
								</tr>
								<tr>
									<td>상대방과 대화가 잘 통했다</td>
									<td>
										<p>
											<input class="w3-radio" type="radio" name="m_communi"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_communi"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_communi"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_communi"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
											<input class="w3-radio" type="radio" name="m_communi"> 
											<label><img	src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;">
											<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
										</p>
									</td>
								</tr>
								<tr>
									<td>한 번 더 만나볼 의사가 있다? 없다?</td>
									<td>
										<p>
											<input class="w3-radio" type="radio" name="m_meet"> 
											<label>있다</label>
											<input class="w3-radio" type="radio" name="m_meet"> 
											<label>없다</label>
											<input class="w3-radio" type="radio" name="m_meet"> 
											<label>무념무상</label>
										</p>
									</td>
								</tr>
							</table>
						</div>
						
					</div>
					
					<button type="reset"
						class="w3-button w3-section w3-theme-l2 w3-ripple">
						<b style="color: white">리셋</b>
					</button>
					<button type="submit"
						class="w3-button w3-section w3-theme-l2 w3-ripple">
						<b style="color: white">완료</b>
					</button>
					<a href="../index.do"><button type="button"
							class="w3-button w3-section w3-theme-l2 w3-ripple">
							<b style="color: white">취소</b>
						</button></a>

				</form>
			</div>
		</div>
	</div>
</div>

<!-- <div id="rst" onchange="input()"></div>
<div id="mongodbinputdiv">
	<input type="text" id ="inname" placeholder="input name">
	<input type="text" id = "inage" placeholder="input age">
	<button id="btn_add"><small>몽고추가</small></button>
</div> -->
 <!-- onclick="sendAddReq()" -->

<!-- <script>
	$('#btn_add').click(function() {
		var name = $('#inname').val();
		var age = $('#inage').val();
		
		var trans_object =
			{
				'name' : name,
				'age' : age
			}
		
		var trans_json = JSON.stringify(trans_object); //json으로 반환
		
		$.ajax({
			url: "/survey/test.do",
			type: 'POST',
			dataType: 'json',
			data: trans_json,
			contentType: 'application/json',
			mimeType: 'applicatioin/json',
			success: function(retVal) {
				alert("success ajax..." + '/' retVal.val);
			}
			
		});
	});
	
	function sendAddReq() {
		var xhr = new XMLHttpRequest();
		xhr.open("post", "/survey/test.do", true);
		xhr.onreadystatechange = function() {
			if(this.readyState==4) {
				if(JSON.parse(this.responseText)) {
					/* document.getElementById("rst").innerHTML += document.getElementById("reply").value + "<br/>"; */
					document.getElementById("mongo").value = "";
				} else {
					window.alert("댓글 등록 중 오류 발생");
				}
			}
		}
		/* xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); */
		var param = {
			"content" : document.getElementById("mongo").value
		}
		xhr.send(JSON.stringify(param));
		
	}
</script>
 -->