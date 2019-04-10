package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_CharInfoDao;
import dao.Admin_MovieViewDao;
import dao.Movie_GenreDao;
import vo.Admin_CharInfoVo;
import vo.Admin_MovieInfoVo;
import vo.Admin_MovieViewVo;
import vo.Movie_CharInfoVo;
import vo.Movie_GenreVo;

@WebServlet("/admin/MovieInfoUpdate.do")
public class Admin_MovieInfoUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int movieNum=Integer.parseInt(req.getParameter("movieNum"));
		ArrayList<Integer> genreNums=new ArrayList<Integer>();
		Admin_MovieViewDao dao=Admin_MovieViewDao.getInstance();
		ArrayList<Admin_MovieViewVo> list=dao.detail(movieNum);
		for(Admin_MovieViewVo genre:list) {
			int getGenreNum=genre.getGenreNum();
			genreNums.add(getGenreNum);
		}
		Movie_GenreDao dao1=Movie_GenreDao.getInstance();
		ArrayList<Movie_GenreVo> genreList=dao1.getGenreName();
		req.setAttribute("genreList", genreList);
		req.setAttribute("genreNums", genreNums);
		req.setAttribute("list", list.get(0));
		req.setAttribute("pages", "/Admin/admin_MovieInfoUpdate.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
