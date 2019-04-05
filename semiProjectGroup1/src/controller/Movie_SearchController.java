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

@WebServlet("/Movie/moviesearch.do")
public class Movie_SearchController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String keyword = req.getParameter("keyword");
		String[] genreName = req.getParameterValues("genreName");
		Movie_GenreDao genreDao = Movie_GenreDao.getInstance();
		ArrayList<Movie_GenreVo> genreNamelist = genreDao.getGenreName();
		req.setAttribute("genreNamelist", genreNamelist);

		Movie_MovieInfoDao movieDao = Movie_MovieInfoDao.getInstance();
		ArrayList<HashMap<String, Object>> serchList = movieDao.getSearchList(keyword, genreName);
		req.setAttribute("serchList", serchList);
		req.setAttribute("keyword", keyword);
		req.setAttribute("genreNum", genreName);
		req.setAttribute("pages", "/Movie/movie_searchlist.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);

	}
}
