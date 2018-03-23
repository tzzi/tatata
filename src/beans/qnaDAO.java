package beans;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public class qnaDAO {
	@Autowired
	SqlSessionFactory factory;
	
	//글 목록보기
	public List<Map> readAllqna(){
		SqlSession session = factory.openSession();
		try {
			System.out.println(session.selectList("qnaboard.listallqna"));
			return session.selectList("qnaboard.listallqna");
		}finally {
			session.close();
			
		}
	}
	//글쓰기
	public int qnaWrite(Map map) {
		SqlSession session = factory.openSession();
		int rst = 0;
		try {
			rst = session.insert("qnaboard.qnawrite",map);
			
		}finally {
			session.close();
		}
		return rst;
	}
	//조회수,글상세보기
	public Map detailqna(int q_no){
		SqlSession session = factory.openSession();
		try {
			
			session.update("qnaboard.addcount", q_no);
			return session.selectOne("qnaboard.detailqna", q_no);			
		}finally {
			session.close();
		}
	}
	//리플 보기
	public List<Map> detail(int q_no){
		SqlSession session = factory.openSession();
		try {
			System.out.println(session.selectList("qnaboard.listqnareply",q_no));
			session.update("qnaboard.listqnareply",q_no);
			return session.selectList("qnaboard.listqnareply",q_no);			
		}finally {
			session.close();
		}
	}
	//리플 달기
	public int qnareplywrite(Map map) {
		SqlSession session = factory.openSession();
		int rst = 0;
		System.out.println(map);
		try {
			rst = session.insert("qnaboard.insertreply",map);
			
		}finally {
			session.close();
		}
		return rst;
	}
	
}
