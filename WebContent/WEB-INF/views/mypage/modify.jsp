<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div align="center" style="min-height: 80%">
		<!-- Section 영역 -->
		<h3>M O D I F Y &nbsp; I N F O R M A T I O N</h3>
		<br/>
		<form action="/mypage/modifyrst.do" autocomplete="off" method="post">
			
			<table>
				<tr>
					<th height="50px">아이디</th>
					<td></td>
					<td align="center"><input type="text"  value="${cookie.id.value }" disabled
					style="padding: 8px; font-size: 12pt; width: 220px;"/><input type="hidden" name="id" value="${cookie.id.value }"/>
				</tr>
				
				<tr>
					<th height="50px">닉네임</th>
					<td></td>
					<td align="center"><input type="text" name="nick" value="${cookie.nick.value }" disabled
					style="padding: 8px; font-size: 12pt; width: 220px;"/>
				</tr>
				<tr>
					<th height="50px">이메일</th>
					<td></td>
					<td align="center">
						<input type="text" name="email" value="${email }" placeholder="이메일"
						style="padding: 8px; font-size: 12pt; width: 220px;"  ${ empty email? 'disabled':'' }/>
					 </td>
				</tr>
				<tr>
					<th height="50px">성별</th>
					<td></td>
					<td align="center">
						<input type="radio"  ${ gender eq 1 ? 'checked':'' }  name="gender" id="man" value="1" class="authsuccess" ${ empty email? 'disabled':'' }/>
						<label for="man">남성</label>
						<input type="radio"  ${ gender eq 2 ? 'checked':'' }   name="gender" id="woman" value="2" class="authsuccess" ${ empty email? 'disabled':'' }/>
						<label for="woman">여성</label>
					</td>
				</tr>
				
				<tr>
					<th height="50px">생년월일</th>
					<td></td>
					<td align="center"> 
					<c:choose>
						<c:when test="${empty email }">
						<fmt:formatDate value="${now}" pattern="yyyy년 MM월dd일 a hh시mm분 ss초"/> 
						<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy" var="thisYear"/>
						<fmt:formatDate value="<%=new java.util.Date()%>" pattern="MM" var="thisMonth"/>
						<fmt:formatDate value="<%=new java.util.Date()%>" pattern="dd" var="thisDate"/>
						    
						    <select name="birth_y" style="padding: 8px; font-size : 12pt; width:100px " disabled>
						      <c:forEach begin="1910" end="2018" varStatus="loop">
						       <option value="${loop.index}" <c:if test="${loop.index==thisYear}">SELECTED</c:if> >${loop.index}년
						      </c:forEach>
						   	</select>
						    <select name="birth_m" style="padding: 8px; font-size : 12pt; width:80px " disabled>
						      <c:forEach begin="1" end="12" varStatus="loop">
						       <option value="${loop.count}" <c:if test="${loop.index==thisMonth}">SELECTED</c:if>>${loop.count}월
						      </c:forEach>
						    </select>
						    <select name="birth_d" style="padding: 8px; font-size : 12pt; width:80px " disabled>
						      <c:forEach begin="1" end="31" varStatus="loop">
						       <option value="${loop.index}" <c:if test="${loop.index==thisDate}">SELECTED</c:if>>${loop.index}일
						      </c:forEach>
						    </select> 
						</c:when>
						
						<c:otherwise>
							<select name="birth_y" style="padding: 8px; font-size : 12pt; width:100px ">
								<option>${birth_y }</option>
							</select>
							
							<select name="birth_m" style="padding: 8px; font-size : 12pt; width:100px ">
								<option>${birth_m }</option>
							</select>
							
							<select name="birth_d" style="padding: 8px; font-size : 12pt; width:100px ">
								<option>${birth_d }</option>
							</select>
							
						</c:otherwise>
					</c:choose>	    
					
					</td>
				</tr>
	
				<tr>
					<th height="50px">사는 지역</th>
					<td></td>
					<td align="center">
					<c:choose>
						<c:when test="${empty email }">
							<select name="area" style="padding: 8px; font-size : 12pt; width:120px " class="authsuccess" disabled>
								<option>선택</option>		<option>서울</option>		<option>경기</option>
								<option>인천</option>		<option>부산</option>		<option>대구</option>
								<option>대전</option>		<option>세종</option>		<option>광주</option>
								<option>울산</option>		<option>강원</option>		<option>충청남도</option>	
								<option>충청북도</option>	<option>전라남도</option>	<option>전라북도</option>
								<option>경상남도</option>	<option>경상북도</option>	<option>제주도</option>
								<option>해외</option>		<option>기타</option>
							</select>
							
						</c:when>
						<c:otherwise>
							<select name="area" style="padding: 8px; font-size : 12pt; width:120px " class="authsuccess">
								<option>${area }</option>
							</select>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				
				<tr>
					<th height="50px">담력</th>
					<td></td>
					<td align="center">
					
						<input type="radio" ${ fear eq 1 ? 'checked':'' } name="fear" id="f_high" value="1" class="authsuccess" ${ empty email? 'disabled':'' }/>
						<label for="f_high">고수</label>
						<input type="radio" ${ fear eq 2 ? 'checked':'' } name="fear" id="f_middle" value="2"  class="authsuccess" ${ empty email? 'disabled':'' }/>
						<label for="f_middle">중수</label>
						<input type="radio" ${ fear eq 3 ? 'checked':'' } name="fear" id="f_low" value="3"  class="authsuccess" ${ empty email? 'disabled':'' }/>
						<label for="f_low">하수</label>
	
						
						
					</td>
				</tr>
				
				<tr>
					<th height="50px">매칭 유형</th>
					<td></td>
					<td align="center">
						<input type="radio" ${ matchtype eq 1 ? 'checked':'' } name="matchtype" id="m_same" value="1" class="authsuccess" ${ empty email? 'disabled':'' }/>
						<label for="m_same">동성</label>
						<input type="radio" ${ matchtype eq 2 ? 'checked':'' } name="matchtype" id="m_diff" value="2" class="authsuccess" ${ empty email? 'disabled':'' }/>
						<label for="m_diff">이성</label>
						<input type="radio" ${ matchtype eq 3 ? 'checked':'' } name="matchtype" id="m_nocare" value="3" class="authsuccess" ${ empty email? 'disabled':'' }/>
						<label for="m_nocare">상관없음</label>
					</td>
				</tr>
				
				<tr>
					<th height="50px">자기 소개</th>
					<td></td>
					<td align="center">
					<c:choose>
						<c:when test="${empty email }">
							<textarea rows="10" cols="100" name="intro" onclick="this.select()" onfocus="this.select()"
							style="padding: 8px; font-size: 12pt; width: 350px; height: 200px; resize:none;" class="authsuccess" disabled>
							자기소개를 마음껏 입력하세요.</textarea>
						</c:when>
						<c:otherwise>
							<textarea rows="10" cols="100" name="intro"
							style="padding: 8px; font-size: 12pt; width: 350px; height: 200px; resize:none;" class="authsuccess">
							${intro }</textarea>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				
				<tr>
					<td></td>
					<td colspan="2" align="center">
						<br/>
						<button type="submit" style="padding: 8px; font-size: 12pt; width: 120px">정보수정</button>
						<input type="reset" value="초기화" style="padding: 8px; font-size: 12pt; width: 100px">
						<a href="./mypageindex.do"><button type="button" class="btn btn-primary" style="padding: 8px; font-size: 12pt; width: 100px">이전으로</button></a>
					</td>
				</tr>
			</table>
				
					
			</form>	
					
	
</div>