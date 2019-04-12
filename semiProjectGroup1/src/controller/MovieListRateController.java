package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.Movie_RateTableDao;
import vo.Movie_RateTableVo;

/**
 * Servlet implementation class MovieListRateController
 */
@WebServlet("/Movie/rate/listRate.do")
public class MovieListRateController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		int movieNum = Integer.parseInt(request.getParameter("movieNum"));
//		Movie_RateTableDao rateDao = Movie_RateTableDao.getInstance();
//		ArrayList<Movie_RateTableVo> list = rateDao.list(movieNum);
//		JSONArray jsonArray = new JSONArray();
//		for (Movie_RateTableVo rateVo : list) {
//			JSONObject json = new JSONObject();
//			json.put("rate", rateVo.getRate());
//			json.put("rateComm", rateVo.getRateComm());
//			json.put("userId", rateVo.getUserId());
//			jsonArray.add(json);
//		}
//		response.setContentType("text/plain;charset=utf-8");
//		PrintWriter pw = response.getWriter();
//		pw.print(jsonArray.toString());
	}

}
