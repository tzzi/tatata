package controllers;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import beans.MyPageDAO;
import beans.SurveyDAO;

@Controller
@RequestMapping("/survey")
public class SurveyController {
	@Autowired
	SurveyDAO sdao;
	
	@Autowired
	MyPageDAO mdao;
	
	@Autowired
	Gson gson;
	
	// 매칭 후기 메인
	@RequestMapping("/surveyindex.do")
	public String surveyIndexHandle(HttpSession session) {
		String id = (String)session.getAttribute("userId");
		Map param = new LinkedHashMap<>();
		param.put("id", id);
//		System.out.println(sdao.loadIdfromSurvey(id));
		System.out.println("가입자 남녀비율 : " + sdao.genderrate());
		System.out.println("가입자 남녀비율 0번째 : " + sdao.genderrate().get(0));
		System.out.println("가입자 남녀비율 0번째 CNT : " + sdao.genderrate().get(0).get("CNT"));
		System.out.println("가입자 남녀비율 1번째 : " + sdao.genderrate().get(1));
		BigDecimal man_cnt = (BigDecimal)sdao.genderrate().get(0).get("CNT");
		BigDecimal woman_cnt = (BigDecimal)sdao.genderrate().get(1).get("CNT");
		System.out.println("가입자 남자 수 : " + man_cnt.intValue());
		System.out.println("가입자 여자 수 : " + woman_cnt.intValue());
		System.out.println("가입자 전체 수 : " + (man_cnt.intValue()+woman_cnt.intValue()));
		int people_total = man_cnt.intValue() + woman_cnt.intValue();
		double man_rate = (double)man_cnt.intValue() / (double)people_total * 100;
		System.out.println("남자 비율 : " + man_rate);
		double woman_rate = (double)woman_cnt.intValue() / (double)people_total * 100;
		System.out.println("여자 비율 : " + woman_rate);
		
		
		System.out.println("담력도 : " + sdao.fearrate());
		System.out.println("담력도 1: " + sdao.fearrate().get(0));
		System.out.println("담력도 2: " + sdao.fearrate().get(1));
		System.out.println("담력도 3: " + sdao.fearrate().get(2));
		
		BigDecimal fear_1 = (BigDecimal)sdao.fearrate().get(0).get("CNT");
		BigDecimal fear_2 = (BigDecimal)sdao.fearrate().get(1).get("CNT");
		BigDecimal fear_3 = (BigDecimal)sdao.fearrate().get(2).get("CNT");
		
		int fear_1_cnt = fear_1.intValue();
		int fear_2_cnt = fear_2.intValue();
		int fear_3_cnt = fear_3.intValue();
		int fear_total = fear_1_cnt + fear_2_cnt + fear_3_cnt;
		
		double fear_1_rate = (double)fear_1_cnt / (double)fear_total * 100;
		double fear_2_rate = (double)fear_2_cnt / (double)fear_total * 100;
		double fear_3_rate = (double)fear_3_cnt / (double)fear_total * 100;
		
		System.out.println("담력도 1 비율 : " + fear_1_rate);
		System.out.println("담력도 2 비율 : " + fear_2_rate);
		System.out.println("담력도 3 비율 : " + fear_3_rate);
		
		
		System.out.println("매칭유형 : " + sdao.matchtyperank());
		System.out.println("매칭유형 1: " + sdao.matchtyperank().get(0));
		System.out.println("매칭유형 2: " + sdao.matchtyperank().get(1));
		System.out.println("매칭유형 3: " + sdao.matchtyperank().get(2));
		
		BigDecimal matchtype_1 = (BigDecimal)sdao.matchtyperank().get(0).get("CNT");
		BigDecimal matchtype_2 = (BigDecimal)sdao.matchtyperank().get(1).get("CNT");
		BigDecimal matchtype_3 = (BigDecimal)sdao.matchtyperank().get(2).get("CNT");
		
		int matchtype_1_cnt = matchtype_1.intValue();
		int matchtype_2_cnt = matchtype_2.intValue();
		int matchtype_3_cnt = matchtype_3.intValue();
		int matchtype_total = matchtype_1_cnt + matchtype_2_cnt + matchtype_3_cnt;
		
		double matchtype_1_rate = (double)matchtype_1_cnt / (double)matchtype_total * 100;
		double matchtype_2_rate = (double)matchtype_2_cnt / (double)matchtype_total * 100;
		double matchtype_3_rate = (double)matchtype_3_cnt / (double)matchtype_total * 100;
		
		System.out.println("매칭유형 1 비율 : " + matchtype_1_rate);
		System.out.println("매칭유형 2 비율 : " + matchtype_2_rate);
		System.out.println("매칭유형 3 비율 : " + matchtype_3_rate);
		
		System.out.println("지역별 차트 : " + sdao.areachart());
		System.out.println("지역 1위 : " + sdao.areachart().get(0).get("AREA"));
		System.out.println("지역 2위 : " + sdao.areachart().get(1).get("AREA"));
		System.out.println("지역 3위 : " + sdao.areachart().get(2).get("AREA"));
		System.out.println("지역 4위 : " + sdao.areachart().get(3).get("AREA"));
		System.out.println("지역 5위 : " + sdao.areachart().get(4).get("AREA"));
		
		
		if(sdao.loadIdfromSurvey(id)!= null && mdao.addinfoload(param)!=null) {
			session.setAttribute("survey_record", 1);
		} 
	return "surveyindex";
	}
	
