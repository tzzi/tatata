package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rideboard")
public class AmParkController {

	@RequestMapping("/view.do")
	public String rideHandle() {
		
		return "view";

	}
}
