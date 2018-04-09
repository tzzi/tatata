package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthFilter implements Filter{
  
	public void init(FilterConfig config) throws ServletException {
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		String uri = request.getRequestURI();
		System.out.println("TARGET URI : " + uri);
		HttpSession session = request.getSession();
	
		if (uri.startsWith("/login/loginindex.do") || uri.startsWith("/join/joinindex.do") ) {
			chain.doFilter(req, resp);
			
		} else {
			
			StringBuffer url = request.getRequestURL();
			System.out.println("TARGET URL : " + url);
			HttpServletResponse response = (HttpServletResponse)resp;
			
			if(session.getAttribute("auth")!=null) {
				chain.doFilter(req, resp);
			} else {
				response.sendRedirect("/login/loginindex.do?redirect="+uri);
			}
		}
	}
			
	public void destroy() {
		
	}
	

}
