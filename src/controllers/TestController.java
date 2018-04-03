//package controllers;
//
//import java.util.Date;
//import java.util.LinkedHashMap;
//import java.util.Map;
//
//import javax.servlet.ServletContext;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.mongodb.core.MongoTemplate;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//@RequestMapping("/test")
//public class TestController {
//	@Autowired
//	MongoTemplate template;
//	
//	@Autowired
//	ServletContext ctx;	// application 객체는 어디서든 주입받을 수 있음.
//	
//	@RequestMapping("/conn.do")
//	public void connHandle() {
//		System.out.println(template);
//	}
//
//	@RequestMapping("/insert.do")
//	public void insertHandle() {
//		Map map=new LinkedHashMap<>();
//		
//		map.put("writer","master");
//		map.put("writedate", new Date());
//		map.put("tags", "#몽고,#오지군요,#불금".split(","));
//		template.insert(map, "instargram");
//	}
//	/*@RequestMapping("/upload.do")
//	public String uploadHandle() {
//	
//		
//		return"upload";
//	}*/
///*	@RequestMapping("/uploadp.do")
//	public String uploadHandle(@RequestParam Map<String,String> body,
//			  HttpServletRequest req) throws IOException {
//		ServletContext ctx=req.getServletContext();
//		String saveDir=ctx.getRealPath("/image");
//		String sn=null;
//		String on=null;
//		File f=null;
//		MultipartRequest mr=new MultipartRequest(req,saveDir,1024*1024*100, "utf-8", new RenamePlolicy());
//		  f= mr.getFile("photo");
//		  String fname="/image/"+f.getName();
//		sn = mr.getFilesystemName("photo");//저장된 이름
//		on = mr.getOriginalFileName("photo");//원래 넘어온 이름
//		System.out.println(sn+"..."+on+"..."+fname);
//		String[] comment=mr.getParameter("comment").split("#");
//		String[] tags=mr.getParameter("comment").split("#");
//		System.out.println(comment.toString()+"어플리케이션"+tags.toString());
//		Map map=new LinkedHashMap<>();
//		System.out.println(map);
//		map.put("writer", "master");
//		map.put("image", fname);
//		map.put("comment", comment[0]);
//		map.put("tags", tags[1]);
//		template.insert(map, "instargram");
//		return "upload";
//	}
//	
//	@RequestMapping("/uploadp.do")
//	public String uploadpHandle(@RequestParam("comment") String comment,
//			@RequestParam("photo") MultipartFile f, ModelMap modelmap) throws InterruptedException {
//		System.out.println("comment = " + comment);
////		System.out.println(f);
////		System.out.println(f.isEmpty());	// 
//		// COS는 MultipartRequest로 변환하는것 자체가 이미 업로드가 끝남.
//		// Commnons 라이브러리 같은 경우는 이게 임시 저장 상태.
//		// 이걸 업로드 처리 여부를 결정을 해야함.
//		String content = f.getContentType();
//		String name = f.getName();
//		String original = f.getOriginalFilename();
////		System.out.println(content);	// 파일 형태
//		System.out.println(name);		// 파라미터명 - useless
//		System.out.println(original);	// 원본파일명
//		// 실제 업로드를 처리해야 된다면..
//		// 임시 업로드된 파일에서 getInputStream 을 얻어서 수동으로 파일복제
//		// 저장하고 싶은 파일 객체 생성해서 업로드를 진행
//		// 업로드는 어플리케이션 내부로 해야지만, img src로 잡히니까 getRealPath가 필요한데
//		// realPath를 하려면 ServletContext (application)객체가 필요함
//		if(!f.isEmpty()) {
//			String path = ctx.getRealPath("/");
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//			String str = sdf.format(System.currentTimeMillis());
//			System.out.println(str);	//saan_20180210103711
//			File target = new File(path, str+".png");
//			String blank[] = comment.split("\\s");
//			System.out.println("split " + comment.split("\\s"));
//			List<String> tags = new ArrayList<>();
//			for(String a : blank) {
//				if(a.startsWith("#")) {
//					tags.add(a);
//				}
//			}
//			
//			Map map = new LinkedHashMap<>();
//				map.put("url", "/" +target.getName());
//				map.put("comment", comment);
//				map.put("tag", tags);
//			template.insert(map, "insta");
//			
//			boolean rst;
//			try {
//				f.transferTo(target);
//				rst = true;
//			} catch (Exception e) {
//				rst = false;
//				e.printStackTrace();
//			}
//			if(rst) {
//				modelmap.put("result",true);
//			}
//			}
//		return "uploadp";
//	}
//	
//	@RequestMapping("/list.do")
//	public String listHandle(ModelMap map) {
//		List<Map> list = template.findAll(Map.class, "insta");
//		map.put("list", list);
//		return "list";
//	}*/
//}
///*package controllers;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//@RequestMapping("/view")
//public class TestController {
//	
//	
//	@RequestMapping("/maintest.do")
//	public String maintestHandle() {
//		return "test";
//	}	
//	
//	@RequestMapping("/navtest.do")
//	public String navtestHandle() {
//		return "navtest";
//	}	
//	
//}*/