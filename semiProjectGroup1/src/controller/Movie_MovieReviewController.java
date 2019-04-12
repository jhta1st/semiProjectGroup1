package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Movie_CharInfoDao;
import dao.Movie_GenreDao;
import dao.Movie_MovieInfoDao;
import dao.Movie_RateTableDao;
import dao.Movie_ReviewImageDao;
import dao.Movie_UrlInfoDao;
import vo.Movie_GenreVo;

/**
 * Servlet implementation class Movie_MovieReviewController
 */
@WebServlet("/Movie/review.do")
public class Movie_MovieReviewController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String movieNums = request.getParameter("movieNum");
		String detail = request.getParameter("detail");
		String details = (String) request.getAttribute("detail");
		if (details != null) {
			detail = details;
		}
		Movie_MovieInfoDao movieDao = Movie_MovieInfoDao.getInstance();
		int movieNum = Integer.parseInt(movieNums);
		ArrayList<HashMap<String, Object>> movieInfolist = movieDao.getInfo(movieNum);
		ArrayList<HashMap<String, Object>> movieotherList = null;
		if (detail == null) {
			detail = "info";
		}
		Movie_CharInfoDao charInfoDao = Movie_CharInfoDao.getInstance();
		Movie_ReviewImageDao reviewImgDao = Movie_ReviewImageDao.getInstance();
		Movie_UrlInfoDao urlInfoDao = Movie_UrlInfoDao.getInstance();
		Movie_RateTableDao rateDao = Movie_RateTableDao.getInstance();
		double rateAve = rateDao.rateAve(movieNum);
		if (detail.equals("info")) {
			movieotherList = movieInfolist;
		} else if (detail.equals("crew")) {
			movieotherList = charInfoDao.getCharinfo(movieNum);
		} else if (detail.equals("photo")) {
			movieotherList = reviewImgDao.getImages(movieNum);
		} else if (detail.equals("vedio")) {
			movieotherList = urlInfoDao.getVedioUrl(movieNum);
		} else if (detail.equals("rate")) {
			movieotherList = rateDao.list(movieNum);
		}
		request.setAttribute("movieNum", movieNum);
		String keyword = request.getParameter("keyword");
		String[] genreName = { "0" };
		if (request.getParameterValues("genreName") != null) {
			genreName = request.getParameterValues("genreName");
			if (genreName[0].equals("-1")) {
				genreName[0] = "0";
			}
		}
		String ss = "";
		for (int i = 0; i < genreName.length; i++) {
			ss = ss + "&genreName=" + genreName[i];
		}
		Movie_GenreDao genreDao = Movie_GenreDao.getInstance();
		ArrayList<Movie_GenreVo> genreNamelist = genreDao.getGenreName();
		request.setAttribute("genreNamelist", genreNamelist);
		request.setAttribute("keyword", keyword);
		request.setAttribute("search", ss);
		if (genreName.length == 1 && genreName[0].equals("0")) {
			genreName[0] = "-1";
			request.setAttribute("genreNum", genreName);
		} else {
			request.setAttribute("genreNum", genreName);
		}
		String code = (String) request.getAttribute("code");
		if (code == null) {
			code = "";
		}
		String rateComm = (String) request.getAttribute("rateComm");
		if (rateComm == null) {
			rateComm = "";
		}
		Object rates = request.getAttribute("rate");
		double rate = 0;
		if (rates != null) {
			rate = (Double) rates;
		} else {
			rate = 5;
		}
		request.setAttribute("code", code);
		request.setAttribute("rateComm", rateComm);
		request.setAttribute("rate", rate);
		request.setAttribute("movieInfolist", movieInfolist);
		request.setAttribute("movieotherList", movieotherList);
		request.setAttribute("rateAve", rateAve);
		request.setAttribute("detail", detail);
		request.setAttribute("pages", "/Movie/movie_viewInfo.jsp");
		request.getRequestDispatcher("/main/layout.jsp").forward(request, response);
	}

}
