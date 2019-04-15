package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_UserInfoDao;
import vo.User_UserInfoVo;

@WebServlet("/user/delete.do")
public class User_DeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String userId=req.getParameter("userId");
		req.setAttribute("userId", userId);
		req.setAttribute("pages", "/User/user_delete.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String userId=req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		User_UserInfoDao dao = new User_UserInfoDao();
		User_UserInfoVo vo = dao.detail(userId);
		if(userPwd.equals(vo.getUserPwd())) {
			int n = dao.update1(vo);
			if(n > 0) {
				req.setAttribute("code", "success");
				req.getSession().invalidate();
		 }else {
				req.setAttribute("code", "fail");
			}
			req.setAttribute("pages", "/User/user_result.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}else {
			req.setAttribute("userId", userId);
			req.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			req.setAttribute("pages", "/User/user_delete.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
