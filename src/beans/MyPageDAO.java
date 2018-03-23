package beans;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {

	@Autowired
	SqlSessionFactory factory;
	
	public int addinfo(Map param) {
		SqlSession session = factory.openSession();
		int rst = 0;
		try {
			rst = session.insert("mypage.addinfo", param);
		} finally {
			session.close();
		}
		return rst;
	}
	
	public Map addinfoload(Map param) {
		SqlSession session = factory.openSession();
		Map rst = null;
		try {
			rst = session.selectOne("mypage.mypageinfo", param);
		} finally {
			session.close();
		}
		return rst;
	}
}
