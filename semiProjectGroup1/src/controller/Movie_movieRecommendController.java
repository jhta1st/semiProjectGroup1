package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.Admin_MovieInfoDao;
import dao.FreeBoard_FreeBoardCommDao;
import dao.Movie_GenreDao;
import dao.Movie_GoodDao;
import dao.Movie_favTableDao;
import vo.Admin_MovieInfoVo;
import vo.FreeBoard_FreeBoardCommVo;
import vo.Movie_GenreVo;
import vo.Movie_GoodVo;

@WebServlet("/Movie/movieRecommend.do")
public class Movie_movieRecommendController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pages", "/Movie/movie_MovieRecommend.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		Movie_GoodDao dao=Movie_GoodDao.getInstance();
		ArrayList<HashMap<String, Object>> likeGenreList=dao.getLikeGenre(userId);
		JSONArray jsonArray = new JSONArray();
		if(likeGenreList.size()==0) {//최신영화
			ArrayList<HashMap<String, Object>> nMovieList=dao.getMovieList(0);
			for (HashMap<String, Object> map:nMovieList) {
				JSONObject json = new JSONObject();
				json.put("movieNum", map.get("movieNum"));
				json.put("movieName", map.get("movieName"));
				json.put("genreNum", map.get("genreNum"));
				json.put("movieReleaseDate", String.valueOf(map.get("movieReleaseDate")).substring(0, 4));
				json.put("imageSavName", map.get("imageSavName"));
				jsonArray.add(json);
			}
		}else {//추천영화
			int genreNum=0;
			JSONObject json0 = new JSONObject();
			json0.put("likeGenreSize", likeGenreList.size());
			jsonArray.add(json0);
			for(int i=0;i<likeGenreList.size();i++) {
				HashMap<String, Object> gMap=likeGenreList.get(i);
				genreNum=(int)gMap.get("genreNum");
				Movie_GenreDao mgDao=Movie_GenreDao.getInstance();
				ArrayList<Movie_GenreVo> genreList=mgDao.getGenreName();
				for(int a=0;a<genreList.size();a++) {
					Movie_GenreVo vo=genreList.get(a);
					if(likeGenreList.get(i).get("genreNum").equals(vo.getGenreNum())) {
						JSONObject json = new JSONObject();
						json.put("likeGenre",vo.getGenreName());
						jsonArray.add(json);
					}
				}
			}			
			for(int i=0;i<likeGenreList.size();i++) {
					ArrayList<HashMap<String, Object>> genreMovieList=dao.getMovieList((int)likeGenreList.get(i).get("genreNum"));
					for (HashMap<String, Object> map:genreMovieList) {
						JSONObject json = new JSONObject();
						json.put("movieNum", map.get("movieNum"));
						json.put("movieName", map.get("movieName"));
						json.put("genreNum", map.get("genreNum"));
						json.put("movieReleaseDate", String.valueOf(map.get("movieReleaseDate")).substring(0, 4));
						json.put("imageSavName", map.get("imageSavName"));
						jsonArray.add(json);
					}
				}
			}
		resp.setContentType("text/plain;charset=utf-8");	
		PrintWriter pw = resp.getWriter();
		pw.print(jsonArray.toString());
	}
}