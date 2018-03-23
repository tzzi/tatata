package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
}
