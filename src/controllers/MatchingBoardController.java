package controllers;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	//마이페이지 
	@RequestMapping("/matchingIndex.do")
	public String indexHandle(ModelMap modelMap,HttpSession session) {
		
		String nick = (String) session.getAttribute("userNick");
		System.out.println("nick : "+ nick);

		String id = (String) session.getAttribute("userId");
		System.out.println("id : "+id);
		
		modelMap.put("mypage", mdao.readmypage(id));
		System.out.println(modelMap);
		return "matchingIndex";
	}
	
	
	@RequestMapping("/matching.do")
	public String matchingHandle(HttpSession session, ModelMap modelMap) {
		
		String nick = (String) session.getAttribute("userNick");
		
		modelMap.put("matching",mdao.Matchingpage(nick));
		modelMap.put("mypage", mdao.readmypage(nick));
		return "matching";
	}
	@RequestMapping("/matching2.do")
	public String matching2Handle(HttpSession session, ModelMap modelMap) {
		
		String nick = (String) session.getAttribute("userNick");
		
		modelMap.put("matching2", mdao.Matchingpage2(nick));
		return "matching2";
	}
	@RequestMapping("/matchingcheck.do")
	public String matchingcheckHandle(HttpSession session, ModelMap modelmap) {
		String nick = (String) session.getAttribute("userNick");
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
