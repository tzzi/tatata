/*package controllers;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mongodb.WriteResult;

@Controller
@RequestMapping("/mongo")
public class InstaController {
	@Autowired
	MongoTemplate template;
	
	@Autowired
	ServletContext ctx;
	
	@RequestMapping("/upload.do")
	public String uploadHandle() {
	
		
		return"mongo/upload";
	}
	
	@RequestMapping("/uploadp.do")
	public String uploadpHandle(@RequestParam("comment") String comment,
			@RequestParam("photo") MultipartFile f, ModelMap modelmap) throws InterruptedException {
		if(!f.isEmpty()) {
			String path = ctx.getRealPath("/");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String str = sdf.format(System.currentTimeMillis());
			System.out.println(str);	//saan_20180210103711
			File target = new File(path, str+".png");
			String blank[] = comment.split("\\s");
			System.out.println("split " + comment.split("\\s"));
			List<String> tags = new ArrayList<>();
			for(String a : blank) {
				if(a.startsWith("#")) {
					tags.add(a);
				}
			}
			
			Map map = new LinkedHashMap<>();
				map.put("url", "/" +target.getName());
				map.put("comment", comment);
				map.put("tag", tags);
			template.insert(map, "mongo");
			
			boolean rst;
			try {
				f.transferTo(target);
				rst = true;
			} catch (Exception e) {
				rst = false;
				e.printStackTrace();
			}
			if(rst) {
				modelmap.put("result",true);
			}
			}
		return "mongo/uploadp";
	}
	
	@RequestMapping("/list.do")
	public String listHandle(ModelMap map) {
		List<Map> list = template.findAll(Map.class, "mongo");
		map.put("list", list);
		return "mongo/list";
	}
	
	@RequestMapping("/detail.do")
	public String detailHandle(@RequestParam("id") String id, ModelMap map) {
		// mongo 조건 설정하는 것이 까다로움. sql 에 익숙한 사람들은 적응하기 힘듦.
		// sql 조건 설정하듯이 할 수 있게 해둠.
		// Query 객체와 Criteria 객체를 이용해서
		// findOne = selectOne : 조건 설정해서 필터링
		// find = selectList : 조건 설정해서 필터링
		// findAll = selectList : 조건 없이 전부다
		Query query = new Query(Criteria.where("_id").is(id));
		Map list = template.findOne(query, Map.class, "mongo");
		System.out.println(list);
		map.put("list", list);
		return "mongo/detail";
	}
	
	@RequestMapping("/delete.do")
	public String deleteHandle(@RequestParam("id") String id, ModelMap map) {
		Query query = new Query(Criteria.where("_id").is(id));
		WriteResult rst = template.remove(query, Map.class, "mongo");
		map.put("delete", rst);
		return "mongo/delete";
	}

	@RequestMapping("/search.do")
	public String searchHandle(@RequestParam("tag") String tag, ModelMap map) {
		Query query = new Query(Criteria.where("tag").in(tag));		
		List<Map> rst = template.find(query, Map.class,"mongo");
		for(Map m : rst) {
			System.out.println("=> " + m);
		}
		map.put("list", rst);
		return "mongo/list";
	}
}
*/