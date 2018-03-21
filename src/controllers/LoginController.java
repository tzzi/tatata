package controllers;

import javax.servlet.http.HttpServletRequest;

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
	public String loginHandle(@RequestParam("id") String id, @RequestParam("pass") String pass, ModelMap map, HttpServletRequest req) {
		
		
		map.put("id", id);
		map.put("pass", pass);
		
		req.setAttribute("id", id);
		req.setAttribute("admin", 2);
		
		/*System.out.println("넘길 맵" + map);
		System.out.println("dao.login " + dao.login(map));
		System.out.println("isempty " + dao.login(map).isEmpty());*/
		if(!dao.login(map).isEmpty()) {
			return "index_1";
		} else {
			return "loginindex";
		}
	}
	
	@RequestMapping("/idfind.do")
	public String idfindHandle() {
		
		return "idfind";
	}
	
}
