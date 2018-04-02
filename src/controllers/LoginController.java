package controllers;

import java.math.BigDecimal;
import java.text.DecimalFormat;
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

import beans.LoginDAO;
import beans.MyPageDAO;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	LoginDAO dao;
	@Autowired
	MyPageDAO mdao;
	
	@RequestMapping("/loginindex.do")
	public String joinindexHandle() {
		return "loginindex";
	}	
	
	@RequestMapping(path = "/login.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String loginHandle(@RequestParam Map param, HttpServletRequest req, 
			HttpServletResponse resp, HttpSession session, ModelMap map) {
		
		// 로그인 성공시
		if(dao.login(param)!=null) {
			System.out.println("param : "+param);
			if(mdao.addinfoload(param)!=null) {
				BigDecimal gender = (BigDecimal)mdao.addinfoload(param).get("GENDER");
				session.setAttribute("gender", gender);				
			}
			// 세션에 정보 올려둠
			String id = (String)dao.login(param).get("ID");
			String nick = (String)dao.login(param).get("NICK");
			String pass = (String)dao.login(param).get("PASS");
			
			
			session.setAttribute("login", 0);
			session.setAttribute("userId", id);
			session.setAttribute("userNick", nick);
			session.setAttribute("pass", pass);
			
			
			session.setAttribute("auth", id);
			
			// 추가정보 입력한 사람들 정보 불러오기
			map.put("id", id);
			mdao.addinfoload(map);
			System.out.println("추가정보받아오기 됨? : "+ mdao.addinfoload(map));
			session.setAttribute("addinfo", mdao.addinfoload(map));
			
			// 관리자 여부 파단하기
			BigDecimal admin=  (BigDecimal) dao.login(param).get("ADMIN");
			System.out.println("admin 관리자1, 사용자2 : " + admin);
			session.setAttribute("admin", admin);
			
			session.getAttribute("admin");
			
			// 쿠키값 올려둠 (로그인 유지)
			/*Cookie cid = new Cookie("id", id);
			cid.setMaxAge(60*60*24*1);
			cid.setPath("/");	// 쿠키값 패쓰 설정
			resp.addCookie(cid);
			
			Cookie cnick = new Cookie("nick", nick);
			cnick.setPath("/");
			resp.addCookie(cnick);*/
			String b= "2";
			return "[{\"result\":" + b + "}]";
		} else {
			System.out.println("로그인 실패 " + dao.login(param));
			String b = "1";
			return "[{\"result\":" + b + "}]";
		}
	}

	@RequestMapping("/logout.do")
	public String logoutHandle( HttpServletResponse resp, HttpSession session) {
		session.invalidate();
		
		/*Cookie[] cookies = new Cookie[] {new Cookie("id", "x") , new Cookie("nick", "x"), new Cookie("email","x") };
		for(Cookie c : cookies) {
			c.setMaxAge(0);
			c.setPath("/");
			resp.addCookie(c);
		}*/
	    return "redirect:/index.do";
	}

	@RequestMapping("/idfind.do")
	public String idfindHandle() {
		
		return "idfind";
	}
	
}
