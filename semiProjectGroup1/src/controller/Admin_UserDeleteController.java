package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_adminDao;
import vo.User_UserInfoVo;

@WebServlet("/admin/delete.do")
public class Admin_UserDeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		String userNickName = req.getParameter("userNickName");
		User_UserInfoVo vo = new User_UserInfoVo(userId, userPwd, userNickName, 0, 0, null, 0);
		Admin_adminDao dao = new Admin_adminDao();
		int n = dao.update1(vo);
		if (n > 0) {
			req.setAttribute("pages", "/admin/list.do");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		} else {
			req.setAttribute("code", "fail");
			req.setAttribute("pages", "/admin/list.do");
			req.getRequestDispatcher("/User/user_result.jsp").forward(req, resp);
		}
	}
}