	// 매칭 후기 설문조사판
	@RequestMapping("/survey.do")
	public String serveyHandle() {
			
	return "survey";
	}
	
	// 매칭 후기 설문조사결과
	@RequestMapping("/surveyrst.do")
	public String serveyResultHandle(@RequestParam Map param, HttpSession session, ModelMap map) {
		System.out.println(param);
		String id = (String)session.getAttribute("userId");
		/*System.out.println("session에서 넘어온 아이디 : " + id);*/
		param.put("id", id);
		System.out.println(param);
		sdao.insertSurvey(param);
		
		map.put("survey_rst", param);
		System.out.println(map);
	return "redirect:/survey/surveyindex.do";
	// 완료되면 경로 바꿀 것!!
	}
	
	// 전체 사람들의 설문조사 결과보기
	@RequestMapping(path="/surveytotalresult.do") //, method=RequestMethod.POST
	public String serveyTotalResultHandle(HttpSession session) {
		String id = (String)session.getAttribute("userId");
//		System.out.println(sdao.loadIdfromSurvey(id));;
		//{TOTAL=5, M_COMMUNI=3, M_FIRST=4, M_MORAL=4, M_MEET=2, ID=www, MATCH_TYPE=2, M_PR_TIME=5}
//		System.out.println(sdao.loadIdfromSurvey(id).get("TOTAL"));
		
//		System.out.println("total 값 리스트로 뽑기 " + sdao.loadallSurvey());
//		System.out.println("평균값 구하기 " + sdao.averageForEachSurvey());
		//  {COUNT(*)=5, AVG(M_FIRST)=4.2, AVG(M_MEET)=2.2, AVG(M_PR_TIME)=4.4, AVG(M_MORAL)=4, AVG(TOTAL)=4.6}
//		System.out.println("평균값 구하기 키로겟 " + sdao.averageForEachSurvey().get("AVG(M_FIRST)"));
		// 자리수.. 설정
		System.out.println("sdao.averageForEachSurvey() : " + sdao.averageForEachSurvey());
		session.setAttribute("avg_m_first", sdao.averageForEachSurvey().get("AVG(M_FIRST)"));
		session.setAttribute("avg_m_meet", sdao.averageForEachSurvey().get("AVG(M_MEET)"));
		session.setAttribute("avg_m_pr_time", sdao.averageForEachSurvey().get("AVG(M_PR_TIME)"));
		session.setAttribute("avg_m_moral", sdao.averageForEachSurvey().get("AVG(M_MORAL)"));
		session.setAttribute("avg_m_communi", sdao.averageForEachSurvey().get("AVG(M_COMMUNI)"));
		session.setAttribute("avg_total", sdao.averageForEachSurvey().get("AVG(TOTAL)"));
//		int avg_total = 0;
		/*BigDecimal total = (BigDecimal)sdao.averageForEachSurvey().get("AVG(TOTAL)");
		System.out.println(total.doubleValue()); // doubleValue로 뽑아 쓸 수 있음
*/		/*avg_total = Integer.parseInt((String) sdao.averageForEachSurvey().get("AVG(TOTAL)"));*/
		
		/*System.out.println("토탈값 : " + total);*/
		
	return "surveytotalresult";
	}
	
}
/*// 몽고테스트
@RequestMapping(path="/test.do", produces="application/json;charset=utf-8")
@ResponseBody
public Map<String, Object> addTest(@RequestBody Map<String,Object> info) {
	Map retVal = new HashMap<String, Object>();
	
	userModifyService
}*/