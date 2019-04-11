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
@WebServlet("/main/login.do")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if (id == null) {
			request.setAttribute("pages", "/main/login.jsp");
			request.getRequestDispatcher("/main/layout.jsp").forward(request, response);
		} else {
			request.getSession().invalidate();
			request.getRequestDispatcher("/main/home.do").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		boolean result = false;
		LoginDao dao = LoginDao.getInstance();
		result = dao.isMember(id, pwd);
		if (result) {// 회원인 경우
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("userPower", dao.getUserPower(id, pwd));
			request.getRequestDispatcher("/main/home.do").forward(request, response);
		} else {// 회원이 아닌 경우
			request.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않아요");
			request.setAttribute("id", id);
			request.setAttribute("pwd", pwd);
			request.setAttribute("pages", "/main/login.jsp");
			request.getRequestDispatcher("/main/layout.jsp").forward(request, response);
		}
	}
}
