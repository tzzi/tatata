<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<div class="w3-container">

	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">매칭 후기 결과</h1>
	</header>


	<div class="w3-row">
		<div class="w3-col w3-container">
			<div class="w3-container w3-margin-top" style="width: 800px;">
				<form class="w3-card-4">
					<div class="w3-margin-top"></div>
					<div></div>
					<div>
						
						<!-- 총점 평균 -->
						총점 평균<br/>
						<div class="w3-light-grey w3-round">
							<c:choose>
								<c:when test="${avg_total ge 4.5}">
									<div class="w3-container w3-round w3-blue" style="width: 90%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##"/>
									</div>
								</c:when>
								<c:when test="${avg_total ge 4.3 and avg_total lt 4.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 85%"><fmt:formatNumber value="${avg_total }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_total ge 4 and avg_total lt 4.3 }">
									<div class="w3-container w3-round w3-blue" style="width: 80%"><fmt:formatNumber value="${avg_total }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_total ge 3.5 and avg_total lt 4 }">
									<div class="w3-container w3-round w3-blue" style="width: 70%"><fmt:formatNumber value="${avg_total }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_total ge 3 and avg_total lt 3.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 60%"><fmt:formatNumber value="${avg_total }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_total ge 2.5 and avg_total lt 3 }">
									<div class="w3-container w3-round w3-blue" style="width: 50%"><fmt:formatNumber value="${avg_total }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_total ge 2 and avg_total lt 2.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 40%"><fmt:formatNumber value="${avg_total }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_total ge 1.5 and avg_total lt 2 }">
									<div class="w3-container w3-round w3-blue" style="width: 30%"><fmt:formatNumber value="${avg_total }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_total ge 1 and avg_total lt 1.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 20%"><fmt:formatNumber value="${avg_total }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_total ge 0.5 and avg_total lt 1 }">
									<div class="w3-container w3-round w3-blue" style="width: 10%"><fmt:formatNumber value="${avg_total }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_total ge 0.3 and avg_total lt 0.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 5%"><fmt:formatNumber value="${avg_total }" pattern="#.##"/></div>
								</c:when>
								<c:otherwise>
									<div class="w3-container w3-round w3-blue" style="width: 0%"><fmt:formatNumber value="${avg_total }" pattern="#.##"/></div>
								</c:otherwise>
							</c:choose>
						</div>
						
						<!-- 첫인상 평점평균 -->
						첫인상 평점평균<br/>
						<div class="w3-light-grey w3-round">
							<c:choose>
								<c:when test="${avg_m_first ge 4.5}">
									<div class="w3-container w3-round w3-blue" style="width: 90%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_first ge 4.3 and avg_m_first lt 4.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 85%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_first ge 4 and avg_m_first lt 4.3 }">
									<div class="w3-container w3-round w3-blue" style="width: 80%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_first ge 3.5 and avg_m_first lt 4 }">
									<div class="w3-container w3-round w3-blue" style="width: 70%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_first ge 3 and avg_m_first lt 3.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 60%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_first ge 2.5 and avg_m_first lt 3 }">
									<div class="w3-container w3-round w3-blue" style="width: 50%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_first ge 2 and avg_m_first lt 2.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 40%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_first ge 1.5 and avg_m_first lt 2 }">
									<div class="w3-container w3-round w3-blue" style="width: 30%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_first ge 1 and avg_m_first lt 1.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 20%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_first ge 0.5 and avg_m_first lt 1 }">
									<div class="w3-container w3-round w3-blue" style="width: 10%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_first ge 0.3 and avg_m_first lt 0.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 5%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:when>
								<c:otherwise>
									<div class="w3-container w3-round w3-blue" style="width: 0%"><fmt:formatNumber value="${avg_m_first }" pattern="#.##"/></div>
								</c:otherwise>
							</c:choose>
						</div>
						
						<!-- 만남의사 평점평균 -->
						만남의사 평점평균<br/>
						<div class="w3-light-grey w3-round">
							<c:choose>
								<c:when test="${avg_m_meet ge 4.5}">
									<div class="w3-container w3-round w3-blue" style="width: 90%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_meet ge 4.3 and avg_m_meet lt 4.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 85%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_meet ge 4 and avg_m_meet lt 4.3 }">
									<div class="w3-container w3-round w3-blue" style="width: 80%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_meet ge 3.5 and avg_m_meet lt 4 }">
									<div class="w3-container w3-round w3-blue" style="width: 70%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_meet ge 3 and avg_m_meet lt 3.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 60%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_meet ge 2.5 and avg_m_meet lt 3 }">
									<div class="w3-container w3-round w3-blue" style="width: 50%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_meet ge 2 and avg_m_meet lt 2.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 40%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_meet ge 1.5 and avg_m_meet lt 2 }">
									<div class="w3-container w3-round w3-blue" style="width: 30%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_meet ge 1 and avg_m_meet lt 1.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 20%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_meet ge 0.5 and avg_m_meet lt 1 }">
									<div class="w3-container w3-round w3-blue" style="width: 10%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_meet ge 0.3 and avg_m_meet lt 0.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 5%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:when>
								<c:otherwise>
									<div class="w3-container w3-round w3-blue" style="width: 0%"><fmt:formatNumber value="${avg_m_meet }" pattern="#.##"/></div>
								</c:otherwise>
							</c:choose>
						</div>
						
						<!-- 약속시간 평점평균 -->
						약속시간 평점평균<br/>
						<div class="w3-light-grey w3-round">
							<c:choose>
								<c:when test="${avg_m_pr_time ge 4.5}">
									<div class="w3-container w3-round w3-blue" style="width: 90%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 4.3 and avg_m_pr_time lt 4.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 85%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 4 and avg_m_pr_time lt 4.3 }">
									<div class="w3-container w3-round w3-blue" style="width: 80%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 3.5 and avg_m_pr_time lt 4 }">
									<div class="w3-container w3-round w3-blue" style="width: 70%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 3 and avg_m_pr_time lt 3.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 60%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 2.5 and avg_m_pr_time lt 3 }">
									<div class="w3-container w3-round w3-blue" style="width: 50%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 2 and avg_m_pr_time lt 2.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 40%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 1.5 and avg_m_pr_time lt 2 }">
									<div class="w3-container w3-round w3-blue" style="width: 30%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 1 and avg_m_pr_time lt 1.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 20%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 0.5 and avg_m_pr_time lt 1 }">
									<div class="w3-container w3-round w3-blue" style="width: 10%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 0.3 and avg_m_pr_time lt 0.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 5%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:when>
								<c:otherwise>
									<div class="w3-container w3-round w3-blue" style="width: 0%"><fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##"/></div>
								</c:otherwise>
							</c:choose>
						</div>
						
						
						<!-- 도덕성 평점평균 -->
						도덕성 평점평균<br/>
						<div class="w3-light-grey w3-round">
							<c:choose>
								<c:when test="${avg_m_moral ge 4.5}">
									<div class="w3-container w3-round w3-blue" style="width: 90%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_moral ge 4.3 and avg_m_moral lt 4.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 85%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_moral ge 4 and avg_m_moral lt 4.3 }">
									<div class="w3-container w3-round w3-blue" style="width: 80%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_moral ge 3.5 and avg_m_moral lt 4 }">
									<div class="w3-container w3-round w3-blue" style="width: 70%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_moral ge 3 and avg_m_moral lt 3.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 60%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_moral ge 2.5 and avg_m_moral lt 3 }">
									<div class="w3-container w3-round w3-blue" style="width: 50%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_moral ge 2 and avg_m_moral lt 2.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 40%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_moral ge 1.5 and avg_m_moral lt 2 }">
									<div class="w3-container w3-round w3-blue" style="width: 30%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_moral ge 1 and avg_m_moral lt 1.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 20%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_moral ge 0.5 and avg_m_moral lt 1 }">
									<div class="w3-container w3-round w3-blue" style="width: 10%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_moral ge 0.3 and avg_m_moral lt 0.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 5%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:when>
								<c:otherwise>
									<div class="w3-container w3-round w3-blue" style="width: 0%"><fmt:formatNumber value="${avg_m_moral }" pattern="#.##"/></div>
								</c:otherwise>
							</c:choose>
							
						<!-- 원활한 대화 평점평균 -->
						대화 평점평균<br/>
						<div class="w3-light-grey w3-round">
							<c:choose>
								<c:when test="${avg_m_communi ge 4.5}">
									<div class="w3-container w3-round w3-blue" style="width: 90%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_communi ge 4.3 and avg_m_communi lt 4.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 85%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_communi ge 4 and avg_m_communi lt 4.3 }">
									<div class="w3-container w3-round w3-blue" style="width: 80%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_communi ge 3.5 and avg_m_communi lt 4 }">
									<div class="w3-container w3-round w3-blue" style="width: 70%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_communi ge 3 and avg_m_communi lt 3.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 60%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_communi ge 2.5 and avg_m_communi lt 3 }">
									<div class="w3-container w3-round w3-blue" style="width: 50%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_communi ge 2 and avg_m_communi lt 2.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 40%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_communi ge 1.5 and avg_m_communi lt 2 }">
									<div class="w3-container w3-round w3-blue" style="width: 30%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_communi ge 1 and avg_m_communi lt 1.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 20%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_communi ge 0.5 and avg_m_communi lt 1 }">
									<div class="w3-container w3-round w3-blue" style="width: 10%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:when>
								<c:when test="${avg_m_communi ge 0.3 and avg_m_communi lt 0.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 5%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:when>
								<c:otherwise>
									<div class="w3-container w3-round w3-blue" style="width: 0%"><fmt:formatNumber value="${avg_m_communi }" pattern="#.##"/></div>
								</c:otherwise>
							</c:choose>
						
						
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="w3-display-container" style="height: 50%;">
		<div class="w3-display-middle w3-padding"></div>
	</div>
</div>