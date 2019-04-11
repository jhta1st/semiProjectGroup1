package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_UserInfoDao;
import vo.User_UserInfoVo;


@WebServlet("/update.do")
public class User_UpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String userId=req.getParameter("userId");
		User_UserInfoDao dao=new User_UserInfoDao();
		User_UserInfoVo vo=dao.detail(userId);
		req.setAttribute("vo", vo);
		req.setAttribute("pages", "/User/user_update.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			String userNickName = req.getParameter("userNickName");
			User_UserInfoVo vo = new User_UserInfoVo(userId, userPwd, userNickName, 0, 0, null, 0);
			User_UserInfoDao dao = new User_UserInfoDao();
			int n=dao.update(vo);
			if(n>0) {
				req.setAttribute("code", "success");
			}else {
				req.setAttribute("code", "fail");
			}
			req.getRequestDispatcher("/User/user_result.jsp").forward(req, resp);
	}
}
