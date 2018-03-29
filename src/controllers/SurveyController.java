package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/survey")
public class SurveyController {
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
