package controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import beans.JoinDAO;
import service.EmailAuthService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	JoinDAO dao;

	@Autowired
	EmailAuthService authservice;
	
	@RequestMapping("/mypageindex.do")
	public String joinindexHandle() {
		return "mypageindex";
	}
	
	@RequestMapping("/addinfo.do")
	public String addinfoHandle() {
		return "addinfo";
	}
	
	@RequestMapping("/modifyinfo.do")
	public String modfiyinfoHandle() {
		return "modifyinfo";
	}
	
	@RequestMapping(path="/sendKey.do", produces="application/json;charset=utf-8")
	public String accountSendKeyHandle(@RequestParam String email, HttpServletRequest req) {
		String result = authservice.sendAuthKey(email);
		if(result == null) {
			return "redirect:/mypage/addinfo.do";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("key", result);
			session.setAttribute("email", email);
			System.out.println("key " + result);
			System.out.println("email " + email);
			return "redirect:/mypage/addinfo.do";
		}
	}
	
	@RequestMapping("/confirmKey.do")
	public String confirmKeyHandle(@RequestParam("key") String param, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String key = (String) session.getAttribute("key");
		if(param.equals(key)) {
			System.out.println("키값 일치");
		}else {
			System.out.println("키값 불일치");
		}
		/*System.out.println("세션저장값 : " + session.getAttribute("key"));
		System.out.println("파라미터값 == session : " + key.equals(session.getAttribute("key")));
		System.out.println("넘어온파라미터 키값" + key);*/
		return "redirect:/mypage/addinfo.do";
	}
}














