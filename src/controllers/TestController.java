package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class TestController {
	@RequestMapping("/maintest.do")
	public String maintestHandle() {
		return "test";
	}	
	
	@RequestMapping("/navtest.do")
	public String navtestHandle() {
		return "navtest";
	}	
	
}
