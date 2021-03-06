<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-purple.css">

<div class="w3-container" align="center">
	<header class="w3-container w3-pale-red">
		<h1 style="color: white" align="center">R E S U L T &nbsp; S U R
			V E Y</h1>
	</header>
	<br />

	<div class="w3-container w3-margin-top w3-center" style="width: 1000px;">
		<form class="w3-card-4 w3-center">
			<div align="center" class="w3-margin-top">
			</div>
			<div class="w3-padding-large">
				<table class="w3-table-all w3-hoverable">
						<thead>
							<tr class="w3-light-grey">
								<th width="50%">질 문</th>
								<th width="50%">결 과 (평 균)</th>
							</tr>
						</thead>
						<tr>
							<td>매칭된 상대방에 대한 총평</td>
							<td>
							<div class="w3-light-grey w3-round">
							<c:choose>
								<c:when test="${avg_total ge 4.5}">
									<div class="w3-container w3-round w3-blue" style="width: 90%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_total ge 4.3 and avg_total lt 4.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 85%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_total ge 4 and avg_total lt 4.3 }">
									<div class="w3-container w3-round w3-blue" style="width: 80%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_total ge 3.5 and avg_total lt 4 }">
									<div class="w3-container w3-round w3-blue" style="width: 70%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_total ge 3 and avg_total lt 3.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 60%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_total ge 2.5 and avg_total lt 3 }">
									<div class="w3-container w3-round w3-blue" style="width: 50%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_total ge 2 and avg_total lt 2.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 40%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_total ge 1.5 and avg_total lt 2 }">
									<div class="w3-container w3-round w3-blue" style="width: 30%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_total ge 1 and avg_total lt 1.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 20%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_total ge 0.5 and avg_total lt 1 }">
									<div class="w3-container w3-round w3-blue" style="width: 10%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_total ge 0.3 and avg_total lt 0.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 5%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:when>
								<c:otherwise>
									<div class="w3-container w3-round w3-blue" style="width: 0%">
										<fmt:formatNumber value="${avg_total }" pattern="#.##" />
									</div>
								</c:otherwise>
							</c:choose>
							</div><br/>
							</td>
						</tr>
						<tr>
							<td>매칭 유형에 대한 만족도는?</td>
							<td>
								<div class="w3-light-grey w3-round">
								<c:choose>
									<c:when test="${avg_m_meet ge 4.5}">
										<div class="w3-container w3-round w3-blue" style="width: 90%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_meet ge 4.3 and avg_m_meet lt 4.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 85%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_meet ge 4 and avg_m_meet lt 4.3 }">
										<div class="w3-container w3-round w3-blue" style="width: 80%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_meet ge 3.5 and avg_m_meet lt 4 }">
										<div class="w3-container w3-round w3-blue" style="width: 70%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_meet ge 3 and avg_m_meet lt 3.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 60%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_meet ge 2.5 and avg_m_meet lt 3 }">
										<div class="w3-container w3-round w3-blue" style="width: 50%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_meet ge 2 and avg_m_meet lt 2.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 40%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_meet ge 1.5 and avg_m_meet lt 2 }">
										<div class="w3-container w3-round w3-blue" style="width: 30%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_meet ge 1 and avg_m_meet lt 1.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 20%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_meet ge 0.5 and avg_m_meet lt 1 }">
										<div class="w3-container w3-round w3-blue" style="width: 10%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_meet ge 0.3 and avg_m_meet lt 0.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 5%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:when>
									<c:otherwise>
										<div class="w3-container w3-round w3-blue" style="width: 0%">
											<fmt:formatNumber value="${avg_m_meet }" pattern="#.##" />
										</div>
									</c:otherwise>
								</c:choose>
							</div><br/>
							</td>
						</tr>
						<tr>
							<td>상대방의 첫인상에 대한 만족도는?</td>
							<td>
								<div class="w3-light-grey w3-round">
								<c:choose>
									<c:when test="${avg_m_first ge 4.5}">
										<div class="w3-container w3-round w3-blue" style="width: 90%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_first ge 4.3 and avg_m_first lt 4.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 85%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_first ge 4 and avg_m_first lt 4.3 }">
										<div class="w3-container w3-round w3-blue" style="width: 80%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_first ge 3.5 and avg_m_first lt 4 }">
										<div class="w3-container w3-round w3-blue" style="width: 70%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_first ge 3 and avg_m_first lt 3.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 60%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_first ge 2.5 and avg_m_first lt 3 }">
										<div class="w3-container w3-round w3-blue" style="width: 50%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_first ge 2 and avg_m_first lt 2.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 40%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_first ge 1.5 and avg_m_first lt 2 }">
										<div class="w3-container w3-round w3-blue" style="width: 30%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_first ge 1 and avg_m_first lt 1.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 20%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_first ge 0.5 and avg_m_first lt 1 }">
										<div class="w3-container w3-round w3-blue" style="width: 10%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_first ge 0.3 and avg_m_first lt 0.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 5%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:when>
									<c:otherwise>
										<div class="w3-container w3-round w3-blue" style="width: 0%">
											<fmt:formatNumber value="${avg_m_first }" pattern="#.##" />
										</div>
									</c:otherwise>
								</c:choose>
							</div><br/>
							</td>
						</tr>
						<tr>
							<td>상대방은 약속시간을 잘 지켰다</td>
							<td>
								<div class="w3-light-grey w3-round">
							<c:choose>
								<c:when test="${avg_m_pr_time ge 4.5}">
									<div class="w3-container w3-round w3-blue" style="width: 90%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 4.3 and avg_m_pr_time lt 4.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 85%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 4 and avg_m_pr_time lt 4.3 }">
									<div class="w3-container w3-round w3-blue" style="width: 80%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 3.5 and avg_m_pr_time lt 4 }">
									<div class="w3-container w3-round w3-blue" style="width: 70%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 3 and avg_m_pr_time lt 3.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 60%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 2.5 and avg_m_pr_time lt 3 }">
									<div class="w3-container w3-round w3-blue" style="width: 50%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 2 and avg_m_pr_time lt 2.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 40%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 1.5 and avg_m_pr_time lt 2 }">
									<div class="w3-container w3-round w3-blue" style="width: 30%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 1 and avg_m_pr_time lt 1.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 20%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 0.5 and avg_m_pr_time lt 1 }">
									<div class="w3-container w3-round w3-blue" style="width: 10%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:when>
								<c:when test="${avg_m_pr_time ge 0.3 and avg_m_pr_time lt 0.5 }">
									<div class="w3-container w3-round w3-blue" style="width: 5%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:when>
								<c:otherwise>
									<div class="w3-container w3-round w3-blue" style="width: 0%">
										<fmt:formatNumber value="${avg_m_pr_time }" pattern="#.##" />
									</div>
								</c:otherwise>
							</c:choose>
							</div><br />
							</td>
						</tr>
						<tr>
							<td>상대방의 도덕성에 대해 평가하자면?</td>
							<td>
								<div class="w3-light-grey w3-round">
								<c:choose>
									<c:when test="${avg_m_moral ge 4.5}">
										<div class="w3-container w3-round w3-blue" style="width: 90%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_moral ge 4.3 and avg_m_moral lt 4.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 85%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_moral ge 4 and avg_m_moral lt 4.3 }">
										<div class="w3-container w3-round w3-blue" style="width: 80%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_moral ge 3.5 and avg_m_moral lt 4 }">
										<div class="w3-container w3-round w3-blue" style="width: 70%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_moral ge 3 and avg_m_moral lt 3.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 60%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_moral ge 2.5 and avg_m_moral lt 3 }">
										<div class="w3-container w3-round w3-blue" style="width: 50%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_moral ge 2 and avg_m_moral lt 2.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 40%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_moral ge 1.5 and avg_m_moral lt 2 }">
										<div class="w3-container w3-round w3-blue" style="width: 30%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_moral ge 1 and avg_m_moral lt 1.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 20%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_moral ge 0.5 and avg_m_moral lt 1 }">
										<div class="w3-container w3-round w3-blue" style="width: 10%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_moral ge 0.3 and avg_m_moral lt 0.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 5%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:when>
									<c:otherwise>
										<div class="w3-container w3-round w3-blue" style="width: 0%">
											<fmt:formatNumber value="${avg_m_moral }" pattern="#.##" />
										</div>
									</c:otherwise>
								</c:choose>
							</div><br />
							</td>
						</tr>
						<tr>
							<td>상대방과 대화가 잘 통했다</td>
							<td>
								<div class="w3-light-grey w3-round">
								<c:choose>
									<c:when test="${avg_m_communi ge 4.5}">
										<div class="w3-container w3-round w3-blue" style="width: 90%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_communi ge 4.3 and avg_m_communi lt 4.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 85%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_communi ge 4 and avg_m_communi lt 4.3 }">
										<div class="w3-container w3-round w3-blue" style="width: 80%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_communi ge 3.5 and avg_m_communi lt 4 }">
										<div class="w3-container w3-round w3-blue" style="width: 70%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_communi ge 3 and avg_m_communi lt 3.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 60%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_communi ge 2.5 and avg_m_communi lt 3 }">
										<div class="w3-container w3-round w3-blue" style="width: 50%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_communi ge 2 and avg_m_communi lt 2.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 40%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_communi ge 1.5 and avg_m_communi lt 2 }">
										<div class="w3-container w3-round w3-blue" style="width: 30%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_communi ge 1 and avg_m_communi lt 1.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 20%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_communi ge 0.5 and avg_m_communi lt 1 }">
										<div class="w3-container w3-round w3-blue" style="width: 10%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:when>
									<c:when test="${avg_m_communi ge 0.3 and avg_m_communi lt 0.5 }">
										<div class="w3-container w3-round w3-blue" style="width: 5%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:when>
									<c:otherwise>
										<div class="w3-container w3-round w3-blue" style="width: 0%">
											<fmt:formatNumber value="${avg_m_communi }" pattern="#.##" />
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							</td>
						</tr>
						
				</table>
			</div>
		</form>
	</div>
</div>