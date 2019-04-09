package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_adminDao;
import dao.User_MsgTableDao;
import vo.User_MsgTableVo;
import vo.User_UserInfoVo;

@WebServlet("/user/msgDelete.do")
public class User_MsgDeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String userId=(String)req.getSession().getAttribute("id");
		int msgNum = Integer.parseInt(req.getParameter("msgNum"));
		User_MsgTableVo vo = new User_MsgTableVo(msgNum, null, null, null, null, 0, userId);
		User_MsgTableDao dao = new User_MsgTableDao();
		int n = dao.update1(vo);
		if (n > 0) {
			req.getRequestDispatcher("/user/msgReceiveList.do?userId=" + userId ).forward(req, resp);
		} else {
			req.setAttribute("code", "fail");
			req.getRequestDispatcher("/User/user_result.jsp").forward(req, resp);
		}
	}
}
