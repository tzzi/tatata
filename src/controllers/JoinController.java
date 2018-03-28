package controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import beans.JoinDAO;

@Controller
@RequestMapping("/join")
public class JoinController {
	@Autowired
	JoinDAO dao;
	
	@RequestMapping("/joinindex.do")
	public String joinindexHandle() {
		return "joinindex";
	}	
	
	@RequestMapping(path="/idcheck.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public boolean idcheckHandle(@RequestParam Map param) {
		return dao.idCheck(param);
	}
	
	@RequestMapping(path="/nickcheck.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public boolean nickcheckHandle(@RequestParam Map param) {
		return dao.nickCheck(param);
	}
	
	@RequestMapping("/join.do")
	public String joinrstHandle(@RequestParam Map<String, String> param, ModelMap map, HttpServletRequest req) {
		
		String id = param.get("id");
		String pass = param.get("pass1");
		String nick = param.get("nick");
		
		map.put("id", id);
		map.put("pass", pass);
		map.put("nick", nick);
		System.out.println(map);
		
		req.setAttribute("id", id);
		req.setAttribute("nick", nick);
		
		int rst = dao.join(map);
		if(rst==1) {
			return "redirect:/index.do";
		} else {
			return "redirect:/join/joinindex.do";
		}
	}
}
