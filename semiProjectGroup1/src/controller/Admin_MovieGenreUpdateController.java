package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Movie_GenreDao;
import vo.Movie_GenreVo;


@WebServlet("/admin/movieGenreUpdate.do")
public class Admin_MovieGenreUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int genreNum=Integer.parseInt(req.getParameter("genreNum"));
		Movie_GenreDao dao=Movie_GenreDao.getInstance();
		Movie_GenreVo vo=dao.getinfo(genreNum);
		req.setAttribute("vo", vo);
		req.setAttribute("pages", "/Admin/admin_MovieGenreUpdate.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
			int genreNum=Integer.parseInt(req.getParameter("genreNum"));
			String genreName = req.getParameter("genreName");
			Movie_GenreVo vo = new Movie_GenreVo(genreNum, genreName);
			Movie_GenreDao dao = Movie_GenreDao.getInstance();
			int n=dao.update(vo);
			if(n>0){
				req.setAttribute("pages", "/admin/movieGenreList.do");
				req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
			}else{
				req.setAttribute("code", "fail");
				req.setAttribute("pages", "/User/user_result.jsp");
				req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
			}
	}
}
