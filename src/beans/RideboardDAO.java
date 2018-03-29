package beans;

import java.util.LinkedHashMap;
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

	    //조회수 //게시판 상세보기
	   public Map detail(String ride_name) {
	      SqlSession session = factory.openSession();
	      try {

	         return session.selectOne("rideboard.detail", ride_name);

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

	   // 좋아요 수
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
	// 장바구니
	public int basket(Map map, String nick, String basket, String type) {
		SqlSession session = factory.openSession();
		int rst = 0;
		try {
			Map mylist = session.selectOne("basket.myinfo", nick);
			System.out.println(mylist);
			System.out.println(map);
			System.out.println(nick);
			System.out.println(basket);

			Map map2 = new LinkedHashMap<>();
			map2.put("basket", basket);
			map2.put("type", type);

			System.out.println(map2);

			System.out.println(mylist);

			if (mylist == null) {
				System.out.println("닉네임으로된 정보가 없음. 새로운 장바구니 insert");
				rst = session.update("basket.first", map);
				return rst;
			} else {
				for (int a = 1; a<= 5; a++) {
					if (mylist.get("BASKET" + a) != null) {
						if (mylist.get("BASKET" + a).equals(basket)) {
							return 5;// null이 아니고 같은 이름이 있다.
						} else {// 널은 아니지만 같은 이름이 아니다.
							System.out.println("비어있진 않지만 같은 놀이기구가 아니다.");
						}
					}else if (mylist.get("BASKET" + a) == null) {// 비어있다.
						for(int b=1;b<=5;b++) {
							
						}
						
						System.out.println(a + "번 들어간다");
						System.out.println(map);
						System.out.println("basket.basket" + a);
						rst = session.update("basket.basket" + a, map);
						return rst;
					}
				}
			}

			// =======================================================
			// 중복 데이터가 존재하지 않을 때
			System.out.println("중복데이터 색출 완료");
			if (mylist.get("BASKET1") == null) {
				System.out.println("바스킷 1번 들어감 : " + rst);
				rst = session.update("basket.basket1", map);
				return rst;
			} else if (mylist.get("BASKET2") == null) {
				System.out.println("바스킷 2번 들어감 : " + rst);
				rst = session.update("basket.basket2", map);
				return rst;
			} else if (mylist.get("BASKET3") == null) {
				System.out.println("바스킷 3번 들어감 : " + rst);
				rst = session.update("basket.basket3", map);
				return rst;
			} else if (mylist.get("BASKET4") == null) {
				System.out.println("바스킷 4번 들어감 : " + rst);
				rst = session.update("basket.basket4", map);
				return rst;
			} else if (mylist.get("BASKET5") == null) {
				System.out.println("바스킷 5번 들어감 : " + rst);
				rst = session.update("basket.basket5", map);
				return rst;
			} else {
				rst = 3;
				return rst;
			}

		} catch (Exception e) {
			System.out.println("이셉션!");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return rst;
	}

}
