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
@WebFilter(urlPatterns = { "/Admin/*", "/admin/*" })
public class AdminCheckFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AdminCheckFilter() {
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
		boolean admin = false;
		// ���ǿ� id�� �ִ��� �������� ���� ������ boolean������ ������ ������(true,false)
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		if (session != null) {
			String id = (String) session.getAttribute("id");
			if (id != null) {
				if (id.equals("Master")) {
					admin = true;
				}
			}
		}
		if (admin) {// �������� ��� ���
			chain.doFilter(request, response);
		} else {// �����ڰ� �ƴ� ��� ���� ���
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
