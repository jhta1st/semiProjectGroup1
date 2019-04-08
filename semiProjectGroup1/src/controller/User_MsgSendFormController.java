package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.User_MsgTableDao;
import vo.User_MsgTableVo;

@WebServlet("/user/msgSendForm.do")
public class User_MsgSendFormController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		req.getRequestDispatcher("/User/user_myMsgSend.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		req.setCharacterEncoding("utf-8");

		String sendUserId = req.getParameter("sendUserId").trim();
		String receiveUserId = req.getParameter("receiveUserId").trim();
		String content = req.getParameter("content");
		
		User_MsgTableDao dao = new User_MsgTableDao();
		User_MsgTableVo vo = new User_MsgTableVo();
		vo.setSendUserId(sendUserId);
		vo.setReceiveUserId(receiveUserId);
		vo.setMsgContent(content);

		JSONObject json = new JSONObject();		
		if (dao.insert(vo) > 0) {
			json.put("code", "success");
		} else {
			json.put("code", "success");
		}
		resp.setContentType("text/plain;charset=utf-8");
		resp.getWriter().print(json.toString());//json문자열로 응답하기
	}
}
