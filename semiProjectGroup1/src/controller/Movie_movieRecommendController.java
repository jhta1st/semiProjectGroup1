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

import org.json.simple.JSONObject;

import dao.Admin_MovieInfoDao;
import dao.FreeBoard_FreeBoardCommDao;
import dao.Movie_GoodDao;
import dao.Movie_favTableDao;
import vo.Admin_MovieInfoVo;
import vo.FreeBoard_FreeBoardCommVo;
import vo.Movie_GoodVo;

@WebServlet("/Movie/movieRecommend.do")
public class Movie_movieRecommendController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		Movie_GoodDao dao=Movie_GoodDao.getInstance();
		ArrayList<HashMap<String, Object>> likeGenreList=dao.getLikeGenre(userId);
		System.out.println("likeGenreList:"+likeGenreList);
		if(likeGenreList.size()==0) {
			ArrayList<HashMap<String, Object>> nMovieList=dao.getMovieList(0);
			req.setAttribute("movieList", nMovieList);//최신영화
			System.out.println("nMovieList:"+nMovieList);
		}else {
			ArrayList<ArrayList<HashMap<String, Object>>> rMovieList=new ArrayList<ArrayList<HashMap<String, Object>>>();
			for(int i=0;i<likeGenreList.size();i++) {
				HashMap<String, Object> map=likeGenreList.get(i);
				int genreNum=(int)map.get("genreNum");
				ArrayList<HashMap<String, Object>> genreMovieList=dao.getMovieList(genreNum);
				rMovieList.add(genreMovieList);
			}
			req.setAttribute("movieList", rMovieList);//추천영화
			System.out.println("rMovieList:"+rMovieList);
		}			
		req.setAttribute("likeGenreList", likeGenreList);		
		req.setAttribute("pages", "/Movie/movie_MovieRecommend.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		int movieNum=Integer.parseInt(req.getParameter("movieNum"));
		PrintWriter pw=resp.getWriter();
		resp.setContentType("text/plain;charset=utf-8");
		Movie_favTableDao dao=Movie_favTableDao.getInstance();
		int check=dao.favCheck(userId, movieNum);
		if(check==1) {
			if(dao.favDelete(userId, movieNum)>0) {
				JSONObject json=new JSONObject();
				json.put("result", "delete");
				pw.print(json.toString());
			}
		}else if(check==0) {
			if(dao.favInsert(userId, movieNum)>0) {
				JSONObject json=new JSONObject();
				json.put("result", "insert");
				pw.print(json.toString());
			}
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "CommWrite실패");
			req.setAttribute("pages", "/ETC/error.jsp");			
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
