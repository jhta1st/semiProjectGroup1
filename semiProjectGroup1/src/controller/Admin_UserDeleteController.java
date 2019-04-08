package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_adminDao;

@WebServlet("/admin/delete.do")
public class Admin_UserDeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		Admin_adminDao dao = new Admin_adminDao();
		int n = dao.delete(userId);
		if (n > 0) {
			req.getRequestDispatcher("/admin/list.do").forward(req, resp);
		} else {
			req.setAttribute("code", "fail");
			req.getRequestDispatcher("/User/user_result.jsp").forward(req, resp);
		}
	}
}
