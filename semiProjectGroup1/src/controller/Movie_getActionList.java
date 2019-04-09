package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.Movie_MovieInfoDao;

/**
 * Servlet implementation class Movie_getActionList
 */
@WebServlet("/Movie/getActionList.do")
public class Movie_getActionList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Movie_getActionList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int genreNum = Integer.parseInt(request.getParameter("genreNum"));
		int startNum = Integer.parseInt(request.getParameter("startNum"));
		int endNum = Integer.parseInt(request.getParameter("endNum"));
		Movie_MovieInfoDao movieDao = Movie_MovieInfoDao.getInstance();
		ArrayList<HashMap<String, Object>> list = movieDao.getMovieList(genreNum, startNum, endNum);
		JSONArray jsonArray = new JSONArray();
		for (HashMap<String, Object> map : list) {
			JSONObject json = new JSONObject();
			json.put("movieNum", map.get("movieNum"));
			json.put("movieName", map.get("movieName"));
			json.put("imageNum", map.get("imageNum"));
			json.put("imageSavName", map.get("imageSavName"));
			jsonArray.add(json);
		}
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.print(jsonArray.toString());
	}

}
