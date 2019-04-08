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
import dao.Movie_MovieInfoDao;
import dao.Movie_ReviewImageDao;
import dao.Movie_UrlInfoDao;

/**
 * Servlet implementation class Movie_MovieReviewController
 */
@WebServlet("/Movie/review.do")
public class Movie_MovieReviewController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String movieNums = request.getParameter("movieNum");
		String detail = request.getParameter("detail");
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
		if (detail.equals("info")) {
			movieotherList = movieInfolist;
		} else if (detail.equals("crew")) {
			movieotherList = charInfoDao.getCharinfo(movieNum);
		} else if (detail.equals("photo")) {
			movieotherList = reviewImgDao.getImages(movieNum);
		} else if (detail.equals("vedio")) {
			movieotherList = urlInfoDao.getVedioUrl(movieNum);
		} else if (detail.equals("rate")) {
			movieotherList = movieInfolist;
		}
		request.setAttribute("movieNum", movieNum);
		request.setAttribute("movieInfolist", movieInfolist);
		request.setAttribute("movieotherList", movieotherList);
		request.setAttribute("detail", detail);
		request.setAttribute("pages", "/Movie/movie_viewInfo.jsp");
		request.getRequestDispatcher("/main/layout.jsp").forward(request, response);
	}

}
