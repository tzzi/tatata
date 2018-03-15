package beans;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAO {

	@Autowired
	SqlSessionFactory factory;

	public int join(Map map) {

		SqlSession session = factory.openSession();
		int rst = 0;
		try {
			rst = session.insert("account.join", map);

		} finally {
			session.close();
		}

		return rst;
	}

	public int idCheck(Map id) {

		SqlSession session = factory.openSession();

		int rst = 1;
		List<Map> list;
		try {
			System.out.println("DAO : " + id);
			list = session.selectList("account.idcheck", id);
		} finally {
			session.close();
		}

		if (list.isEmpty()) {
			rst = 0;
		}

		return rst;
	}

	
	// 중복 체크는 중복 값이 있을 때 1, 아니면 0을 리턴
	public int nickCheck(Map map) {

		SqlSession session = factory.openSession();
		int rst = 1;
		List<Map> list;
		try {
			list = session.selectList("account.nickcheck", map);
			System.out.println("DAO : " + map);
		} finally {
			session.close();
		}

		if (list.isEmpty()) {
			rst = 0;
		}

		return rst;
	}

}
