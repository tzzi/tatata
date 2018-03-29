package beans;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RideboardDAO {

	@Autowired
	SqlSessionFactory factory;

	// 게시물 등록
	public int write(Map param) {
		SqlSession session = factory.openSession();
		int rst = 0;
		try {
			System.out.println(param);
			rst = session.insert("rideboard.ride_write", param);
		} finally {
			session.close();
		}
		return rst;
	}

	// 전체 리스트 목록
	public List<Map> list() {
		SqlSession session = factory.openSession();
		try {
			return session.selectList("rideboard.list");
		} finally {
			session.close();
		}
	}

	// 좋아요 //조회수 //게시판 상세보기
	public Map detail(String ride_name) {
		SqlSession session = factory.openSession();
		try {

			return session.selectOne("rideboard.detail", ride_name);

		} finally {
			session.close();
		}
	}
//좋아요 수
	public int goodcnt(String ride_name) {
		SqlSession session = factory.openSession();
		try {
			int rst = 0;
			rst = session.update("rideboard.goodcnt", ride_name);
			return rst;
		} finally {
			session.close();
		}
	}
	// 조회수
	public int count(String ride_name) {
		SqlSession session = factory.openSession();
		try {
			int rst = 0;
			rst = session.update("rideboard.count", ride_name);
			return rst;
		} finally {
			session.close();
		}
	}
	// 공원 별
	public List<Map> parkdetail(String park_name) {
		SqlSession session = factory.openSession();
		try {
			System.out.println(park_name);

			return session.selectList("rideboard.parkdetail", park_name);
		} finally {
			session.close();
		}
	}
}
