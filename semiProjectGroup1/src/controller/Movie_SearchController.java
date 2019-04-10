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
		String[] genreName = { "0" };
		if (req.getParameterValues("genreName") != null) {
			genreName = req.getParameterValues("genreName");
			if (genreName[0].equals("-1")) {
				genreName[0] = "0";
			}
		}
		Movie_GenreDao genreDao = Movie_GenreDao.getInstance();
		ArrayList<Movie_GenreVo> genreNamelist = genreDao.getGenreName();
		req.setAttribute("genreNamelist", genreNamelist);

		Movie_MovieInfoDao movieDao = Movie_MovieInfoDao.getInstance();
		ArrayList<HashMap<String, Object>> serchList = movieDao.getSearchList(keyword, genreName, startRow, endRow);
		int pageCount = (int) Math.ceil(movieDao.getCountNum(keyword, genreName) / 30.0);
		int startPageNum = ((pageNum - 1) / 10 * 10) + 1;
		int endPageNum = startPageNum + 9;
		if (endPageNum > pageCount) {
			endPageNum = pageCount;
		}
		String ss = "";
		for (int i = 0; i < genreName.length; i++) {
			ss = ss + "&genreName=" + genreName[i];

		}

		req.setAttribute("serchList", serchList);
		req.setAttribute("keyword", keyword);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPageNum);
		req.setAttribute("endPage", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("resultCount", movieDao.getCountNum(keyword, genreName));
		if (genreName.length == 1 && genreName[0].equals("0")) {
			genreName[0] = "-1";
			req.setAttribute("genreNum", genreName);
		} else {
			req.setAttribute("genreNum", genreName);
		}
		req.setAttribute("search", ss);
		req.setAttribute("pages", "/Movie/movie_searchlist.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);

	}
}
