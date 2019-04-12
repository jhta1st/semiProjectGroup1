package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.User_UserInfoDao;
import vo.User_UserInfoVo;

@WebServlet("/user/nickNameCheck.do")
public class User_UserInfoRegistrationNickNameCheckController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userNickName = req.getParameter("userNickName");
		User_UserInfoDao dao = new User_UserInfoDao();
		User_UserInfoVo vo = dao.detailNick(userNickName);
		JSONObject json = new JSONObject();
		if (vo != null) {
			json.put("code", "success");
		} else {
			json.put("code", "fail");
		}

		resp.setContentType("text/plain;charset=utf-8");
		resp.getWriter().print(json.toString());
	}
}
