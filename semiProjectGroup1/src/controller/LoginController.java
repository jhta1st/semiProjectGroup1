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
			// DAO�� ����ؼ� ȸ������ �ƴ��� true,false������ �޾ƿ� ������.
			boolean result = false;
			LoginDao dao = LoginDao.getInstance();
			result = dao.isMember(id, pwd);
			System.out.println(result);

			if (result) {// ȸ���� ���
				req.getSession().setAttribute("id", id);
				resp.sendRedirect(req.getContextPath() + "/home");
			} else {// ȸ���� �ƴ� ���
				req.setAttribute("errMsg", "���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʾƿ�");
				req.getRequestDispatcher("/member/login.jsp").forward(req, resp);
			}
		} else {

		}
	}

}
