package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_UserInfoDao;
import vo.User_UserInfoVo;

@WebServlet("/delete.do")
public class User_DeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String userId=req.getParameter("userId");
		req.setAttribute("userId", userId);
		req.getRequestDispatcher("/user/user_delete.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String userId=req.getParameter("userId");
		System.out.println("1"+userId);
		String userPwd = req.getParameter("userPwd");
		System.out.println("2"+userPwd);
		User_UserInfoDao dao = new User_UserInfoDao();
		User_UserInfoVo vo = dao.detail(userId);
		System.out.println(vo.getUserPwd());
		if(userPwd.equals(vo.getUserPwd())) {
			int n = dao.update1(vo);
			if(n > 0) {
				req.setAttribute("code", "success");
			}else {
				req.setAttribute("code", "fail");
			}
			req.getRequestDispatcher("/user/user_result.jsp").forward(req, resp);
		}else {
			req.setAttribute("userId", userId);
			req.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			req.getRequestDispatcher("/user/user_delete.jsp").forward(req, resp);
		}
	}
}
