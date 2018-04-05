<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">
<style>
input[type=radio] {
	-ms-transform: scale(1.0); /* IE 9 */
	-webkit-transform: scale(1.0); /* Chrome, Safari, Opera */ transform :
	scale( 1.0);
	width: 15px;
	transform: scale(1.0);
}
</style>
<div class="w3-container" align="center">
	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">S U R V E Y &nbsp; R E V
			I E W</h1>
	</header>
	<br />
	<div class="w3-container w3-margin-top w3-center"
		style="width: 1000px;">
		<form class="w3-card-4 w3-center" action="/survey/surveyrst.do"
			method="post" enctype="multipart/form-data" id="survey" >
			<div>
				<br />
				<div class="w3-container">
					<small>매칭 후 놀이공원에 다녀오신 분들께 받는 매칭 후기 설문조사입니다.<br /> 소중한 시간
						내어주셔서 감사합니다.<br /></small> <br />
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
								<div class="survey">
									<input class="w3-radio total1" type="radio" name="total" value="5">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total1" type="radio" name="total" value="4">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total1" type="radio" name="total" value="3">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total1" type="radio" name="total" value="2">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total1" type="radio" name="total" value="1">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"></label>
								</div>
							</td>
						</tr>
						<tr>
							<td>본인의 매칭 유형 선택</td>
							<td>
								<div class="survey">
									<input class="w3-radio total2" type="radio" name="match_type"
										value="1"><label>동성</label> <input class="w3-radio"
										type="radio" name="match_type" value="2"><label>이성</label>
									<input class="w3-radio total2" type="radio" name="match_type"
										value="3"><label>무관</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>매칭 유형에 대한 만족도는?</td>
							<td>
								<div class="survey">
									<input class="w3-radio total3" type="radio" name="m_meet" value="5">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total3" type="radio" name="m_meet" value="4">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total3" type="radio" name="m_meet" value="3">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total3" type="radio" name="m_meet" value="2">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total3" type="radio" name="m_meet" value="1">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"></label>
								</div>
							</td>
						</tr>
						<tr>
							<td>상대방의 첫인상에 대한 만족도는?</td>
							<td>
								<div class="survey">
									<input class="w3-radio total4" type="radio" name="m_first" value="5">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total4" type="radio" name="m_first" value="4">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total4" type="radio" name="m_first" value="3">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total4" type="radio" name="m_first" value="2">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total4" type="radio" name="m_first" value="1">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"></label>
								</div>
							</td>
						</tr>
						<tr>
							<td>상대방은 약속시간을 잘 지켰다</td>
							<td>
								<div class="survey">
									<input class="w3-radio total5" type="radio" name="m_pr_time" value="5">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total5" type="radio" name="m_pr_time" value="4">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total5" type="radio" name="m_pr_time" value="3">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total5" type="radio" name="m_pr_time" value="2">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total5" type="radio" name="m_pr_time" value="1">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"></label>
								</div>
							</td>
						</tr>
						<tr>
							<td>상대방의 도덕성에 대해 평가하자면?</td>
							<td>
								<div class="survey">
									<input class="w3-radio total6" type="radio" name="m_moral" value="5">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total6" type="radio" name="m_moral" value="4">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total6" type="radio" name="m_moral" value="3">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total6" type="radio" name="m_moral" value="2">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total6" type="radio" name="m_moral" value="1">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"></label>
								</div>
							</td>
						</tr>
						<tr>
							<td>상대방과 대화가 잘 통했다</td>
							<td>
								<div class="survey">
									<input class="w3-radio total7" type="radio" name="m_communi" value="5">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total7" type="radio" name="m_communi" value="4">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total7" type="radio" name="m_communi" value="3">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;">
										<img src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total7" type="radio" name="m_communi" value="2">
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"> <img
										src="/image/star.png" style="height: 15px; width: 15px;"></label>
									<input class="w3-radio total7" type="radio" name="m_communi" value="1" >
									<label><img src="/image/star.png"
										style="height: 15px; width: 15px;"></label>
								</div>
							</td>
						</tr>
					</table>
				</div>

			</div>

			<button type="reset"
				class="w3-button w3-section w3-theme-l2 w3-ripple">
				<b style="color: white">리셋</b>
			</button>
			<button type="button"
				class="w3-button w3-section w3-theme-l2 w3-ripple" id="complete"
				>
				<b style="color: white">완료</b>
			</button>
			<a href="./surveyindex.do"><button type="button"
					class="w3-button w3-section w3-theme-l2 w3-ripple">
					<b style="color: white">취소</b>
				</button></a>

		</form>
	</div>
</div>
<script>

	$(".survey").on("change", function() {
		$("#complete").prop("disabled", false);
	});

	$("#complete").on("click", function() {
		if($(".total1:checked").length==0 &&
				$(".total2:checked").length==0 && 
				$(".total3:checked").length==0 && 
				$(".total4:checked").length==0 && 
				$(".total5:checked").length==0 && 
				$(".total6:checked").length==0 && 
				$(".total7:checked").length==0  
				) {
			window.alert("평가를 하지 않은 항목이 있습니다.");
			return;
		}
		
		$("#survey").submit();
	});
</script>