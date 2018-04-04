package beans;


import java.math.BigDecimal;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchingDAO {
	@Autowired
	SqlSessionFactory factory;

	// 마이 페이지내용 보여주기.(addinfo)
	public Map readmypage(String id) {
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("matchingboard.mypagelist", id);

		} finally {
			session.close();
		}
	}
	// 글 갯수 구하기
	public int countmatching() {
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("matchingboard.countmatching");
		} finally {
			session.close();
		}
	}
	//페이징 하기
	public List<Map> pagingmatching(Map map){
		SqlSession session = factory.openSession();
		try {
			System.out.println("semap : " +map);
			System.out.println("보여줄 List<Map> : " + session.selectList("matchingboard.rownumlist",map));
			return session.selectList("matchingboard.rownumlist",map);
			
		}finally {
			session.close();
		}
	}
	//글 쓰기
	public int matchingWrite(Map map) {
		SqlSession session = factory.openSession();
		int rst = 0;
		try {
			rst = session.insert("matchingboard.matchingwrite",map);
			
		}finally {
			session.close();
		}
		return rst;
	}
	
	
	
	//마이 페이지보여주기 (장바구니)
	public Map readmybasket(String nick) {
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("basket.myinfo",nick);
		}finally {
			session.close();
		}
	}
	
	
	//매칭 리스트 뽑기 
	public Map Matchingpage(String nick,String id) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = new LinkedList<>();
			//나의 정보
			System.out.println("id : " +id);
			System.out.println("nick : " +nick);
			
			Map mylist =session.selectOne("matchingboard.checkagree", nick);//list2
			System.out.println("나의 정보 : " + mylist);
			//나를 제외한 정보
			List<Map> notmylist = session.selectList("matchingboard.notmylist",nick);//list
			System.out.println("나를 제외한 정보 : "+notmylist);
			
			String mygender =  (String) mylist.get("GENDER");//나의 성별.	
			String MATCHTYPE = (String) mylist.get("MATCHTYPE");
			
			System.out.println("내 성별" + mygender);
			System.out.println("나의 매칭 타입" + MATCHTYPE);
			
			if(MATCHTYPE.equals("2")) {
				for(int a=0;a<notmylist.size();a++) {
					if(!(mylist.get("GENDER").equals(notmylist.get(a).get("GENDER"))) &&
					(notmylist.get(a).get("MATCHTYPE").equals("2") || notmylist.get(a).get("MATCHTYPE").equals("3"))	
							){
						list.add(notmylist.get(a));
						System.out.println(notmylist.get(a));
					}
				}
			}else if(MATCHTYPE.equals("1")) {
				for(int b=0;b<notmylist.size();b++) {
					if(mylist.get("GENDER").equals(notmylist.get(b).get("GENDER")) &&
						(notmylist.get(b).get("MATCHTYPE").equals("1") || notmylist.get(b).get("MATCHTYPE").equals("3"))
							) {
						list.add(notmylist.get(b));
						System.out.println(notmylist.get(b));
					}
				}
				//무관일때
			}else {
				for(int c=0;c<notmylist.size();c++) {
					String x_match = (String) notmylist.get(c).get("MATCHTYPE");
					if(x_match.equals("2")) {
						if(!(notmylist.get(c).get("GENDER").equals(mylist.get("GENDER")))) {
							list.add(notmylist.get(c));
							System.out.println("내가 무관이고 상대방이 이성 이고 내가 그 이성에 맞는 성별일때 :" +notmylist.get(c));
						}
					}else if(x_match.equals("1")){
						if((notmylist.get(c).get("GENDER").equals(mylist.get("GENDER")))) {
							list.add(notmylist.get(c));
							System.out.println("내가 무관이고 상대방이 동성이고 내가 그 동성에 맞는 성별일떄: "+ notmylist.get(c));
						}
				}
				}
			}
			System.out.println("매칭 상대 성별 필터 : "+list);
			System.out.println("이얏호");
			if(list.size()==0) {
				return null;
			}
			//========================  매칭 상대 구별(동,이성,남,여,)============================= 
			
			String basket1 = (String) mylist.get("BASKET1");
			String basket2 = (String) mylist.get("BASKET2");
			String basket3 = (String) mylist.get("BASKET3");
			String basket4 = (String) mylist.get("BASKET4");
			String basket5 = (String) mylist.get("BASKET5");
			
			System.out.println(list);
			
			for(int i=0; i<list.size();i++) {
				int cnt = 0;
				for(int j=1;j<=5;j++) {
					for(int z=1;z<=5;z++) {
						if((mylist.get("BASKET"+z)!=null && list.get(i).get("BASKET"+j)!=null)){
							if((mylist.get("BASKET"+z)).equals(list.get(i).get("BASKET"+j))) {
								cnt++;
							}
						}
					}
				}
				list.get(i).put("cnt",cnt);
			}
			
			
			//System.out.println(list.get(0).get("cnt"));
			
			List listcnt = new LinkedList<>();
			
			for(int i=0; i<list.size();i++) {
				listcnt.add(list.get(i).get("cnt")) ;
			}
			System.out.println(listcnt);
			Integer i = (Integer) Collections.max(listcnt);
			System.out.println("최대값 : " +i);
			
			
			for(int a=0;a<list.size();a++) {
				if(i==0) {
					return null;
				}
				if(i==list.get(a).get("cnt")) {
					System.out.println(list.get(a));
					return list.get(a);
				}
			}			
			return null;

		} finally {
			session.close();
		}

	}
	//type매칭 
		public Map Matchingpage2(String nick,String id) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = new LinkedList<>();
			//나의 정보
			System.out.println("id : " +id);
			System.out.println("nick : " +nick);
			
			Map mylist =session.selectOne("matchingboard.checkagree", nick);//list2
			System.out.println("나의 정보 : " + mylist);
			//나를 제외한 정보
			List<Map> notmylist = session.selectList("matchingboard.notmylist",nick);//list
			System.out.println("나를 제외한 정보 : "+notmylist);
			
			String mygender =  (String) mylist.get("GENDER");//나의 성별.	
			String MATCHTYPE = (String) mylist.get("MATCHTYPE");
			
			System.out.println("내 성별" + mygender);
			System.out.println("나의 매칭 타입" + MATCHTYPE);
			
			if(MATCHTYPE.equals("2")) {
				for(int a=0;a<notmylist.size();a++) {
					if(!(mylist.get("GENDER").equals(notmylist.get(a).get("GENDER"))) &&
					(notmylist.get(a).get("MATCHTYPE").equals("2") || notmylist.get(a).get("MATCHTYPE").equals("3"))	
							){
						list.add(notmylist.get(a));
						System.out.println(notmylist.get(a));
					}
				}
			}else if(MATCHTYPE.equals("1")) {
				for(int b=0;b<notmylist.size();b++) {
					if(mylist.get("GENDER").equals(notmylist.get(b).get("GENDER")) &&
						(notmylist.get(b).get("MATCHTYPE").equals("1") || notmylist.get(b).get("MATCHTYPE").equals("3"))
							) {
						list.add(notmylist.get(b));
						System.out.println(notmylist.get(b));
					}
				}
				//무관일때
			}else {
				for(int c=0;c<notmylist.size();c++) {
					String x_match = (String) notmylist.get(c).get("MATCHTYPE");
					if(x_match.equals("2")) {
						if(!(notmylist.get(c).get("GENDER").equals(mylist.get("GENDER")))) {
							list.add(notmylist.get(c));
							System.out.println("내가 무관이고 상대방이 이성 이고 내가 그 이성에 맞는 성별일때 :" +notmylist.get(c));
						}
					}else if(x_match.equals("1")){
						if((notmylist.get(c).get("GENDER").equals(mylist.get("GENDER")))) {
							list.add(notmylist.get(c));
							System.out.println("내가 무관이고 상대방이 동성이고 내가 그 동성에 맞는 성별일떄: "+ notmylist.get(c));
						}
				}
				}
			}
			System.out.println("매칭 상대 성별 필터 : "+list);
			System.out.println("이얏호");
			
			if(list.size()==0) {
				return null;
			}
			
		
			//========================  매칭 상대 구별(동,이성,남,여,)============================= 
			List mytypecnt = new LinkedList<>();
			int mycnt=1;
			for(int a=1;a<=5;a++) {
			if(mylist.containsKey("TYPE"+a)) {
				String mytype = (String) mylist.get("TYPE"+a);
				if(mylist.containsKey(mytype)) {
					int cnt = (int) mylist.get(mytype);
				mylist.put(mytype, cnt+1);
				}else {
					mylist.put(mytype, mycnt);
				}
				}
			}
			
			if(mylist.containsKey("어린이")) {
				mytypecnt.add(mylist.get("어린이"));
			}if(mylist.containsKey("연애")) {
				mytypecnt.add(mylist.get("연애"));
			}if(mylist.containsKey("스릴")) {
				mytypecnt.add(mylist.get("스릴"));
			}
			
			System.out.println("키즈 :"+ mylist.get("어린이"));
			System.out.println("연애 : "+ mylist.get("연애"));
			System.out.println("스릴 :"+ mylist.get("스릴"));
			
			String mytype = null;
			System.out.println("mytypecnt"+mytypecnt);
			Integer i = (Integer) Collections.max(mytypecnt);
			System.out.println("나의 최대 cnt"+i);
			if(mylist.containsKey("어린이") && mylist.get("어린이")==i) {
				mytype = "어린이";
			}else if(mylist.containsKey("연애") && mylist.get("연애")==i) {
				mytype = "연애";
			}else if(mylist.containsKey("스릴") && mylist.get("스릴")==i) {
				mytype = "스릴";
			}
			System.out.println(mytype);
		 
			//===============================================내 타입=================================
			
			List ntypecnt = new LinkedList<>();
			int ncnt=1;
			for(int a=0;a<list.size();a++) {
				for(int b=1;b<=5;b++) {
					if(list.get(a).containsKey("TYPE"+b)) {
						String ntype = (String) list.get(a).get("TYPE"+b);
						if(list.get(a).containsKey(ntype)) {
							int cnt = (int) list.get(a).get(ntype);
							list.get(a).put(ntype, cnt+1);
						}else {
							list.get(a).put(ntype, ncnt);
						}
					}
				}
			}
			for(int a=0;a<list.size();a++) {
				if(list.get(a).containsKey("어린이")) {
					ntypecnt.add(list.get(a).get("어린이"));
				}if(list.get(a).containsKey("연애")) {
					ntypecnt.add(list.get(a).get("연애"));
				}if(list.get(a).containsKey("스릴")) {
					ntypecnt.add(list.get(a).get("스릴"));
				}
				System.out.println("어린이"+list.get(a).get("어린이"));
				System.out.println("연애"+list.get(a).get("연애"));
				System.out.println("스릴"+list.get(a).get("스릴"));
				
				String ntype = null;
				Integer j = (Integer)  Collections.max(ntypecnt);
				System.out.println("상대의 최대 cnt"+j);
				
				if(list.get(a).containsKey("어린이") && list.get(a).get("어린이")==j) {
					ntype = "어린이";
				}else if(list.get(a).containsKey("연애") && list.get(a).get("연애")==j) {
					ntype = "연애";
				}else if(list.get(a).containsKey("스릴") && list.get(a).get("스릴")==j) {
					ntype = "스릴";
				}
				System.out.println("매칭 상대의 타입 : "+ ntype);
				if(mytype.equals(ntype)) {
					System.out.println(list.get(a));
					return list.get(a);
					
				}
			}
			
			
		return null;
		
		}finally {
			session.close();
		}
		
	}
		//내가 선택한 매칭 상대
	public List<Map> matchingcheck(String nick) {
		SqlSession session = factory.openSession();
		System.out.println(nick);
		try {
			return session.selectList("matchingboard.matchingcheck",nick);
		}finally {
			session.close();
		}
	}
	//나를 선택한 매칭 상대
	public List<Map> matchingforme(String nick) {
		SqlSession session = factory.openSession();
		System.out.println(nick);
		try {
			return session.selectList("matchingboard.matchingforme",nick);
		}finally {
			session.close();
		}
	}
	
	
	
	
	
	public int matchinginsert(Map map) {
		SqlSession session = factory.openSession();
		System.out.println(map);
		int rst = 0;
		try {
			rst = session.insert("matchingboard.matchinginsert",map);
		}catch(Exception e) {
			rst = 2;
		}
		finally {
			session.close();
		}
		return rst;
	}
	//장바구니 정보 가져오기
	public Map mybasketinfo(String nick) {
		SqlSession session = factory.openSession();
		System.out.println("나의 닉네임 : "+nick);
		try {
			return session.selectOne("basket.myinfo",nick);
		}finally {
			session.close();
		}
	}
	//장바구니 하나 삭제
	public int deletebasket(String nick,String no) {
		SqlSession session = factory.openSession();
		System.out.println("나의 닉네임 : "+nick);
		System.out.println("no : "+no);
		int rst =0;
		try {
			System.out.println("basket.delete"+no);
			rst= session.update("basket.delete"+no,nick);			
			
		}finally {
			session.close();
		}
		return rst;
	}
	//addinfo 목록 불러오기
	public Map addinfo(String id) {
		SqlSession session = factory.openSession();
		System.out.println("1   "+id);
		try {
			return session.selectOne("matchingboard.mypagelist",id);
		}finally {
			session.close();
		}
	}
	//mybasketinfo 목록 가져오기
	public Map readmybasketinfo(String nick) {
		SqlSession session = factory.openSession();
		System.out.println("2   "+nick);
		try {
			return session.selectOne("matchingboard.mybasketinfo",nick);
		}finally {
			session.close();
		}
	}
	//agree insert
	public int agree(Map map3) {
		SqlSession session = factory.openSession();
		System.out.println("3");
		int rst = 0;
		try {
			rst = session.insert("matchingboard.agree",map3);
			System.out.println("agree rst : "+ rst);
			return rst;
		}catch(Exception e) {
			return 2;
		}
		finally {
			session.close();
		}
	}
	//check agree
	public Map checkagree(String nick) {
		SqlSession session = factory.openSession();
		System.out.println("checkagree");
		try {
			return session.selectOne("matchingboard.checkagree",nick);
		}finally {
			session.close();
		}
	}
	//update agreebasket
	public int updateagree(Map map){
		SqlSession session = factory.openSession();
		System.out.println("agree update");
		int rst;
		try {
			rst =session.update("matchingboard.updatebasket",map);
			System.out.println(rst);
		return rst;
		}finally {
			session.close();
		}
	}

}
