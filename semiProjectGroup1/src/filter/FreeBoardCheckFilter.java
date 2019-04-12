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
 * Servlet Filter implementation class FreeBoardCheckFilter
 */

@WebFilter(urlPatterns = { "/Freeboard/*", "/freeboard/*","/user/update.do","/User/update.do",
		"/user/delete.do","/User/delete.do","/user/detail.do","/User/detail.do",
		"/user/msgSendList.do","/User/msgSendList.do","/user/msgSendForm.do","/User/msgSendForm.do",
		"/user/msgSendDetail.do","/User/msgSendDetail.do","/user/msgReceiveList.do","/User/msgReceiveList.do",
		"/user/msgReceiveDetail.do","/User/msgReceiveDetail.do","/user/msgDelete.do","/User/msgDelete.do"})
public class FreeBoardCheckFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public FreeBoardCheckFilter() {
		
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
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
 			if (id != null) {
				if (!id.equals("id")) {
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
	
	}

}
