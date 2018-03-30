package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

@Controller
@RequestMapping("/survey")
public class SurveyController {
	/*@Autowired
	SurveyDAO sdao;*/
	
	@Autowired
	Gson gson;
	
	/*// 몽고테스트
	@RequestMapping(path="/test.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> addTest(@RequestBody Map<String,Object> info) {
		Map retVal = new HashMap<String, Object>();
		
		userModifyService
	}*/
	
	// 매칭 후기 메인
	@RequestMapping("/surveyindex.do")
	public String surveyIndexHandle() {
		
	return "surveyindex";
	}
	
	// 매칭 후기 설문조사판
	@RequestMapping("/survey.do")
	public String serveyHandle() {
			
	return "survey";
	}
	
	// 매칭 후기 설문조사결과
	@RequestMapping("/surveyrst.do")
	public String serveyResultHandle() {
	
		
	return "surveyrst";
			
	}
}
