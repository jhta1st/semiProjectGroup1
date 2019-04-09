package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Movie_GenreDao;
import dao.User_UserInfoDao;
import vo.Movie_GenreVo;
import vo.User_UserInfoVo;
@WebServlet("/admin/movieInfoRegistration.do")
public class Admin_MovieInfoRegistrationController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Movie_GenreDao dao=Movie_GenreDao.getInstance();
		ArrayList<Movie_GenreVo> genreList=dao.getGenreName();
		req.setAttribute("genreList", genreList);
		req.setAttribute("pages", "/Admin/admin_MovieInfoRegistration.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
