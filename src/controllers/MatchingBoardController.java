package controllers;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	//글쓰기 화면 넘김
	@RequestMapping("/writeform.do")
	public String wirteformHandle() {
		return "mwriteform";
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
			System.out.println("매칭 글쓰기 들어감");
		} else {
			req.setAttribute("rst", "0", 0);
		}
		return "redirect:/matchingBoard/matchingreview.do";
	}
	//조회수, 글상세보기, 쿠키로 중복 조회수 막음(1일)
		@RequestMapping("/detail.do")
		public String detailHandle(@RequestParam int m_no, ModelMap modelMap, HttpServletResponse response,
				HttpServletRequest request,HttpSession session) {
			
			String id = (String) session.getAttribute("userId");
			modelMap.put("matchingdetail", mdao.detailmatching(m_no));//글상세
			modelMap.put("matchingdetaillist", mdao.detail(m_no));//리플보기
			
			String likecheck = id+m_no;
			System.out.println("likecheck : "+ likecheck);
			modelMap.put("likecheck", mdao.checklike(likecheck));
			Cookie setCookie = new Cookie("count"+m_no+id, "조회수쿠키"); // 쿠키 생성
			setCookie.setMaxAge(60 * 60 * 24); // 기간을 하루로 지정
			response.addCookie(setCookie);

			Cookie[] getCookie = request.getCookies();

			if (getCookie != null) {

				for (int i = 0; i < getCookie.length; i++) {

					Cookie c = getCookie[i];
					String name = c.getName(); // 쿠키 이름 가져오기				
					System.out.println(name);
					//동일이름의 쿠기가 있다면
					if(name.equals("count"+m_no+id)) {
					System.out.println("동일이름의 쿠키가 존재함");
					return "matchingdetail";
					}else {
						System.out.println("동일이름의 쿠기가 존재하지 않음");
					}
					
				}

				mdao.addcount(m_no);
			}
			return "matchingdetail";

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
		List<Map> list1 = new LinkedList<>();
		Map map1 = new LinkedHashMap<>();
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
			
			return "matching";
		}else {
			return "matchingIndex";
		}
		
	}
	
	//2차 매칭
	@RequestMapping("/matching2.do")
	public String matching2Handle(HttpSession session, ModelMap modelMap) {
		List<Map> list1 = new LinkedList<>();
		String nick = (String) session.getAttribute("userNick");
		
		String id = (String) session.getAttribute("userId");

		modelMap.put("matching2", mdao.Matchingpage2(nick, id));
		return "matching2";
	}
	//나의 매칭 상황 보기
	@RequestMapping("/matchingcheck.do")
	public String matchingcheckHandle(HttpSession session, ModelMap modelmap) {
		String nick = (String) session.getAttribute("userNick");
		System.out.println("매칭 상황보기");
		
		List<Map> list1 = new LinkedList<>();
		List<Map> list2 = new LinkedList<>();
		Map map1 = new LinkedHashMap<>();
		Map map2 = new LinkedHashMap<>();
		
		modelmap.put("matchingcheck", mdao.matchingcheck(nick));//내가 고를 상대
		list1.addAll(mdao.matchingcheck(nick));
		System.out.println(list1.size());
		map1.put("list1", list1.size());//없으면 0
		modelmap.put("list1", map1);
		
		modelmap.put("matchingforme", mdao.matchingforme(nick));//나를 고른 상대
		list2.addAll(mdao.matchingforme(nick));
		System.out.println(list2.size());
		map2.put("list2", list2.size());
		modelmap.put("list2", map2);
		
		System.out.println(modelmap);
		
		return "matchingcheck";
	}
	
	//글 수정하기
	@RequestMapping("/modified.do")
	public String modifiedHandle(@RequestParam Map map,ModelMap modelmap,HttpSession session) {
		String nick = (String) session.getAttribute("userNick");
	
		modelmap.put("modified", map);
		System.out.println(modelmap);
		return "modified";
		
	}
	@RequestMapping("/modifiedcomplete.do")
	public String modifiedcompleteHandle(@RequestParam int m_no,@RequestParam Map map,ModelMap modelmap,
			HttpSession session,HttpServletResponse response, HttpServletRequest request) {
		
		String id = (String) session.getAttribute("userId");
		
		mdao.update(map);
		
		modelmap.put("matchingdetail", mdao.detailmatching(m_no));//글상세
		modelmap.put("matchingdetaillist", mdao.detail(m_no));//리플보기
		
		String likecheck = id+m_no;
		System.out.println("likecheck : "+ likecheck);
		modelmap.put("likecheck", mdao.checklike(likecheck));
		Cookie setCookie = new Cookie("count"+m_no+id, "조회수쿠키"); // 쿠키 생성
		setCookie.setMaxAge(60 * 60 * 24); // 기간을 하루로 지정
		response.addCookie(setCookie);

		Cookie[] getCookie = request.getCookies();

		if (getCookie != null) {

			for (int i = 0; i < getCookie.length; i++) {

				Cookie c = getCookie[i];
				String name = c.getName(); // 쿠키 이름 가져오기				
				System.out.println(name);
				//동일이름의 쿠기가 있다면
				if(name.equals("count"+m_no+id)) {
				System.out.println("동일이름의 쿠키가 존재함");
				return "matchingdetail";
				}else {
					System.out.println("동일이름의 쿠기가 존재하지 않음");
				}
				
			}

			mdao.addcount(m_no);
		}
		
		
		
		return "matchingdetail";
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
	@RequestMapping(path="/Postsdelete.do",  produces="application/json;charset=utf-8")
	@ResponseBody
	public String deleteHandle(@RequestParam int m_no) {
		int rst1 = mdao.delete(m_no);
		int rst2 = mdao.deleteReply(m_no);
		String b = "0";
		if(rst1==1) {
			b = "1";
		}else {
			b = "2";
		}
		
		return "[{\"result\":" +b+"}]";
	}
	//리플쓰기
			@RequestMapping(path = "/detailwrite.do", produces = "application/json;charset=utf-8")
			@ResponseBody
			public String detailwriteController(@RequestParam Map map, WebRequest req, ModelMap modelMap,
					@RequestParam int m_no,HttpSession session) {
				String nick = (String) session.getAttribute("userNick");
				map.put("nick", nick);
				int rst = mdao.matchingreplywrite(map);
				modelMap.put("qnadetaillist", mdao.detail(m_no));
				modelMap.put("qnadetail", mdao.detailmatching(m_no));
				System.out.println("2 : " +modelMap);
				String b = "1";
				if (rst == 1) {
					req.setAttribute("rst", "1", 0);
					b = "1";
				} else {
					req.setAttribute("rst", "0", 0);
					b = "2";
				}
				
				return "[{\"result\":" + b + "}]";
			}

			//중복확인
			@RequestMapping(path = "/overlap.do", produces = "application/json;charset=utf-8")
			@ResponseBody
			public String overlapController(@RequestParam String overlap) {
				int rst = mdao.overlap(overlap);
				
				String b = "0";
				if (rst ==1) {
					b="1";
				}else {
					b="2";
				}
				return "[{\"result\":" + b + "}]";
			}
			
			//좋아요 증가
			@RequestMapping(path = "/addlike.do", produces = "application/json;charset=utf-8")
			@ResponseBody
			public String addlikeController(@RequestParam int m_no) {
				int rst = mdao.like(m_no);
				
				
				String b = "0";
				if(rst==1) {
					b = "1";
				}else{
					b = "2";
				}
				return "[{\"result\":" + b + "}]";
						
			}
			//좋아요 취소,좋아요수 빼기
			@RequestMapping(path = "/likecancel.do", produces = "application/json;charset=utf-8")
			@ResponseBody
			public String likecancelController(@RequestParam int m_no,HttpSession session) {
				String id = (String) session.getAttribute("userId");
				String likecheck = id+m_no;
				int rst = 0 ;
				String b = "0";
				System.out.println("좋아요 취소한다아!!");
				rst = mdao.deletelike(likecheck);
				mdao.subtractlike(m_no);
				if(rst==1) {
					b ="1";
				}else {
					b="2";
				}
				return "[{\"result\":" + b + "}]";
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
}
