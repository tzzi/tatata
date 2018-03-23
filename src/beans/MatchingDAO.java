package beans;


import java.math.BigDecimal;
import java.util.Collections;
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
			System.out.println(session.selectList("matchingboard.matchinglist", nick));
			
			//나를 제외한 정보
			List<Map> list = session.selectList("matchingboard.matchinglist",nick);
			//나의 정보
			Map list2 =session.selectOne("matchingboard.mypagelist", nick);
			
			System.out.println("내정보:"+list2);
			System.out.println(list);
			
			String basket1 = (String) list2.get("BASKET1");
			String basket2 = (String) list2.get("BASKET2");
			String basket3 = (String) list2.get("BASKET3");
			String basket4 = (String) list2.get("BASKET4");
			String basket5 = (String) list2.get("BASKET5");
			
			
			
			System.out.println(list.get(0));
			
			for(int i=0; i<list.size();i++) {
				int cnt = 0;
				for(int j=1;j<=5;j++) {
					for(int z=1;z<=5;z++) {
						if((list2.get("BASKET"+z)!=null && list.get(i).get("BASKET"+j)!=null)){
							if((list2.get("BASKET"+z)).equals(list.get(i).get("BASKET"+j))) {
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
		//나를 제외한 정보
		List<Map> notmylist = session.selectList("matchingboard.matchinglist",nick);
		//나의 정보
		Map mylist =session.selectOne("matchingboard.mypagelist", nick);
		
		
		
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
		
		
		for(int d=0;d<notmylist.size();d++) {
			BigDecimal intnotmyAVG = new BigDecimal("0");
			BigDecimal notmyAVG1 = new BigDecimal("0");
			BigDecimal one = new BigDecimal("1");
			for(int e=1;e<=5;e++) {
				if(notmylist.get(d).get("LEVEL"+e)!=null && mylist.get("LEVEL"+e)!=null) {
					notmyAVG1 = notmyAVG1.add((BigDecimal) notmylist.get(d).get("LEVEL"+e));
					intnotmyAVG = intnotmyAVG.add(one);
					System.out.println("나눌 값1 : "+intnotmyAVG);
					System.out.println("나누어지는값 : "+notmyAVG1);					
				}
			}
			notmylist.get(d).put("notmyAVG1", notmyAVG1);//level 더한 값
			notmylist.get(d).put("intnotmyAVG",intnotmyAVG);//나누어지는 값
			System.out.println(d+"번쨰 값의 평균"+notmyAVG1.divide(intnotmyAVG,BigDecimal.ROUND_DOWN ));//최좀 평균
			notmylist.get(d).put("AVG", notmyAVG1.divide(intnotmyAVG,BigDecimal.ROUND_DOWN ));//최종값을 AVG를 키로 저장
			System.out.println(d+"번째 값의 최종평균"+notmylist.get(d).get("AVG"));
			System.out.println();
		}
		
		for(int f=0;f<notmylist.size();f++) {
			if(myAVG.divide(AVG,BigDecimal.ROUND_DOWN).compareTo((BigDecimal) notmylist.get(f).get("AVG"))==0) {
				System.out.println("f값:" +f);
				System.out.println(myAVG.divide(AVG,BigDecimal.ROUND_DOWN));
				System.out.println(notmylist.get(f).get("AVG"));
				return notmylist.get(f);
			}
		}
	
		return null;
	
		}finally {
			session.close();
		}
		
	}
}
