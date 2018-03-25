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
	public Map readmypage(String nick) {
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("matchingboard.mypagelist", nick);

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
		
		 int intmyAVG = 0;
		 for(int c=1;c<=5;c++) {
			 if(mylist.get("LEVEL"+c)!=null) {
				 intmyAVG++;
			 }
		 }
		System.out.println("나눌숫자:" +intmyAVG);
		BigDecimal AVG = new BigDecimal(intmyAVG);//나눌 숫자
		 BigDecimal myAVG = new BigDecimal("0"); 
		for(int i=1;i<=5;i++) {
			if(mylist.get("LEVEL"+i)!=null) {
			myAVG = myAVG.add((BigDecimal) mylist.get("LEVEL"+i));
			}
			}
		//나의 level 평균
		System.out.println("나의 평균:" + myAVG.divide(AVG,BigDecimal.ROUND_DOWN));	
		
		
		for(int d=0;d<list.size();d++) {
			BigDecimal intnotmyAVG = new BigDecimal("0");
			BigDecimal notmyAVG1 = new BigDecimal("0");
			BigDecimal one = new BigDecimal("1");
			for(int e=1;e<=5;e++) {
				if(list.get(d).get("LEVEL"+e)!=null && mylist.get("LEVEL"+e)!=null) {
					notmyAVG1 = notmyAVG1.add((BigDecimal) list.get(d).get("LEVEL"+e));
					intnotmyAVG = intnotmyAVG.add(one);
					System.out.println("나눌 값1 : "+intnotmyAVG);
					System.out.println("나누어지는값 : "+notmyAVG1);					
				}
			}
			list.get(d).put("notmyAVG1", notmyAVG1);//level 더한 값
			list.get(d).put("intnotmyAVG",intnotmyAVG);//나누어지는 값
			System.out.println(d+"번쨰 값의 평균"+notmyAVG1.divide(intnotmyAVG,BigDecimal.ROUND_DOWN ));//최좀 평균
			list.get(d).put("AVG", notmyAVG1.divide(intnotmyAVG,BigDecimal.ROUND_DOWN ));//최종값을 AVG를 키로 저장
			System.out.println(d+"번째 값의 최종평균"+list.get(d).get("AVG"));
			System.out.println();
		}
		
		for(int f=0;f<list.size();f++) {
			if(myAVG.divide(AVG,BigDecimal.ROUND_DOWN).compareTo((BigDecimal) list.get(f).get("AVG"))==0) {
				System.out.println("f값:" +f);
				System.out.println(myAVG.divide(AVG,BigDecimal.ROUND_DOWN));
				System.out.println(list.get(f).get("AVG"));
				return list.get(f);
			}
		}
	
		return null;
	
		}finally {
			session.close();
		}
		
	}
}
