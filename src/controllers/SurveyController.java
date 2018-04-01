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
	public String serveyResultHandle(@RequestParam Map param, HttpSession session, ModelMap map) {
		System.out.println(param);
		String id = (String)session.getAttribute("userId");
		System.out.println("session에서 넘어온 아이디 : " + id);
		param.put("id", id);
		System.out.println(param);
		sdao.insertSurvey(param);
		
		map.put("survey_rst", param);
		System.out.println(map);
	return "surveyrst";
			
	}
}
/*// 몽고테스트
@RequestMapping(path="/test.do", produces="application/json;charset=utf-8")
@ResponseBody
public Map<String, Object> addTest(@RequestBody Map<String,Object> info) {
	Map retVal = new HashMap<String, Object>();
	
	userModifyService
}*/