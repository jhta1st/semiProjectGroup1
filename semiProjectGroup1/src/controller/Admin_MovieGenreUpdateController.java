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
		req.getRequestDispatcher("/Admin/admin_MovieGenreUpdate.jsp").forward(req, resp);
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
				resp.sendRedirect(req.getContextPath()+"/admin/movieGenreList.do");
			}else{
				req.setAttribute("code", "fail");
				req.getRequestDispatcher("/User/user_result.jsp").forward(req, resp);
			}
	}
}
