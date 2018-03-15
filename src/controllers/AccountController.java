package controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import beans.AccountDAO;


@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	AccountDAO ADAO;

	@RequestMapping("/joinindex.do")
	public String joinindexController(){
		return "join_1";
	}
	
	@RequestMapping(path="/idcheck.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String idCheckController(@RequestParam Map map){
		System.out.println(map.get("id"));
		int rst = ADAO.idCheck(map);
		return rst + "";
	}
	
	@RequestMapping(path="/nickcheck.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String nickCheckController(@RequestParam Map nick){
		int rst = ADAO.nickCheck(nick);
		System.out.println(nick.get("nick"));
		return rst + "";
	}
	
	@RequestMapping("/join.do")
	public String joinController(@RequestParam Map map, WebRequest req){
		int rst = ADAO.join(map);
		if (rst == 1){
			//return "회원 가입이 완료되었습니다";
			req.setAttribute("rst", "1", 0);
		}else{
			//return "알 수 없는 이유로 회원 가입에 실패하였습니다";
			req.setAttribute("rst", "0", 0);
		}
		
		return "join";
	}
	
}
