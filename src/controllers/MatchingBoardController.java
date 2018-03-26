package controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import beans.MatchingDAO;

@Controller
@RequestMapping("/matchingBoard")
public class MatchingBoardController {

	@Autowired
	MatchingDAO mdao;

	@RequestMapping("/matchingIndex.do")
	public String indexHandle(@RequestParam String nick, ModelMap modelMap) {
		modelMap.put("mypage", mdao.readmypage(nick));
		return "matchingIndex";
	}
	
	
	@RequestMapping("/matching.do")
	public String matchingHandle(@RequestParam String nick, ModelMap modelMap) {
		modelMap.put("matching",mdao.Matchingpage(nick));
		modelMap.put("mypage", mdao.readmypage(nick));
		return "matching";
	}
	@RequestMapping("/matching2.do")
	public String matching2Handle(@RequestParam String nick, ModelMap modelMap) {
		modelMap.put("matching2", mdao.Matchingpage2(nick));
		return "matching2";
	}
	@RequestMapping("/matchingcheck.do")
	public String matchingcheckHandle(@RequestParam String nick,ModelMap modelmap) {
		modelmap.put("matchingcheck", mdao.matchingcheck(nick));
		System.out.println(modelmap);
		return "matchingcheck";
	}
	
	@RequestMapping(path="/insertmatching.do", produces="application/json;charset=utf-8")
	
	@ResponseBody
	public String insertmatchingHandle(@RequestParam Map map, WebRequest req) {
		int rst = mdao.matchinginsert(map);
		String b = "1";
		if(rst==1) {
			b="1";
		}else {
			b = "2";
		}
		return "[{\"result\":" +b+"}]";
	}
}
