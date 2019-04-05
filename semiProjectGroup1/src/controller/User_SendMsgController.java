package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_MsgTableDao;
import dao.User_UserInfoDao;
import vo.User_MsgTableVo;
import vo.User_UserInfoVo;
@WebServlet("/user/sendMsgList.do")
public class User_SendMsgController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/User/user_sendMsg.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String msgContent = req.getParameter("msgContent");
		String receiveUserId = req.getParameter("receiveUserId");
		String sendUserId = req.getParameter("sendUserId");
		User_MsgTableVo vo = new User_MsgTableVo(0, msgContent, receiveUserId, sendUserId, null, 0);
		User_MsgTableDao dao = new User_MsgTableDao();
		int n = dao.insert(vo);
		if (n > 0) {
			req.setAttribute("code", "success");
		} else {
			req.setAttribute("code", "fail");
		}
		req.getRequestDispatcher("/User/user_result.jsp").forward(req, resp);
	}
}
