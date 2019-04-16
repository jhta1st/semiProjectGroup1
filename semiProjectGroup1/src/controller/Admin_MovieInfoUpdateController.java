package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_CharInfoDao;
import dao.Admin_MovieGenreDao;
import dao.Admin_MovieInfoDao;
import dao.Admin_MovieViewDao;
import dao.Movie_GenreDao;
import vo.Admin_CharInfoVo;
import vo.Admin_MovieGenreVo;
import vo.Admin_MovieInfoVo;
import vo.Admin_MovieViewVo;
import vo.Movie_CharInfoVo;
import vo.Movie_GenreVo;

@WebServlet("/admin/MovieInfoUpdate.do")
public class Admin_MovieInfoUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int movieNum=Integer.parseInt(req.getParameter("movieNum"));
		Admin_MovieViewDao dao=Admin_MovieViewDao.getInstance();
		Admin_MovieViewVo vo=dao.detail(movieNum);
		String[] genres=vo.getGenreName().split("/");
		Movie_GenreDao dao1=Movie_GenreDao.getInstance();
		ArrayList<Movie_GenreVo> genreList=dao1.getGenreName();
		req.setAttribute("genreList", genreList);
		req.setAttribute("vo", vo);
		req.setAttribute("genres", genres);
		req.setAttribute("movieNum", movieNum);
		req.setAttribute("pages", "/Admin/admin_MovieInfoUpdate.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String movieName=req.getParameter("movieName");
		String[] movieGenre=req.getParameterValues("movieGenre");
		String movieIntro=req.getParameter("movieIntro");
		movieIntro=movieIntro.replaceAll("'\n'", "<br>");
		String movieReleaseDate=req.getParameter("movieReleaseDate");
		int movieRunTime=Integer.parseInt(req.getParameter("movieRunTime"));
		String movieProduction=req.getParameter("movieProduction");
		String movieDistributer=req.getParameter("movieDistributer");
		String nation=req.getParameter("nation");
		int movieAge=Integer.parseInt(req.getParameter("movieAge"));
		int movieNum=Integer.parseInt(req.getParameter("movieNum"));
		Admin_MovieInfoVo vo=new Admin_MovieInfoVo(movieNum, movieName, movieIntro, movieReleaseDate, movieRunTime, movieProduction, movieDistributer, nation, movieAge);
		Admin_MovieInfoDao dao=Admin_MovieInfoDao.getInstance();
		ArrayList<Integer> orgList=dao.movieInfoUpdate(vo);
		if(orgList!=null) {
			ArrayList<Integer> newList=new ArrayList<Integer>();//새로운 장르값 배열을 ArrayList에 옮겨담기
			for(int i=0;i<movieGenre.length;i++) {
				newList.add(Integer.parseInt(movieGenre[i]));
			}
			if(orgList.size()>=newList.size()) {//비교해서 같은 값은 삭제하기
				for(int i=0;i<orgList.size();i++) {
					for(int a=0;a<newList.size();a++) {
						if(orgList.get(i)==newList.get(a)) {
							orgList.remove(i);
							newList.remove(a);
						}
					}
				}
			}else if(newList.size()>=orgList.size()) {
				for(int i=0;i<newList.size();i++) {
					for(int a=0;a<orgList.size();a++) {
						if(orgList.get(a)==newList.get(i)) {
							newList.remove(i);
							orgList.remove(a);
						}
					}
				}
			}
			Admin_MovieGenreDao mgDao=Admin_MovieGenreDao.getInstance();//orgList에서 남은값은 delete, newList에서 남은것은 insert
			if(orgList!=null) {
				for(int i=0;i<orgList.size();i++) {
					Admin_MovieGenreVo vo1=new Admin_MovieGenreVo(orgList.get(i), movieNum);
					mgDao.movieGenreDelete(vo1);
				}
			}
			if(newList!=null) {
				for(int i=0;i<newList.size();i++) {
					Admin_MovieGenreVo vo1=new Admin_MovieGenreVo(newList.get(i), movieNum);
					mgDao.movieGenreWrite(vo1);
				}
			}
		}
		req.setAttribute("movieNum", movieNum);
		req.setAttribute("pages", "/admin/MovieViewDetail.do");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
}
