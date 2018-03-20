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
	
	public List<Map> readAllqna(){
		SqlSession session = factory.openSession();
		try {
			System.out.println(session.selectList("qnaboard.listallqna"));
			return session.selectList("qnaboard.listallqna");
		}finally {
			session.close();
			
		}
	}
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
	public List<Map> detailqna(int q_no){
		SqlSession session = factory.openSession();
		try {
			System.out.println(session.selectList("qnaboard.detailqna", q_no));
			session.update("qnaboard.addcount", q_no);
			return session.selectList("qnaboard.detailqna", q_no);			
		}finally {
			session.close();
		}
	}
	public List<Map> detailwrite(){
		SqlSession session = factory.openSession();
		try {
			System.out.println(session.selectList("qnaboard.listqnareply"));
			session.update("qnaboard.listqnareply");
			return session.selectList("qnaboard.listqnareply");			
		}finally {
			session.close();
		}
	}
	public int qnareplywrite(String content) {
		SqlSession session = factory.openSession();
		int rst = 0;
		System.out.println("content:"+content);
		try {
			rst = session.insert("qnaboard.insertreply",content);
			
		}finally {
			session.close();
		}
		return rst;
	}
	
}
