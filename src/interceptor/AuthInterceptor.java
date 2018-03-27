package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 로그인 처리를 담당하는 인터셉터
public class AuthInterceptor extends HandlerInterceptorAdapter{
	// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) 
			throws Exception{
		HttpSession session = req.getSession(); // session 객체 가져옴
		Object obj = session.getAttribute("login"); // login 처리 담당하는 사용자 정보를 담고 있는 객체 가져옴
		
		if (obj == null) { // 로그인이 안되어 있으면,
			resp.sendRedirect("/login/loginindex.do");
			return false; // 더이상 컨트롤러 요청이 가지 않도록 false로 반환
		}
		
		// preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미
		// 따라서 true로 하면 컨트롤러 uri로 가게 됨
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(req,resp,handler,modelAndView);
	}
}
