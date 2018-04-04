package controllers;

import java.io.File;
import java.sql.Date;
import java.util.List;
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
import org.springframework.web.context.request.WebRequest;
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

	// 놀이기구 게시판 작성
	@RequestMapping("/write.do")
	public String writeHandle() {
		return "write";
	}

	// 게시글 확인
	@RequestMapping("/complete.do")
	public String ride_writeHandle(@RequestParam Map<String, String> param, ModelMap map, MultipartFile file,
			HttpServletRequest req) {
		String park_name = param.get("park_name");
		String ride_name = param.get("ride_name");
		String time = param.get("time");
		String price = param.get("price");
		String limit = param.get("limit");
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
		map.put("time", time);
		map.put("limit", limit);
		map.put("price", price);
		map.put("type", type);
		map.put("content", content);
		map.put("image", url + dst.getName());
		map.put("left_date", left_date);

		System.out.println(map);

		req.setAttribute("park_name", park_name);
		req.setAttribute("ride_name", ride_name);
		req.setAttribute("time", time);
		req.setAttribute("limit", limit);
		req.setAttribute("price", price);
		req.setAttribute("type", type);
		req.setAttribute("image", image);
		req.setAttribute("content", content);
		req.setAttribute("left_date", left_date);
		int rst = rdao.write(map);
		if (rst == 1) {
			return "write_complete";
		} else {
			return "write";
		}

	}

	// 놀이기구 전체 목록
	@RequestMapping("/list.do")
	public String listHandle(ModelMap modelMap) {
		System.out.println(rdao.alllist());
		modelMap.put("rideboard", rdao.alllist());
		return "list";
	}

	// 놀이기구 좋아요 중복 체크
	@RequestMapping(path = "/overlap.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String rideOverlapController(@RequestParam String ride_name, HttpSession session) {
		String nick = (String) session.getAttribute("userNick");
		String id = (String) session.getAttribute("userId");
		String overlap = ride_name + id;

		System.out.println("중복 체크 받은 String : " + overlap);
		int rst = rdao.rideOverlapCheck(overlap);
		String b = "0";
		if (rst == 1) {
			b = "1";// 중복 없음
		} else {
			b = "2";// 중복있음
		}

		return "[{\"result\":" + b + "}]";
	}

	//
	@RequestMapping(path = "/detailwrite.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String detailwriteController(@RequestParam Map map, WebRequest req, ModelMap modelMap,
		@RequestParam String ride_name,@RequestParam int no,HttpSession session) {
		String nick = (String) session.getAttribute("userNick");
		map.put("nick", nick);
		modelMap.put("ridedetail", rdao.detail(ride_name));
		
		String b = "1";
		int rst = 0;
		rst = rdao.ridereplywrite(map);
		if (rst == 1) {
			req.setAttribute("rst", "1", 0);
			b = "1";
		} else {
			req.setAttribute("rst", "0", 0);
			b = "2";
		}
		
		return "[{\"result\":" + b + "}]";
	}
	// 좋아요 수 증가
	@RequestMapping(path = "/ride_like.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String addlikeController(@RequestParam String ride_name) {
		int rst = rdao.goodcnt(ride_name);

		String b = "0";
		if (rst == 1) {
			b = "1";
		} else {
			b = "2";
		}
		return "[{\"result\":" + b + "}]";

	}

	// 조회수, 글상세보기, 쿠키로 중복 조회수 막음(1일)
	@RequestMapping("/detail.do")
	public String detailHandle(@RequestParam String ride_name, ModelMap modelMap, HttpServletResponse response,
			HttpServletRequest request, HttpSession session, @RequestParam int no) {
		modelMap.put("ridereply_list",rdao.replydetail(ride_name));
		modelMap.put("rideboard", rdao.detail(ride_name));// 특정 놀이기구 정보 확인
		System.out.println(modelMap);
		// 쿠키 사용
		String id = (String) session.getAttribute("userId");
		Cookie setCookie = new Cookie("count" + no + id, "조회수쿠키"); // 쿠키 생성
		setCookie.setMaxAge(60 * 60 * 24); // 기간을 하루로 지정
		response.addCookie(setCookie);

		Cookie[] getCookie = request.getCookies();

		if (getCookie != null) {

			for (int i = 0; i < getCookie.length; i++) {

				Cookie c = getCookie[i];
				String name = c.getName(); // 쿠키 이름 가져오기
				System.out.println(name);
				// 동일이름의 쿠기가 있다면
				if (name.equals("count" + no + id)) {
					System.out.println("동일이름의 쿠키가 존재함");
					return "R_detail";
				} else {
					System.out.println("동일이름의 쿠기가 존재하지 않음");
				}

			}

			rdao.addcount(ride_name);// 쿠키가 없으면 조회수 증가
		}

		return "R_detail";
	}

	/*
	 * @RequestMapping("/parkdetail.do") public String
	 * parkdetailHandle(@RequestParam String park_name, ModelMap modelMap) {
	 * 
	 * modelMap.put("rideboard", rdao.parkdetail(park_name)); return "parkdetail"; }
	 */
	// 장바구니
	@RequestMapping(path = "/cart.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String basketHandle(@RequestParam Map map, @RequestParam String nick, @RequestParam String basket,
			@RequestParam String type) {
		String a = null;
		int rst = 0;

		rst = rdao.basket(map, nick, basket, type);

		System.out.println("rst값 : " + rst);
		if (rst == 5) {
			a = "5";
		} else if (rst == 1) {
			a = "1";
		} else if (rst == 3) {
			a = "3";
		}

		return "[{\"result\":" + a + "}]";

	}




	// 공원 이름 별 목록
	@RequestMapping(path = "/place.do")
	public String detailworldController(String name, ModelMap modelMap) {

		modelMap.put("rideboard", rdao.parkdetail(name));
		return "list";
	}
}
  	
