<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<div class="w3-container">

	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">매칭 후기 결과</h1>
	</header>


	<div class="w3-row w3-center" align="center">
		<div class="w3-col w3-center w3-container">
			<div class="w3-container w3-margin-top w3-center" style="width: 800px;">
				<form class="w3-card-4">
					<div class="w3-margin-top">
						평점평균
					</div>
					<div> 
						뭐지
					</div>
					<div>
						첫인상 평점평균 : ${avg_m_first }<br/>
						만남의사 평점평균 : ${avg_m_meet }<br/>
						약속시간 평점평균 : ${avg_m_pr_time }<br/>
						도덕성 평점평균 :${avg_m_moral }<br/>
						총점 평균 : ${avg_total }
					</div>
 
				</form>
			</div>
		</div>
	</div>


	<div class="w3-display-container" style="height: 50%;">
		<div class="w3-display-middle w3-padding"></div>
	</div>
</div>