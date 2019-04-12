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
import vo.Movie_RateTableVo;

/**
 * Servlet implementation class Movie_InsertRate
 */
@WebServlet("/Movie/rate/insertRate.do")
public class Movie_InsertRateController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int movieNum = Integer.parseInt(request.getParameter("movieNum"));
		double rate = Double.parseDouble(request.getParameter("rate"));
		String rateComm = request.getParameter("rateComm");
		String userId = (String) request.getSession().getAttribute("id");

		Movie_RateTableDao rateDao = Movie_RateTableDao.getInstance();
		Movie_RateTableVo rateVo = new Movie_RateTableVo(rate, rateComm, userId, movieNum);
		int n = rateDao.insert(rateVo);
		if (n > 0) {
			request.setAttribute("movieNum", movieNum);
			request.setAttribute("detail", "rate");
			request.getRequestDispatcher("/Movie/review.do").forward(request, response);
		}else {
			request.setAttribute("movieNum", movieNum);
			request.setAttribute("detail", "rate");
			request.setAttribute("code", "fail");
			request.setAttribute("rate", rate);
			request.setAttribute("rateComm", rateComm);
			request.getRequestDispatcher("/Movie/review.do").forward(request, response);
		}
	}

}
