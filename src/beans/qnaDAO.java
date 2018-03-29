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
	//글상세보기
	public Map detailqna(int q_no){
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("qnaboard.detailqna", q_no);			
		}finally {
			session.close();
		}
	}
	//조회수 올리기
	public int addcount(int q_no) {
		SqlSession session = factory.openSession();
		int rst = 0;
		try {
			rst =session.update("qnaboard.addcount", q_no);
			System.out.println("조회수 증가한다");
			return rst;
		}finally {
			session.close();
		}
	}
		
	
	//추천하기
	public int like(int q_no) {
		SqlSession session = factory.openSession();
		try {
			int rst= session.update("qnaboard.addlike",q_no);
			System.out.println("좋아요 증가한다!!");
			return rst;
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
	//중복 좋아요 확인 작업
	public int overlap(String overlap) {
		SqlSession session = factory.openSession();
		int rst = 0;
		System.out.println("overlap" + overlap);
		try {
			rst = session.insert("qnaboard.overlap", overlap);
			System.out.println(rst);
		}catch(Exception e){
			rst = 2;
			return rst;
		}finally {
			session.close();
		}
		return rst;
	}
}
