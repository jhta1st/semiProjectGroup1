package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminCheckFilter
 */
// 다른아이디로 접속하였을때 타 아이디로 작성한 글의 수정이나 삭제가 불가능하게 필터하는 법 구현
@WebFilter(urlPatterns = { "/Freeboard/*", "/freeboard/*", "/User/*", "/user/*","/Movie/*", "/movie/*"})
public class FreeBoardCheckFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public FreeBoardCheckFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		boolean userId = false;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		if (session != null) {
			String id = (String) session.getAttribute("id");
			int userPower = (int) session.getAttribute("userPower");
 			if (id != null) {
				if (id != null && userPower!=3) {
					userId = true;
				}
			}
		}
		if (userId) {
			chain.doFilter(request, response);
		} else {
			HttpServletResponse resp = (HttpServletResponse) response;
			resp.sendRedirect(req.getContextPath() + "/main/home.do");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
