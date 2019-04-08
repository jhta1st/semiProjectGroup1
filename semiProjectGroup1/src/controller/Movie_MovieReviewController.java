package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Movie_MovieInfoDao;

/**
 * Servlet implementation class Movie_MovieReviewController
 */
@WebServlet("/Movie/review.do")
public class Movie_MovieReviewController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String movieNum = request.getParameter("movieNum");
		String detail = request.getParameter("detail");
		ArrayList<HashMap<String, Object>> movieInfolist = null;
		if (detail == null) {
			detail = "info";
		}
		Movie_MovieInfoDao movieDao = Movie_MovieInfoDao.getInstance();
		if (detail.equals("info")) {
			movieInfolist = movieDao.getInfo(Integer.parseInt(movieNum));
		} else if (detail.equals("crew")) {
			System.out.println(detail);
		} else if (detail.equals("actor")) {
			System.out.println(detail);
		} else if (detail.equals("photo")) {
			System.out.println(detail);
		} else if (detail.equals("vedio")) {
			System.out.println(detail);
		} else if (detail.equals("rate")) {
			System.out.println(detail);
		}
		request.setAttribute("movieNum", movieNum);
		request.setAttribute("movieInfolist", movieInfolist);
		request.setAttribute("pages", "/Movie/movie_viewInfo.jsp");
		request.getRequestDispatcher("/main/layout.jsp").forward(request, response);
	}

}
