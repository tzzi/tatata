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
		
		int rst = qdao.qnaWrite(map);
		modelMap.put("qnalist", qdao.readAllqna());
		if (rst == 1) {
			req.setAttribute("rst", "1", 0);
		} else {
			req.setAttribute("rst", "0", 0);
		}

		return "qnaboard";
	}

	@RequestMapping("/detail.do")
	public String detailHandle(@RequestParam int q_no, ModelMap modelMap, HttpServletResponse response,
			HttpServletRequest request) {
		modelMap.put("qnadetail", qdao.detailqna(q_no));
		modelMap.put("qnadetaillist", qdao.detail(q_no));

		Cookie setCookie = new Cookie("count"+q_no, "1"); // 쿠키 생성
		setCookie.setMaxAge(60 * 60 * 24); // 기간을 하루로 지정
		response.addCookie(setCookie);

		Cookie[] getCookie = request.getCookies();

		if (getCookie != null) {

			for (int i = 0; i < getCookie.length; i++) {

				Cookie c = getCookie[i];
				String name = c.getName(); // 쿠키 이름 가져오기				
				System.out.println(name);
				//동일이름의 쿠기가 있다면
				if(name.equals("count"+q_no)) {
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


	@RequestMapping(path = "/addlike.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String addlikeController(@RequestParam int q_no,HttpServletResponse response,
			HttpServletRequest request) {
		
		Cookie setCookie = new Cookie("like"+q_no,"1");
		setCookie.setMaxAge(60*60*24);//재 좋아요 기간 하루	
		response.addCookie(setCookie);//쿠키 추가
		
		Cookie[] getCookie = request.getCookies();//쿠키 가져오기
		
		if(getCookie != null) {
			for(int i=0;i<getCookie.length;i++) {
				Cookie c = getCookie[i];
				String name = c.getName();
				System.out.println("좋아요 쿠키 이름"+name);
				
				
				String a = "0";//반환값
				
				if(name.equals("like"+q_no)) {
					System.out.println("좋아요-> 동일 쿠키가 존재함");
					return "[{\"result\":" + a + "}]";
				}else {
					System.out.println("좋아요-> 동일 이름의 쿠키가 존재하지 안음");
				}
				
			}
			String a = "0";//반환값
			int rst = qdao.like(q_no);
			if(rst==1) {
				a = "1";
				return "[{\"result\":" + a + "}]";
			}
		}
		return null;
		
		
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
}
