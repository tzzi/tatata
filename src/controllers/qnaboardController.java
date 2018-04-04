package controllers;

import java.util.LinkedHashMap;
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

import com.google.gson.Gson;

import beans.qnaDAO;

@Controller
@RequestMapping("/qnaboard")
public class qnaboardController {
	@Autowired
	qnaDAO qdao;
	@Autowired
	Gson gson;

	@RequestMapping("/qnaindex.do")
	public String indexHandle(ModelMap modelMap, HttpServletRequest req) {
		//modelMap.put("qnalist", qdao.readAllqna());
		Map map = new LinkedHashMap<>();
		int totalCount= qdao.countQna();
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
		
		modelMap.put("qnalist",  qdao.pagingQna(map));
		
		
		/*return "qnaboard";*/
		return "qnadetailExam";
	}
	@RequestMapping("/qnaindex2.do")
	public String indexHandle(ModelMap modelMap, HttpServletRequest req,@RequestParam int page) {
		Map map = new LinkedHashMap<>();
		int totalCount= qdao.countQna();
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
		
		modelMap.put("qnalist",  qdao.pagingQna(map));
		
		
		/*return "qnaboard";*/
		return "qnadetailExam";
		
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
		
			
		
		
		int rst = qdao.qnaWrite(map);
		modelMap.put("qnalist", qdao.readAllqna());
		if (rst == 1) {
			req.setAttribute("rst", "1", 0);
		} else {
			req.setAttribute("rst", "0", 0);
		}

		return "redirect:/qnaboard/qnaindex.do";
	}
//조회수, 글상세보기, 쿠키로 중복 조회수 막음(1일)
	@RequestMapping("/detail.do")
	public String detailHandle(@RequestParam int q_no, ModelMap modelMap, HttpServletResponse response,
			HttpServletRequest request,HttpSession session) {
		
		String id = (String) session.getAttribute("userId");
		modelMap.put("qnadetail", qdao.detailqna(q_no));//글상세
		modelMap.put("qnadetaillist", qdao.detail(q_no));//리플보기
		
		String likecheck = id+q_no;
		System.out.println("likecheck : "+ likecheck);
		modelMap.put("likecheck", qdao.checklike(likecheck));
		
		Cookie setCookie = new Cookie("count"+q_no+id, "조회수쿠키"); // 쿠키 생성
		setCookie.setMaxAge(60 * 60 * 24); // 기간을 하루로 지정
		response.addCookie(setCookie);

		Cookie[] getCookie = request.getCookies();

		if (getCookie != null) {

			for (int i = 0; i < getCookie.length; i++) {

				Cookie c = getCookie[i];
				String name = c.getName(); // 쿠키 이름 가져오기				
				System.out.println(name);
				//동일이름의 쿠기가 있다면
				if(name.equals("count"+q_no+id)) {
				System.out.println("동일이름의 쿠키가 존재함");
				return "qnadetail";
				}else {
					System.out.println("동일이름의 쿠기가 존재하지 않음");
				}
				
			}

			qdao.addcount(q_no);
		}
		return "qnadetail";

	}

	//리플쓰기
		@RequestMapping(path = "/detailwrite.do", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String detailwriteController(@RequestParam Map map, WebRequest req, ModelMap modelMap,
				@RequestParam int q_no,HttpSession session) {
			String nick = (String) session.getAttribute("userNick");
			map.put("nick", nick);
			int rst = qdao.qnareplywrite(map);
			modelMap.put("qnadetaillist", qdao.detail(q_no));
			modelMap.put("qnadetail", qdao.detailqna(q_no));
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
		
	
	
	
//좋아요 증가
	@RequestMapping(path = "/addlike.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String addlikeController(@RequestParam int q_no) {
		int rst = qdao.like(q_no);
		
		
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
	public String likecancelController(@RequestParam int q_no,HttpSession session) {
		String id = (String) session.getAttribute("userId");
		String likecheck = id+q_no;
		int rst = 0 ;
		String b = "0";
		System.out.println("좋아요 취소한다아!!");
		rst = qdao.deletelike(likecheck);
		qdao.subtractlike(q_no);
		if(rst==1) {
			b ="1";
		}else {
			b="2";
		}
		return "[{\"result\":" + b + "}]";
	}
	
	
	//중복확인
	@RequestMapping(path = "/overlap.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String overlapController(@RequestParam String overlap) {
		int rst = qdao.overlap(overlap);
		String b = "0";
		if (rst ==1) {
			b="1";
		}else {
			b="2";
		}
		return "[{\"result\":" + b + "}]";
	}
	@RequestMapping("/modified.do")
	public String modifiedController(@RequestParam Map map,ModelMap modelmap,HttpSession session ) {
		String nick = (String) session.getAttribute("userNick");
		
		modelmap.put("modified", map);
		
		System.out.println(modelmap);
		return "qnamodified";
		
	}
	@RequestMapping("/modifiedcomplete.do")
	public String modifiedcompleteHandle(@RequestParam int q_no,@RequestParam Map map,ModelMap modelmap,
			HttpSession session,HttpServletResponse response, HttpServletRequest request) {
		
		String id = (String) session.getAttribute("userId");
		
		qdao.update(map);
		
		modelmap.put("qnadetail", qdao.detailqna(q_no));//글상세
		modelmap.put("qnadetaillist", qdao.detail(q_no));//리플보기
		
		String likecheck = id+q_no;
		System.out.println("likecheck : "+ likecheck);
		modelmap.put("likecheck", qdao.checklike(likecheck));
		System.out.println("나와라 모델맵 : "+ modelmap);
		Cookie setCookie = new Cookie("count"+q_no+id, "조회수쿠키"); // 쿠키 생성
		setCookie.setMaxAge(60 * 60 * 24); // 기간을 하루로 지정
		response.addCookie(setCookie);

		Cookie[] getCookie = request.getCookies();

		if (getCookie != null) {

			for (int i = 0; i < getCookie.length; i++) {

				Cookie c = getCookie[i];
				String name = c.getName(); // 쿠키 이름 가져오기				
				System.out.println(name);
				//동일이름의 쿠기가 있다면
				if(name.equals("count"+q_no+id)) {
				System.out.println("동일이름의 쿠키가 존재함");
				return "qnadetail";
				}else {
					System.out.println("동일이름의 쿠기가 존재하지 않음");
				}
				
			}

			qdao.addcount(q_no);
		}
		
		
		
		return "qnadetail";
	}
	@RequestMapping(path="/Postsdelte.do",  produces="application/json;charset=utf-8")
	@ResponseBody
	public String deleteHandle(@RequestParam int q_no) {
		int rst1 = qdao.delete(q_no);
		int rst2 = qdao.deleteReply(q_no);
		String b = "0";
		if(rst1==1) {
			b = "1";
		}else {
			b = "2";
		}
		
		return "[{\"result\":" +b+"}]";
	}
	
}
