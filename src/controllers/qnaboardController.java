package controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.google.gson.Gson;

import beans.qnaDAO;

@Controller
@RequestMapping("/qnaboard")
public class qnaboardController {
	@Autowired
	qnaDAO qdao;
	@Autowired
	Gson gson;
	
	@RequestMapping("/qnaindex.do")
	public String indexHandle(ModelMap modelMap)	{
		modelMap.put("qnalist", qdao.readAllqna());
		return "qnaboard";
	}
	
	
	@RequestMapping("/writeform.do")
	public String wirteformHandle() {
		return "writeform";
	}

	@RequestMapping("/write.do")
	public String writeHandle(@RequestParam Map map, WebRequest req,ModelMap modelMap) {
		int rst = qdao.qnaWrite(map);
		modelMap.put("qnalist", qdao.readAllqna());
		if(rst==1) {
			req.setAttribute("rst", "1", 0);
		}else {
			req.setAttribute("rst", "0", 0);
		}
			
		return "qnaboard";
	}
	@RequestMapping("/detail.do")
	public String detailHandle(@RequestParam int q_no, ModelMap modelMap) {
		modelMap.put("qnadetail", qdao.detailqna(q_no));
		modelMap.put("qnadetaillist", qdao.detail(q_no));
		return "qnadetail";
	}
	
	/*@RequestMapping("/detailwrite.do")
	public String replyHandle(@RequestParam Map map, WebRequest req,ModelMap modelMap,@RequestParam int q_no) {
		int rst = qdao.qnareplywrite(map);
		modelMap.put("qnadetaillist", qdao.detail(q_no));
		modelMap.put("qnadetail", qdao.detailqna(q_no));
		if(rst==1) {
			req.setAttribute("rst", "1", 0);
		}else {
			req.setAttribute("rst", "0", 0);
		}
			
		return "qnadetail";
	}*/	
	@RequestMapping(path="/detailwrite.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public String detailwriteController(@RequestParam Map map, WebRequest req,ModelMap modelMap,@RequestParam int q_no) {
		int rst = qdao.qnareplywrite(map);
		modelMap.put("qnadetaillist", qdao.detail(q_no));
		modelMap.put("qnadetail", qdao.detailqna(q_no));
		String b = "1";
		if(rst==1) {
			req.setAttribute("rst", "1", 0);
			b = "1";
		}else {
			req.setAttribute("rst", "0", 0);
			b ="2";
		}
			
		return "[{\"result\":" +b+"}]";
	}
	
}
