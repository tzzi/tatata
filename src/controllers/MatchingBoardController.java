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
		System.out.println("mypage작업 완료");
		modelMap.put("mybasket", mdao.readmybasket(nick));
		
		modelMap.put("checkagree", mdao.checkagree(nick));
		
		System.out.println("modelMap : "+modelMap);
		
		
		return "matchingIndex";
	}
	
	//1차 매칭
	@RequestMapping("/matching.do")
	public String matchingHandle(HttpSession session, ModelMap modelMap) {
		
		String nick = (String) session.getAttribute("userNick");
		String id = (String) session.getAttribute("userId");
		
		
		modelMap.put("matching",mdao.Matchingpage(nick,id));
		//modelMap.put("mypage", mdao.readmypage(nick));
		
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
	@RequestMapping("/basketFix.do")
	public String basketFixHandle(ModelMap modelmap,HttpSession session) {
		String nick = (String) session.getAttribute("userNick");
		modelmap.put("myinfo", mdao.mybasketinfo(nick));
		
		return "basketFix";
	}
	
	//딜리트
	@RequestMapping(path="/delete.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public String deletebasketHandle(@RequestParam String nick,@RequestParam String no) {
		int rst = mdao.deletebasket(nick, no);
		String b = "11";
		if(rst==1) {
			b="1";
		}else {
			b="2";
		}
		return "[{\"result\":" +b+"}]";
	}

	@RequestMapping(path="/agree.do",  produces="application/json;charset=utf-8")
	@ResponseBody
	public String agreeHandle(HttpSession session) {
		Map map1 = new LinkedHashMap<>();
		Map map2 = new LinkedHashMap<>();
		Map map3 = new LinkedHashMap<>();
		String b = "11";
		String nick = (String) session.getAttribute("userNick");
		String id = (String) session.getAttribute("userId");
				
		
		map1 = mdao.addinfo(id);
		map2 = mdao.readmybasketinfo(nick);
		
		System.out.println("정보 불러오기 완료");
		
		map3.putAll(map1);			
		map3.putAll(map2);	
		System.out.println("map3 : "+ map3);
		map3.put("id", id);
		map3.put("nick", nick);
		
		int rst = mdao.agree(map3);
		System.out.println("막rst : " +rst);
		if(rst==1) {
			b="1";
		}else if(rst==2) {
			b="2";
		}
		return "[{\"result\":" +b+"}]";
	}
}
