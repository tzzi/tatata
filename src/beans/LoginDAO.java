package beans;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
	@Autowired
	SqlSessionFactory factory;
	
	public Map login(Map param) {
		SqlSession session = factory.openSession();
		Map rst = null;
		try {
			rst = session.selectOne("account.login", param);
		} finally {
			session.close();
		}
		return rst;
	}
	
	
}
