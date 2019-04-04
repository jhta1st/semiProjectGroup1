package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Movie_GenreDao;
import dao.Movie_MovieInfoDao;
import vo.Movie_GenreVo;
import vo.Movie_MovieInfoVo;

/**
 * Servlet implementation class Movie_ListController
 */
@WebServlet("/Movie/movielist.do")
public class Movie_ListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String keyword = req.getParameter("keyword");
		String genreName = req.getParameter("genreName");
		Movie_GenreDao genreDao = Movie_GenreDao.getInstance();
		ArrayList<Movie_GenreVo> genreNamelist = genreDao.getGenreName();
		req.setAttribute("genreNamelist", genreNamelist);
		if (keyword == null) {
			req.setAttribute("pages", "/Movie/movie_mainlist.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		} else {
			int genreNum=Integer.parseInt(genreName);
			Movie_MovieInfoDao movieDao = Movie_MovieInfoDao.getInstance();
			ArrayList<Movie_MovieInfoVo> serchList = movieDao.getSearchList(keyword, genreNum);
			req.setAttribute("serchList", serchList);
			req.setAttribute("keyword", keyword);
			req.setAttribute("genreNum", genreNum);
			req.setAttribute("pages", "/Movie/movie_searchlist.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);

		}
	}
}
