package beans;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDAO {
	@Autowired
	SqlSessionFactory factory;
	
	public int insertSurvey(Map param) {
		SqlSession session = factory.openSession();
		int rst = 0;
		try {
			rst = session.insert("survey.input", param);
		} finally {
			session.close();
		}
		return rst;
	}
	
	public Map loadIdfromSurvey(String param) {
		SqlSession session = factory.openSession();
		Map rst = null;
		try {
			rst = session.selectOne("survey.loadid", param);
		} finally {
			session.close();
		}
		return rst;
	}
	
	public List loadallSurvey() {
		SqlSession session = factory.openSession();
		List<Object> rst = null;
		try {
			rst = session.selectList("survey.loadtotalall");
		} finally {
			session.close();
		}
		return rst;
	}
	
}