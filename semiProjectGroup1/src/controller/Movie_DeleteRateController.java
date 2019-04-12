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
		String userId = (String) request.getSession().getAttribute("id");

		Movie_RateTableDao rateDao = Movie_RateTableDao.getInstance();
		int n = rateDao.delete(movieNum, userId);

		JSONObject json = new JSONObject();
		if (n > 0) {
			json.put("code", "success");
		} else {
			json.put("code", "fail");
		}
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.print(json.toString());
	}

}
