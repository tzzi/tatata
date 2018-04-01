<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

${sessionScope.userNick} 님께서 선택한 설문조사 결과 <br/><br/>

id : ${sessionScope.userId}<br/>
total : ${survey_rst.total}<br/>
match_type : ${survey_rst.match_type}<br/>
m_first : ${survey_rst.m_first }<br/>
m_moral : ${survey_rst.m_moral }<br/>
m_meet : ${survey_rst.m_meet }<br/>
m_communi : ${survey_rst.m_communi }<br/>