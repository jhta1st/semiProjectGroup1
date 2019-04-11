package controller;

import java.io.IOException;
import java.util.HashMap;

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
		int exp=dao.expCalc(userId);
		int lev=dao.levCalc(userId);
		req.setAttribute("exp", exp);
		req.setAttribute("lev", lev);
		req.setAttribute("vo", vo);
		req.setAttribute("pages", "/User/user_myPage.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
}
