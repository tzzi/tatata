package controllers;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
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
		if(sdao.loadIdfromSurvey(id) == null) {
			
		} else {
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
	@RequestMapping("/surveytotalresult.do")
	public String serveyTotalResultHandle(HttpSession session) {
		String id = (String)session.getAttribute("userId");
//			System.out.println(sdao.loadIdfromSurvey(id));;
			//{TOTAL=5, M_COMMUNI=3, M_FIRST=4, M_MORAL=4, M_MEET=2, ID=www, MATCH_TYPE=2, M_PR_TIME=5}
//			System.out.println(sdao.loadIdfromSurvey(id).get("TOTAL"));
			
			System.out.println(sdao.loadallSurvey());
			System.out.println(sdao.loadallSurvey().size());
			
			
			
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