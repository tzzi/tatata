package controllers;

import java.io.File;
import java.sql.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import beans.RideboardDAO;

@Controller
@RequestMapping("/rideboard")
public class RideController {
	@Autowired
	ServletContext ctx;

	@Autowired
	RideboardDAO rdao;

	@RequestMapping("/index.do")
	public String ride_indexHandle() {

		return "ride_index";

	}

	@RequestMapping("/write.do")
	public String writeHandle() {
		return "write";
	}

	@RequestMapping("/complete.do")
	public String ride_writeHandle(@RequestParam Map<String, String> param, ModelMap map,MultipartFile file, HttpServletRequest req) {
		String park_name = param.get("park_name");
		String ride_name = param.get("ride_name");
		String type = param.get("type");
		String content = param.get("content");
		String image = param.get("image");
		String url = "/image/";
		Date left_date = new Date(System.currentTimeMillis());
		
		File uploaddir = new File(ctx.getRealPath("/image"));
		uploaddir.mkdirs();
		String fileName = System.currentTimeMillis() + ".jpg";
		File dst = new File(uploaddir, fileName);
		try {
			file.transferTo(dst);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("park_name", park_name);
		map.put("ride_name", ride_name);
		map.put("type", type);
		map.put("content", content);
		map.put("image",url+dst.getName());
		map.put("left_date", left_date);
		
		System.out.println(map);
		
		req.setAttribute("park_name", park_name);
		req.setAttribute("ride_name", ride_name);
		req.setAttribute("type", type);
		req.setAttribute("image", image );
		req.setAttribute("content", content);
		req.setAttribute("left_date", left_date);
		int rst = rdao.write(map);
		if (rst == 1) {
			return "write_complete";
		} else {
			return "write";
		}

	}
	@RequestMapping("/list.do")
	public String listHandle(ModelMap modelMap) {
		System.out.println(rdao.list());
		modelMap.put("rideboard",rdao.list());
		return "list";
	}
	
	@RequestMapping("/detail.do")
	public String detailHandle(@RequestParam String ride_name,ModelMap modelMap) {
		
		modelMap.put("rideboard",rdao.detail(ride_name));
		
		System.out.println(modelMap);
		return "detail";
	}
	
	
}
