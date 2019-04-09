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

import dao.Movie_GenreDao;
import dao.Movie_MovieInfoDao;
import vo.Movie_GenreVo;

/**
 * Servlet implementation class Movie_getListController
 */
@WebServlet("/Movie/getList.do")
public class Movie_getListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Movie_getListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Movie_GenreDao genreDao = Movie_GenreDao.getInstance();
		Movie_MovieInfoDao movieDao = Movie_MovieInfoDao.getInstance();
		ArrayList<Movie_GenreVo> genreNamelist = genreDao.getGenreName();
		ArrayList<ArrayList<HashMap<String, Object>>> movieMainList = movieDao.getMovieList(genreNamelist);

		JSONArray jsonArray = new JSONArray();
		for (ArrayList<HashMap<String, Object>> list : movieMainList) {
			for (HashMap<String, Object> map : list) {
				JSONObject json = new JSONObject();
				json.put("movieNum", map.get("movieNum"));
				json.put("movieName", map.get("movieName"));
				json.put("genreName", map.get("genreName"));
				json.put("imageNum", map.get("imageNum"));
				json.put("imageSavName", map.get("imageSavName"));
				jsonArray.add(json);
			}
		}
		response.setContentType("text/plain;charset=utf-8");
	
		PrintWriter pw = response.getWriter();
		pw.print(jsonArray.toString());
//		for (JSONArray jsonArrays : jsonArrayList) {
//			pw.print(jsonArrays.toString());
//		}

	}

}
