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

	// 마이 페이지내용 보여주기.(dbtest)
	public Map readmypage(String id) {
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("matchingboard.mypagelist", id);

		} finally {
			session.close();
		}
	}
	//매칭 리스트 뽑기 
	public Map Matchingpage(String nick) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = new LinkedList<>();
			//나의 정보
			Map mylist =session.selectOne("matchingboard.mypagelist", nick);//list2
			System.out.println(mylist);
			//나를 제외한 정보
			List<Map> notmylist = session.selectList("matchingboard.matchinglist",nick);//list
			
			String mygender = (String) mylist.get("gender");//나의 성별.	
			String g_match = (String) mylist.get("G_MATCH");
			
			if(g_match.equals("이성")) {
				for(int a=0;a<notmylist.size();a++) {
					if(!(mylist.get("GENDER").equals(notmylist.get(a).get("GENDER"))) &&
					(notmylist.get(a).get("G_MATCH").equals("이성") || notmylist.get(a).get("G_MATCH").equals("무관"))	
							){
						list.add(notmylist.get(a));
						System.out.println(notmylist.get(a));
					}
				}
			}else if(g_match.equals("동성")) {
				for(int b=0;b<notmylist.size();b++) {
					if(mylist.get("GENDER").equals(notmylist.get(b).get("GENDER")) &&
						(notmylist.get(b).get("G_MATCH").equals("동성") || notmylist.get(b).get("G_MATCH").equals("무관"))
							) {
						list.add(notmylist.get(b));
						System.out.println(notmylist.get(b));
					}
				}
				//무관일때
			}else {
				for(int c=0;c<notmylist.size();c++) {
					String x_match = (String) notmylist.get(c).get("G_MATCH");
					if(x_match.equals("이성")) {
						if(!(notmylist.get(c).get("GENDER").equals(mylist.get("GENDER")))) {
							list.add(notmylist.get(c));
							System.out.println("내가 무관이고 상대방이 이성 이고 내가 그 이성에 맞는 성별일때 :" +notmylist.get(c));
						}
					}else if(x_match.equals("동성")){
						if((notmylist.get(c).get("GENDER").equals(mylist.get("GENDER")))) {
							list.add(notmylist.get(c));
							System.out.println("내가 무관이고 상대방이 동성이고 내가 그 동성에 맞는 성별일떄: "+ notmylist.get(c));
						}
				}
				}
			}
			System.out.println("매칭 상대 성별 필터 : "+list);
			
			//========================  매칭 상대 구별(동,이성,남,여,)============================= 
			
			String basket1 = (String) mylist.get("BASKET1");
			String basket2 = (String) mylist.get("BASKET2");
			String basket3 = (String) mylist.get("BASKET3");
			String basket4 = (String) mylist.get("BASKET4");
			String basket5 = (String) mylist.get("BASKET5");
			
			
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
			
			
			System.out.println(list.get(0).get("cnt"));
			
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
	//담력 매칭
		public Map Matchingpage2(String nick) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = new LinkedList<>();//남여, 필터링된 list<map>
			//나의 정보
			Map mylist =session.selectOne("matchingboard.mypagelist", nick);//list2
			System.out.println(mylist);
			//나를 제외한 정보
			List<Map> notmylist = session.selectList("matchingboard.matchinglist",nick);//list
			
			String mygender = (String) mylist.get("gender");//나의 성별.	
			String g_match = (String) mylist.get("G_MATCH");
			
			if(g_match.equals("이성")) {
				for(int a=0;a<notmylist.size();a++) {
					if(!(mylist.get("GENDER").equals(notmylist.get(a).get("GENDER"))) &&
					(notmylist.get(a).get("G_MATCH").equals("이성") || notmylist.get(a).get("G_MATCH").equals("무관"))	
							){
						list.add(notmylist.get(a));
						System.out.println(notmylist.get(a));
					}
				}
			}else if(g_match.equals("동성")) {
				for(int b=0;b<notmylist.size();b++) {
					if(mylist.get("GENDER").equals(notmylist.get(b).get("GENDER")) &&
						(notmylist.get(b).get("G_MATCH").equals("동성") || notmylist.get(b).get("G_MATCH").equals("무관"))
							) {
						list.add(notmylist.get(b));
						System.out.println(notmylist.get(b));
					}
				}
				//무관일때
			}else {
				for(int c=0;c<notmylist.size();c++) {
					String x_match = (String) notmylist.get(c).get("G_MATCH");
					if(x_match.equals("이성")) {
						if(!(notmylist.get(c).get("GENDER").equals(mylist.get("GENDER")))) {
							list.add(notmylist.get(c));
							System.out.println("내가 무관이고 상대방이 이성 이고 내가 그 이성에 맞는 성별일때 :" +notmylist.get(c));
						}
					}else if(x_match.equals("동성")){
						if((notmylist.get(c).get("GENDER").equals(mylist.get("GENDER")))) {
							list.add(notmylist.get(c));
							System.out.println("내가 무관이고 상대방이 동성이고 내가 그 동성에 맞는 성별일떄: "+ notmylist.get(c));
						}
				}
				}
			}
			System.out.println("매칭 상대 성별 필터 : "+list);
			
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
			
			if(mylist.containsKey("키즈")) {
				mytypecnt.add(mylist.get("키즈"));
			}if(mylist.containsKey("연애")) {
				mytypecnt.add(mylist.get("연애"));
			}if(mylist.containsKey("스릴")) {
				mytypecnt.add(mylist.get("스릴"));
			}
			
			System.out.println("키즈 :"+ mylist.get("키즈"));
			System.out.println("연애 : "+ mylist.get("연애"));
			System.out.println("스릴 :"+ mylist.get("스릴"));
			
			String mytype = null;
			Integer i = (Integer) Collections.max(mytypecnt);
			System.out.println("나의 최대 cnt"+i);
			if(mylist.containsKey("키즈") && mylist.get("키즈")==i) {
				mytype = "키즈";
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
				if(list.get(a).containsKey("키즈")) {
					ntypecnt.add(list.get(a).get("키즈"));
				}if(list.get(a).containsKey("연애")) {
					ntypecnt.add(list.get(a).get("연애"));
				}if(list.get(a).containsKey("스릴")) {
					ntypecnt.add(list.get(a).get("스릴"));
				}
				System.out.println("키즈"+list.get(a).get("키즈"));
				System.out.println("연애"+list.get(a).get("연애"));
				System.out.println("스릴"+list.get(a).get("스릴"));
				
				String ntype = null;
				Integer j = (Integer)  Collections.max(ntypecnt);
				System.out.println("상대의 최대 cnt"+j);
				
				if(list.get(a).containsKey("키즈") && list.get(a).get("키즈")==j) {
					ntype = "키즈";
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
	public List<Map> matchingcheck(String nick) {
		SqlSession session = factory.openSession();
		System.out.println(nick);
		try {
			return session.selectList("matchingboard.matchingcheck",nick);
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
		}finally {
			session.close();
		}
		return rst;
	}
}
