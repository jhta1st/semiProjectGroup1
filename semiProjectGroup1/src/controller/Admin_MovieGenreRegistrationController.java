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
@WebServlet("/admin/movieGenreRegistration.do")
public class Admin_MovieGenreRegistrationController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pages", "/Admin/admin_MovieGenreRegistration.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String genreName=req.getParameter("genreName");
		Movie_GenreVo vo=new Movie_GenreVo(0, genreName);
		Movie_GenreDao dao=Movie_GenreDao.getInstance();
		if(dao.genreWrite(vo)>0) {
			req.setAttribute("errMsg", "등록되었습니다.");
			req.setAttribute("pages", "/Admin/admin_MovieGenreRegistration.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "genreWrite실패");
			req.setAttribute("pages", "/Admin/admin_MovieGenreRegistration.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
