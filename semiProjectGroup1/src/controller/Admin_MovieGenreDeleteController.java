package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Movie_GenreDao;


@WebServlet("/admin/movieGenreDelete.do")
public class Admin_MovieGenreDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				int genreNum=Integer.parseInt(req.getParameter("genreNum"));
				Movie_GenreDao dao =Movie_GenreDao.getInstance();
				int n=dao.delete(genreNum);
				if(n>0) {
					req.setAttribute("pages", "/admin/movieGenreList.do");
					req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
				}else {
					req.setAttribute("resultCode", "fail");
					req.getRequestDispatcher("/admin/movieGenreList.do").forward(req, resp);
				}	
	}
}
