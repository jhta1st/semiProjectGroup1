package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_UserInfoDao;
import vo.User_UserInfoVo;
@WebServlet("/user/registration.do")
public class User_UserInfoRegistrationController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/user/user_registration.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		String userNickName = req.getParameter("userNickName");
		User_UserInfoVo vo = new User_UserInfoVo(userId, userPwd, userNickName, 1, 0, null, 2);
		User_UserInfoDao dao = new User_UserInfoDao();
		int n = dao.insert(vo);
		if (n > 0) {
			req.setAttribute("code", "success");
		} else {
			req.setAttribute("code", "fail");
		}
		req.getRequestDispatcher("/user/user_result.jsp").forward(req, resp);
	}
}
