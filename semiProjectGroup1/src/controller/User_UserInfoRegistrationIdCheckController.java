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

@WebServlet("/user/check.do")
public class User_UserInfoRegistrationIdCheckController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String userId=req.getParameter("userId");
		
		User_UserInfoDao dao = new User_UserInfoDao();
		User_UserInfoVo vo = dao.detail(userId);

		JSONObject json = new JSONObject();
		if (vo != null && vo.getUserId() != null && vo.getUserId().length() > 0&&vo.getUserPower()!=3) {
			json.put("code", "success");
		} else {
			json.put("code", "fail");
		}
		
		resp.setContentType("text/plain;charset=utf-8");
		resp.getWriter().print(json.toString());//json문자열로 응답하기
	}
}
