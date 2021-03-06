package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
		Movie_GenreDao genreDao = Movie_GenreDao.getInstance();
		//Movie_MovieInfoDao movieDao = Movie_MovieInfoDao.getInstance();
		ArrayList<Movie_GenreVo> genreNamelist = genreDao.getGenreName();
		//ArrayList<ArrayList<HashMap<String, Object>>> movieMainList = movieDao.getMovieList(genreNamelist);
		req.setAttribute("genreNamelist", genreNamelist);
		//req.setAttribute("movieMainList", movieMainList);
		req.setAttribute("pages", "/Movie/movie_mainlist.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
}
