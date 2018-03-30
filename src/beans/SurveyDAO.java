//package beans;
//
//import java.util.Map;
//
//import org.bson.Document;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.mongodb.core.MongoTemplate;
//import org.springframework.stereotype.Repository;
//
//import com.mongodb.MongoClient;
//import com.mongodb.client.MongoCollection;
//
//@Repository
//public class SurveyDAO {
//	@Autowired
//	MongoTemplate mt;
//	
//	
//	public void addSurvey(Map map) {
//		try {
//			mt.insert(map,"test");
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			return false;
//		}
//	}
//}
