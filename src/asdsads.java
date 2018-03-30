import java.util.LinkedHashMap;
import java.util.Map;

public class asdsads {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(!("a".equals("b")));
		Map map1 = new LinkedHashMap<>();
		int cnt = 0;
		map1.put("1",cnt+1 );
		System.out.println(map1.get("1"));
		
		Map map2 = new LinkedHashMap<>();
		map2.put("1", cnt+1);
		
		Map map3 = new LinkedHashMap<>();
		map3.put("1", map1);
		map3.put("1", map2);
		
		System.out.println(map3.get("1"));
	}

}
