package beans;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDAO {

	@Autowired
	SqlSessionFactory factory;
	
	public int join(Map param) {
		SqlSession session = factory.openSession();
		int rst = 0;
		try {
			rst = session.insert("account.join", param);
		} finally {
			session.close();
		}
		return rst;
	}
	
	public boolean idCheck(Map map) {
		SqlSession session = factory.openSession();
		String rst = null;
		try {
			rst = session.selectOne("account.idcheck", map);
		} finally {
			session.close();
		}
		return rst != null;
	}
	
	public boolean nickCheck(Map map) {
		SqlSession session = factory.openSession();
		String rst = null;
		try {
			rst = session.selectOne("account.nickcheck", map);
		} finally {
			session.close();
		}
		return rst != null;
	}
}
