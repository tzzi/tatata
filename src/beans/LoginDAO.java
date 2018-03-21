package beans;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
	@Autowired
	SqlSessionFactory factory;
	
	public List<Map> login(Map param) {
		SqlSession session = factory.openSession();
		List<Map> li = null;
		try {
			li = session.selectList("account.login", param);
		} finally {
			session.close();
		}
		return li;
	}
	
	
}
