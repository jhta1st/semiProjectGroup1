package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/main/login")
public class LoginController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if (id == null) {
			id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			// DAO를 사용해서 회원인지 아닌지 true,false값으로 받아와 보세요.
			boolean result = false;
			LoginDao dao = LoginDao.getInstance();
			result = dao.isMember(id, pwd);
			System.out.println(result);

			if (result) {// 회원인 경우
				req.getSession().setAttribute("id", id);
				resp.sendRedirect(req.getContextPath() + "/home");
			} else {// 회원이 아닌 경우
				req.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않아요");
				req.getRequestDispatcher("/member/login.jsp").forward(req, resp);
			}
		} else {

		}
	}

}
