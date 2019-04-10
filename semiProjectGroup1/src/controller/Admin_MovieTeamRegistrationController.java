package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_CastInfoDao;
import dao.Movie_GenreDao;
import dao.User_UserInfoDao;
import vo.Movie_CastInfoVo;
import vo.Movie_GenreVo;
import vo.User_UserInfoVo;
@WebServlet("/admin/movieTeamRegistration.do")
public class Admin_MovieTeamRegistrationController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pages", "/Admin/admin_MovieTeamRegistration.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int movieNum=Integer.parseInt(req.getParameter("movieNum"));
		int charNum=Integer.parseInt(req.getParameter("charNum"));
		int castDoNum=Integer.parseInt(req.getParameter("castDoNum"));
		String castDoName=req.getParameter("castDoName");
		Movie_CastInfoVo vo=new Movie_CastInfoVo(0, charNum, castDoNum, castDoName, movieNum);
		Admin_CastInfoDao dao=Admin_CastInfoDao.getInstance();
		if(dao.castInfoWrite(vo)>0) {
			req.setAttribute("pages", "/Admin/admin_index.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "castInfoWrite½ÇÆÐ");
			req.setAttribute("pages", "/ETC/error.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
