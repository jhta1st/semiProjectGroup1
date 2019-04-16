package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_MovieGenreDao;
import dao.Admin_MovieInfoDao;
import dao.Movie_GenreDao;
import dao.User_UserInfoDao;
import oracle.net.aso.p;
import vo.Admin_MovieGenreVo;
import vo.Admin_MovieInfoVo;
import vo.Movie_GenreVo;
import vo.User_UserInfoVo;
@WebServlet("/admin/movieInfoRegistration.do")
public class Admin_MovieInfoRegistrationController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Movie_GenreDao dao=Movie_GenreDao.getInstance();
		ArrayList<Movie_GenreVo> genreList=dao.getGenreName();
		req.setAttribute("genreList", genreList);
		req.setAttribute("pages", "/Admin/admin_MovieInfoRegistration.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String movieName=req.getParameter("movieName");
		String[] movieGenre=req.getParameterValues("movieGenre");
		String movieIntro=req.getParameter("movieIntro");
		movieIntro=movieIntro.replaceAll("\n", "<br>");
		String movieReleaseDate=req.getParameter("movieReleaseDate");
		int movieRunTime=Integer.parseInt(req.getParameter("movieRunTime"));
		String movieProduction=req.getParameter("movieProduction");
		String movieDistributer=req.getParameter("movieDistributer");
		String nation=req.getParameter("nation");
		int movieAge=Integer.parseInt(req.getParameter("movieAge"));
		Admin_MovieInfoVo movieInfoVo=new Admin_MovieInfoVo(0, movieName, movieIntro, movieReleaseDate, movieRunTime, movieProduction, movieDistributer, nation, movieAge);
		Admin_MovieInfoDao movieInfoDao=Admin_MovieInfoDao.getInstance();
		int movieNum=movieInfoDao.movieInfoWrite(movieInfoVo);
		if(movieNum>0) {
			for(String genreNum:movieGenre) {
				Admin_MovieGenreVo vo=new Admin_MovieGenreVo(Integer.parseInt(genreNum), movieNum);
				Admin_MovieGenreDao dao=Admin_MovieGenreDao.getInstance();
				if(dao.movieGenreWrite(vo)>0) {
					
				}else {
					req.setAttribute("errCode", "-1");
					req.setAttribute("errMsg", "movieGenreWrite실패");
					req.setAttribute("pages", "/Admin/admin_MovieInfoRegistration.jsp");
					req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
				}
			}
			req.setAttribute("errMsg", "등록되었습니다.");
			req.setAttribute("pages", "/Admin/admin_MovieInfoRegistration.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "movieInfoWrite실패");
			req.setAttribute("pages", "/Admin/admin_MovieInfoRegistration.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
