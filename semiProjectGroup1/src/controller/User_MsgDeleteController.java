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

@WebServlet("/user/msgDelete.do")
public class User_MsgDeleteController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		req.setCharacterEncoding("utf-8");

		int msgNum = Integer.parseInt(req.getParameter("msgNum"));
		String userId = req.getParameter("userId").trim();
		
		User_MsgTableDao dao = new User_MsgTableDao();

		JSONObject json = new JSONObject();		
		if (dao.updateDeleteUser(msgNum, userId) > 0) {
			json.put("code", "success");
		} else {
			json.put("code", "fail");
		}
		resp.setContentType("text/plain;charset=utf-8");
		resp.getWriter().print(json.toString());//json문자열로 응답하기
	}
}
