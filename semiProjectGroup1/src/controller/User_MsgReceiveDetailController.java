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

@WebServlet("/user/msgReceiveDetail.do")
public class User_MsgReceiveDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int msgNum=Integer.parseInt(req.getParameter("msgNum"));
		
		User_MsgTableDao dao = new User_MsgTableDao();
		User_MsgTableVo vo = dao.detail(msgNum); 
		dao.updateMsgCheck(msgNum);
		req.setAttribute("vo", vo);
		req.setAttribute("type", "RECEIVE");
		req.getRequestDispatcher("/User/user_myMsgDetail.jsp").forward(req, resp);
	}
}
