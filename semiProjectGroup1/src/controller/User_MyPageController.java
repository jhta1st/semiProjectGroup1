package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_UserInfoDao;
import vo.User_UserInfoVo;
@WebServlet("/user/detail.do")
public class User_MyPageController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		User_UserInfoDao dao = new User_UserInfoDao();
		User_UserInfoVo vo = dao.detail(userId);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/main/layout.jsp?spage=/user/user_myPage.jsp").forward(req, resp);
	}
}
