package controllers;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
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
	public String indexHandle(ModelMap modelMap) {
		modelMap.put("qnalist", qdao.readAllqna());
		return "qnaboard";
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

//좋아요 증가
	@RequestMapping(path = "/addlike.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String addlikeController(@RequestParam int q_no) {
		int rst = qdao.like(q_no);
		
		String b = "0";
		if(rst==1) {
			b = "1";
		}else {
			b = "2";
		}
		return "[{\"result\":" + b + "}]";
				
	}
	
	
	
	
	@RequestMapping(path = "/detailwrite.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String detailwriteController(@RequestParam Map map, WebRequest req, ModelMap modelMap,
			@RequestParam int q_no) {
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
	
}
