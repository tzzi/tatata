package controllers;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	public String loginHandle(@RequestParam("id") String id, @RequestParam("pass") String pass, ModelMap map, HttpServletRequest req, HttpServletResponse resp) {
		
		
		map.put("id", id);
		map.put("pass", pass);
		/*System.out.println("넘길 맵" + map);
		System.out.println("dao.login " + dao.login(map));
		System.out.println("isempty " + dao.login(map).isEmpty());*/
		req.setAttribute("id", id);
		if(!dao.login(map).isEmpty()) {
			Cookie cid = new Cookie("id", id);
			cid.setPath("/");
			resp.addCookie(cid);
			return "index_1";
		} else {
			return "loginindex";
		}
	}
	/*@RequestMapping("09.do")
	public void handle09(@CookieValue(name="sid", required=false) String sid) {
		System.out.println(sid);
	}*/

	@RequestMapping("/idfind.do")
	public String idfindHandle() {
		
		return "idfind";
	}
	
}
