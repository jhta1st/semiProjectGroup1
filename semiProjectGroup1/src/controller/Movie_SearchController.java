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
		String pageNo = req.getParameter("pageNum");
		int pageNum = 1;
		if (pageNo != null) {
			pageNum = Integer.parseInt(pageNo);
		}
		int endRow = pageNum * 30;
		int startRow = endRow - 29;

		String keyword = req.getParameter("keyword");
		String[] genreName = req.getParameterValues("genreName");
		Movie_GenreDao genreDao = Movie_GenreDao.getInstance();
		ArrayList<Movie_GenreVo> genreNamelist = genreDao.getGenreName();
		req.setAttribute("genreNamelist", genreNamelist);

		Movie_MovieInfoDao movieDao = Movie_MovieInfoDao.getInstance();
		ArrayList<HashMap<String, Object>> serchList = movieDao.getSearchList(keyword, genreName, startRow, endRow);
		int pageCount = (int) Math.ceil(movieDao.getCountNum(keyword, genreName) / 10.0);
		int startPageNum = ((pageNum - 1) / 10 * 10) + 1;
		int endPageNum = startPageNum + 9;
		if (endPageNum > pageCount) {
			endPageNum = pageCount;
		}

		req.setAttribute("serchList", serchList);
		req.setAttribute("keyword", keyword);
		req.setAttribute("genreNum", genreName);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPageNum);
		req.setAttribute("endPage", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("pages", "/Movie/movie_searchlist.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);

	}
}
