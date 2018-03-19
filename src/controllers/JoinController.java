package controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		return "join";
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
	public int joinrstHandle(@RequestParam Map param) {
		return dao.join(param);
	}
}
