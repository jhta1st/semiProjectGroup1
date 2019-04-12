package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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

@WebServlet("/Admin/movieRecommend.do")
public class Movie_movieRecommendController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		Movie_GoodDao dao=Movie_GoodDao.getInstance();
		ArrayList<Movie_GoodVo> movieList=dao.getinfo(userId);
		req.setAttribute("movieList", movieList);
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
			req.setAttribute("errMsg", "CommWrite½ÇÆÐ");
			req.setAttribute("pages", "/ETC/error.jsp");			
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
