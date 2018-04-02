package controllers;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import beans.SurveyDAO;

@Controller
@RequestMapping("/survey")
public class SurveyController {
	@Autowired
	SurveyDAO sdao;
	
	@Autowired
	Gson gson;
	
	// 매칭 후기 메인
	@RequestMapping("/surveyindex.do")
	public String surveyIndexHandle(HttpSession session) {
		String id = (String)session.getAttribute("userId");
		
//		System.out.println(sdao.loadIdfromSurvey(id));
		if(sdao.loadIdfromSurvey(id)!= null) {
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
	return "surveyrst";
	// 완료되면 경로 바꿀 것!!
	}
	
	// 전체 사람들의 설문조사 결과보기
	@RequestMapping(path="/surveytotalresult.do") //, method=RequestMethod.POST
	public String serveyTotalResultHandle(HttpSession session, ModelMap map) {
		String id = (String)session.getAttribute("userId");
//		System.out.println(sdao.loadIdfromSurvey(id));;
		//{TOTAL=5, M_COMMUNI=3, M_FIRST=4, M_MORAL=4, M_MEET=2, ID=www, MATCH_TYPE=2, M_PR_TIME=5}
//		System.out.println(sdao.loadIdfromSurvey(id).get("TOTAL"));
		
//		System.out.println("total 값 리스트로 뽑기 " + sdao.loadallSurvey());
//		System.out.println("평균값 구하기 " + sdao.averageForEachSurvey());
		//  {COUNT(*)=5, AVG(M_FIRST)=4.2, AVG(M_MEET)=2.2, AVG(M_PR_TIME)=4.4, AVG(M_MORAL)=4, AVG(TOTAL)=4.6}
//		System.out.println("평균값 구하기 키로겟 " + sdao.averageForEachSurvey().get("AVG(M_FIRST)"));
		map.put("avg_m_first", sdao.averageForEachSurvey().get("AVG(M_FIRST)"));
		map.put("avg_m_meet", sdao.averageForEachSurvey().get("AVG(M_MEET)"));
		map.put("avg_m_pr_time", sdao.averageForEachSurvey().get("AVG(M_PR_TIME)"));
		map.put("avg_m_moral", sdao.averageForEachSurvey().get("AVG(M_MORAL)"));
		map.put("avg_total", sdao.averageForEachSurvey().get("AVG(TOTAL)"));
		System.out.println(map);
		
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