package controllers;

import java.io.File;
import java.sql.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
   //놀이기구 전체 목록
   @RequestMapping("/list.do")
   public String listHandle(ModelMap modelMap) {
      System.out.println(rdao.list());
      modelMap.put("rideboard",rdao.list());
      return "list";
   }
   // 좋아요 수 증가
   @RequestMapping(path = "/ride_like.do", produces = "application/json;charset=utf-8")
   @ResponseBody
   public String addlikeController(@RequestParam String ride_name) {
      int rst = rdao.goodcnt(ride_name);
      
      String b = "0";
      if(rst==1) {
         b = "1";
      }else {
         b = "2";
      }
      return "[{\"result\":" + b + "}]";
            
   }
   //조회수 , 상세보기
   @RequestMapping("/detail.do")
   public String detailHandle(@RequestParam String ride_name,ModelMap modelMap){
      
      modelMap.put("rideboard", rdao.count(ride_name));
      modelMap.put("rideboard",rdao.detail(ride_name));
      System.out.println(modelMap);
      
      
      return "detail";
   }
   
   @RequestMapping("/parkdetail.do")
   public String parkdetailHandle(@RequestParam String park_name, ModelMap modelMap) {
   
      modelMap.put("rideboard", rdao.parkdetail(park_name));
      return "parkdetail";
   }
   @RequestMapping(path = "/cart.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String basketHandle(@RequestParam Map map,@RequestParam String nick,@RequestParam String basket,@RequestParam String type) {
		String a=null;
		int rst= 0;
		//rst = rdao.basket(map, nick, basket, type);		

		rst = rdao.basket(map, nick, basket, type);		

		System.out.println("rst값 : " + rst);
		if(rst==5) {
		 a ="5";
		}else if(rst==1) {
			a = "1";
		}else if(rst==3) {
			a = "3";
		}

		return "[{\"result\":" + a + "}]";
		
	}

   
}