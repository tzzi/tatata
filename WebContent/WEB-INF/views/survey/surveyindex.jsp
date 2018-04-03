<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-purple.css">
<!-- <style>
html, body, h1, h2, h3, h4, h5, h6 {
  font-family: "Comic Sans MS";
}
</style> -->

<div class="w3-container">

	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">매칭 후기 설문조사</h1>
	</header>

	<div class="w3-row w3-text-theme" >
		<div class="w3-col w3-container l4"></div>
		<div class="w3-col w3-center w3-container l4">
			<div class="w3-container w3-margin-top w3-center" style="width: 550px;">
				<form class="w3-card-4">
					<div class="w3-margin-top">
						<br/><br/>
						<img src="/image/survey.png">
					</div>
					<div>
						<small style="color:green"><b>설문조사를 완료하신 분들께는 추첨을 통하여 기프트콘을 선물해 드립니다!!</b></small><br/>
						<small style="color:red"><b>설문조사는 한 아이디당, 한 번만 가능하오니 신중하게 임해주세요^^</b></small>
					</div>
					<div>
						<a href="/survey/survey.do"><button type="button"
							class="w3-button w3-section w3-theme-l2 w3-ripple" id="survey_go" ${empty survey_record? '':'disabled' }>
							<b style="color: white">설문조사 하러가기</b>
						</button></a> <a href="/survey/surveytotalresult.do"><button type="button"
							class="w3-button w3-section w3-theme-l2 w3-ripple" id="survey_rst">
							<b style="color: white">설문조사 결과보기</b>
						</button></a>
					</div>

				</form>
			</div>
		</div>
		<div class="w3-col w3-container l4"></div>
	</div>
	

	<div class="w3-display-container" style="height: 50%;">
		<div class="w3-display-middle w3-padding"></div>
	</div>
</div>