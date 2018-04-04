package controllers;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	
	//매칭 후기 게시판
	@RequestMapping("/matchingreview.do")
	public String matchingreviewHandle(ModelMap modelMap, HttpServletRequest req) {
		Map map = new LinkedHashMap<>();
		int totalCount= mdao.countmatching();
		int page = 1;
		System.out.println("글의 총 갯 수 : " + totalCount);
		int countlist = 10; // 한 화면에 보여줄 글의 갯수
		int countpage = 10;// [][]의 갯수
		System.out.println("page : " + page);
		
		int totalPage = totalCount / countlist;


		if (totalCount % countlist > 0) {
		    totalPage++;//
		}
		if (totalPage < page) {
		    page = totalPage;
		}
		
		int startPage = ((page - 1) / 10) * 10 + 1;  //

		int endPage = startPage + countpage - 1;  //
	
		if (endPage > totalPage) {

		    endPage = totalPage;

		}
		map.put("totalCount", totalCount);
		map.put("countlist", countlist);
		map.put("countpage", countpage);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("page", page);
		System.out.println(map);
		modelMap.put("paging", map);
		
		int start = page*10-9;
		System.out.println("start : " +start);
		int end = page*10;
		System.out.println("end : " + end);
		map.put("start", start);
		map.put("end",end);
		System.out.println("paging" + map);
		
		modelMap.put("matchinglist",  mdao.pagingmatching(map));
		
		
		return "matchingreview";
		
	}
	@RequestMapping("/matchingreview2.do")
	public String indexHandle(ModelMap modelMap, HttpServletRequest req,@RequestParam int page) {
		Map map = new LinkedHashMap<>();
		int totalCount= mdao.countmatching();
		System.out.println("글의 총 갯 수 : " + totalCount);
		int countlist = 10; // 한 화면에 보여줄 글의 갯수
		int countpage = 10;// [][]의 갯수
		System.out.println("page : " + page);
		
		int totalPage = totalCount / countlist;


		if (totalCount % countlist > 0) {
		    totalPage++;//
		}
		if (totalPage < page) {
		    page = totalPage;
		}
		
		int startPage = ((page - 1) / 10) * 10 + 1;  //

		int endPage = startPage + countpage - 1;  //
	
		if (endPage > totalPage) {

		    endPage = totalPage;

		}
		map.put("totalCount", totalCount);
		map.put("countlist", countlist);
		map.put("countpage", countpage);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("page", page);
		System.out.println(map);
		modelMap.put("paging", map);
		
		int start = page*10-9;
		System.out.println("start : " +start);
		int end = page*10;
		System.out.println("end : " + end);
		map.put("start", start);
		map.put("end",end);
		System.out.println("paging" + map);
		
		modelMap.put("matchinglist",  mdao.pagingmatching(map));

		return "matchingreview";
		
	}
	@RequestMapping("/writeform.do")
	public String wirteformHandle() {
		return "writeform";
	}
	@RequestMapping("/write.do")
	public String writeHandle(@RequestParam Map map, WebRequest req, ModelMap modelMap,HttpSession session) {
		
		String nick = (String) session.getAttribute("userNick");
		
		System.out.println("글쓰기 닉네임 : "+ nick);//닉네임 받아오기 
		
		System.out.println("Map"+map);

		map.put("writer", nick);
		
		System.out.println("Map put"+map);
		
			
		
		
		int rst = mdao.matchingWrite(map);
		if (rst == 1) {
			req.setAttribute("rst", "1", 0);
		} else {
			req.setAttribute("rst", "0", 0);
		}

		return "redirect:/matchingBoard/matchingreview.do";
	}
	
	
	
	
	
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
		int rst = 0;
		
		Map map = new LinkedHashMap<>();
		map = mdao.mybasketinfo(nick);
		System.out.println("update map"+map);
		rst=mdao.updateagree(map);
		
		if(rst==1) {
			modelMap.put("matching",mdao.Matchingpage(nick,id));
			modelMap.put("mypage", mdao.readmypage(nick));
			System.out.println(modelMap);			
			return "matching";
		}else {
			return "matchingIndex";
		}
		
	}
	
	//2차 매칭
	@RequestMapping("/matching2.do")
	public String matching2Handle(HttpSession session, ModelMap modelMap) {
		
		String nick = (String) session.getAttribute("userNick");
		
		String id = (String) session.getAttribute("userId");
		System.out.println("id : "+id);
		
		
		modelMap.put("matching2", mdao.Matchingpage2(nick, id));
		return "matching2";
	}
	//나의 매칭 상황 보기
	@RequestMapping("/matchingcheck.do")
	public String matchingcheckHandle(HttpSession session, ModelMap modelmap) {
		String nick = (String) session.getAttribute("userNick");
		System.out.println("매칭 상황보기");
		
		modelmap.put("matchingcheck", mdao.matchingcheck(nick));//내가 고를 상대
		
		modelmap.put("matchingforme", mdao.matchingforme(nick));//나를 고른 상대
		System.out.println(modelmap);
		
		return "matchingcheck";
	}
	//매칭 상황 등록
	@RequestMapping(path="/insertmatching.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public String insertmatchingHandle(@RequestParam Map map, WebRequest req) {
		int rst = mdao.matchinginsert(map);
		String b = "1";
		if(rst==1) {
			b="1";
		}else if(rst==2) {
			b="2";
		}
		else {
			b = "3";
		}
		return "[{\"result\":" +b+"}]";
	}
	@RequestMapping("/basketFix.do")
	public String basketFixHandle(ModelMap modelmap,HttpSession session) {
		String nick = (String) session.getAttribute("userNick");
		modelmap.put("myinfo", mdao.mybasketinfo(nick));
		
		return "basketFix";
	}
	
	//놀이기구 목록 삭제
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
	//매칭 동의
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
