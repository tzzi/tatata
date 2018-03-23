package controllers;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import beans.LoginDAO;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	LoginDAO dao;
	
	@RequestMapping("/loginindex.do")
	public String joinindexHandle() {
		return "loginindex";
	}	
	
	@RequestMapping("/login.do")
	public String loginHandle(@RequestParam Map param, HttpServletRequest req, HttpServletResponse resp) {
		if(dao.login(param)!=null) {
			
			// 쿠키값 올려둠 (로그인 유지)
			String id = (String)dao.login(param).get("ID");
			Cookie cid = new Cookie("id", id);
			cid.setPath("/");	// 쿠키값 패쓰 설정
			resp.addCookie(cid);
			
			String nick = (String)dao.login(param).get("NICK");
			Cookie cnick = new Cookie("nick", nick);
			cnick.setPath("/");
			resp.addCookie(cnick);
			
			return "index_1";
		} else {
			System.out.println("로그인 실패 " + dao.login(param));
			return "redirect:/login/loginindex.do";
		}
	}

	@RequestMapping("/logout.do")
	public String logoutHandle( HttpServletResponse resp) {
		
		Cookie[] cookies = new Cookie[] {new Cookie("id", "x") , new Cookie("nick", "x"), new Cookie("email","x") };
		for(Cookie c : cookies) {
			c.setMaxAge(0);
			c.setPath("/");
			resp.addCookie(c);
		}
	    return "redirect:/index.do";
	}

	@RequestMapping("/idfind.do")
	public String idfindHandle() {
		
		return "idfind";
	}
	
}
