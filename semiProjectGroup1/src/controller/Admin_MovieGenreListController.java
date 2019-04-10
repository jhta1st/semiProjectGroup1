package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Movie_GenreDao;
import vo.Movie_GenreVo;



@WebServlet("/admin/movieGenreList.do")
public class Admin_MovieGenreListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Movie_GenreDao dao = Movie_GenreDao.getInstance();
		ArrayList<Movie_GenreVo> list =dao.listAll();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/Admin/admin_MovieGenreList.jsp").forward(req, resp);
	}
}
