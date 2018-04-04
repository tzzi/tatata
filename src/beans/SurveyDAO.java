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
	
	// 설문조사 결과 insert
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
	
	// id로 설문조사 테이블 모든 내용 가져오기
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
	
	// total값 구해봄. 시험삼아
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
	
	// 각 문항당 평균값 구하기
	public Map averageForEachSurvey() {
		SqlSession session = factory.openSession();
		Map rst = null;
		try {
			rst = session.selectOne("survey.avgall");
		} catch (Exception e) {
			session.close();
		}
		return rst;
	}
	
	// 가입자들의 사는 지역 순위
	public List<Map> areachart() {
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		try {
			rst = session.selectList("survey.areachart");
		} finally {
			session.close();
		}
		return rst;
	}
	
	// 가입자 성별 비율
	public List<Map> genderrate() {
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		try {
			rst = session.selectList("survey.genderrate");
		} finally {
			session.close();
		}
		return rst;
	}
	
	// 매칭 된 사람들의 담력도 순위
	public List<Map> fearrate() {
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		try {
			rst = session.selectList("survey.fearrate");
		} finally {
			session.close();
		}
		return rst;
	}
	
	// 매칭 유형 순위
	public List<Map> matchtyperank() {
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		try {
			rst = session.selectList("survey.matchtyperank");
		} finally {
			session.close();
		}
		return rst;
	}
	
}