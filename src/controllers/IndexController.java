package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;

import beans.AccountDAO;


@Controller
public class IndexController{
	
	@Autowired
	AccountDAO ADAO;
	

	@RequestMapping("/index.do")
	public String indexController() {
		return "index_1";
	}
	
	@RequestMapping("/joinindex.do")
	public String joinindexController(){
		return "join_1";
	}
	
	@RequestMapping(path="/idcheck.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String idCheckController(@RequestParam Map id){
		int rst = ADAO.idCheck(id);
		return rst + "";
	}
	
	@RequestMapping(path="/nickcheck.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String nickCheckController(@RequestParam Map nick){
		int rst = ADAO.idCheck(nick);
		return rst + "";
	}
	
	@RequestMapping("/join.do")
	public String joinController(@RequestParam Map map){
		int rst = ADAO.idCheck(map);
		if (rst == 1){
			return "회원 가입이 완료되었습니다.";
		}else{
			return "알 수 없는 이유로 회원 가입에 실패하였습니다.";
		}
	}

}
