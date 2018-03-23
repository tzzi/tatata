package controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import beans.JoinDAO;
import beans.MyPageDAO;
import service.EmailAuthService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	JoinDAO dao;
	@Autowired
	MyPageDAO mdao;

	@Autowired
	EmailAuthService authservice;
	
	// 마이페이지 첫화면
	@RequestMapping("/mypageindex.do")
	public String joinindexHandle() {
		return "mypageindex";
	}
	
	// 정보수정
	@RequestMapping("/modify.do")
	public String modyfyHandler() {
		
		return "modify";
	}
	
	// 추가 정보에 정보 불러오기 - 정보 있으면 disabled되어 정보 불러옴 / 정보 없으면 인증할 수 있도록 열어둠
	@RequestMapping("/addinfo.do")
	public String addinfoHandle(@CookieValue(name="id") String id, HttpServletRequest req) {
		/*System.out.println(mdao.addinfoload(id).get("ID"));*/
		/*if(mdao.addinfoload(id) != null);*/
		
		HttpSession session = req.getSession();
		session.setAttribute("email", "");
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		
		System.out.println("mdao.addinfoload(id)" + mdao.addinfoload(map));
		
		if(mdao.addinfoload(map) != null) {
			session.setAttribute("email", mdao.addinfoload(map).get("EMAIL"));
			session.setAttribute("fear", mdao.addinfoload(map).get("FEAR"));
			session.setAttribute("birth_y", mdao.addinfoload(map).get("BIRTH_Y"));
			session.setAttribute("birth_m", mdao.addinfoload(map).get("BIRTH_M"));
			session.setAttribute("birth_d", mdao.addinfoload(map).get("BIRTH_D"));
			session.setAttribute("gender", mdao.addinfoload(map).get("GENDER"));
			session.setAttribute("matchtype", mdao.addinfoload(map).get("MATCHTYPE"));
			session.setAttribute("area", mdao.addinfoload(map).get("AREA"));
			session.setAttribute("intro", mdao.addinfoload(map).get("INTRO"));
		}
		
		return "addinfo";
	}
	
	// 인증 받은 사람 - 정보 추가 입력
	@RequestMapping("/addinforst.do")
	public String modfiyinfoHandle(@RequestParam Map param, ModelMap map) {
		System.out.println("addinfo에서 넘어온 파라미터값 " +param);
		String id = (String)param.get("id");
		String email = (String)param.get("email");
		Integer gender = Integer.parseInt((String)param.get("gender"));
		Integer birth_y = Integer.parseInt((String)param.get("birth_y"));
		Integer birth_m = Integer.parseInt((String)param.get("birth_m"));
		Integer birth_d = Integer.parseInt((String)param.get("birth_d"));
		String area = (String)param.get("area");
		Integer fear = Integer.parseInt((String)param.get("fear"));
		Integer matchtype = Integer.parseInt((String)param.get("matchtype"));
		String intro = (String)param.get("intro");
		
		map.put("id", id);
		map.put("email", email);
		map.put("gender", gender);
		map.put("birth_y", birth_y);
		map.put("birth_m", birth_m);
		map.put("birth_d", birth_d);
		map.put("area", area);
		map.put("fear", fear);
		map.put("matchtype", matchtype);
		map.put("intro", intro);
		System.out.println("넘길 맵 : " +map);
		
		int rst = mdao.addinfo(map);
		if(rst==1) {
			return "addinfo";
		} else {
			return "redirect:/mypage/addinforst.do";
		}
		
	}
	
	// 인증키 보내기
	@RequestMapping(path="/sendKey.do", produces="application/json;charset=utf-8")
	public String accountSendKeyHandle(@RequestParam String email, HttpServletRequest req, HttpServletResponse resp) {
		String result = authservice.sendAuthKey(email);
		if(result == null) {
			return "redirect:/mypage/addinfo.do";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("key", result);
			session.setAttribute("email", email);
			System.out.println("key " + result);
			return "addinfo";
		}
	}
	
	// 인증키 확인하기
	@RequestMapping(path = "/confirmKey.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public String confirmKeyHandle(@RequestParam("key") String param, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String key = (String) session.getAttribute("key");
		if(param.equals(key)) {
			System.out.println("키값 일치");
			return "{\"rst\": true}";
		}else {
			System.out.println("키값 불일치");
			return "{\"rst\": false }";
		}
		/*System.out.println("세션저장값 : " + session.getAttribute("key"));
		System.out.println("파라미터값 == session : " + key.equals(session.getAttribute("key")));
		System.out.println("넘어온파라미터 키값" + key);*/
		
	}
}














