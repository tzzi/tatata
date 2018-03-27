package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController{
	@RequestMapping("/index.do")
	public String indexController() {
		return "index_1";
	}
	
	@RequestMapping("/startview.do")
	public String startviewController() {
		return "tatata";
	}

}
