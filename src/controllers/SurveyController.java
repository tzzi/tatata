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
		System.out.println("가입자 남녀비율 1번째 : " + sdao.genderrate().get(1));
		System.out.println("담력도 : " + sdao.fearrate());
		System.out.println("담력도 : " + sdao.fearrate().get(0));
		System.out.println("담력도 : " + sdao.fearrate().get(1));
		System.out.println("담력도 : " + sdao.fearrate().get(2));
		System.out.println("매칭유형 : " + sdao.matchtyperank());
		System.out.println("매칭유형 : " + sdao.matchtyperank().get(0));
		System.out.println("매칭유형 : " + sdao.matchtyperank().get(1));
		System.out.println("매칭유형 : " + sdao.matchtyperank().get(2));
		
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