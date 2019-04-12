package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.Movie_RateTableDao;

/**
 * Servlet implementation class Movie_DeleteRateController
 */
@WebServlet("/Movie/rate/deleteRate.do")
public class Movie_DeleteRateController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int movieNum = Integer.parseInt(request.getParameter("movieNum"));
		String id = (String) request.getSession().getAttribute("id");
		String userId = request.getParameter("userId");
		if (userId.equals(id)) {
			Movie_RateTableDao rateDao = Movie_RateTableDao.getInstance();
			int n = rateDao.delete(movieNum, userId);

			if (n > 0) {
				request.setAttribute("movieNum", movieNum);
				request.setAttribute("detail", "rate");
				request.getRequestDispatcher("/Movie/review.do").forward(request, response);
			} else {
				request.setAttribute("movieNum", movieNum);
				request.setAttribute("detail", "rate");
				request.setAttribute("code", "fail");
				request.getRequestDispatcher("/Movie/review.do").forward(request, response);
			}
		} else {
			request.setAttribute("movieNum", movieNum);
			request.setAttribute("detail", "rate");
			request.setAttribute("code", "fail");
			request.getRequestDispatcher("/Movie/review.do").forward(request, response);
		}
	}
}
