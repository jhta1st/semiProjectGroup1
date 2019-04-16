package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Admin_CharInfoDao;
import dao.Movie_GenreDao;
import dao.Movie_MovieInfoDao;
import dao.Movie_ReviewImageDao;
import dao.Movie_UrlInfoDao;
import dao.User_UserInfoDao;
import vo.Admin_CharInfoVo;
import vo.Movie_GenreVo;
import vo.Movie_ReviewImageVo;
import vo.Movie_UrlInfoVo;
import vo.User_UserInfoVo;

@WebServlet("/admin/movieUrlRegistration.do")
public class Admin_MovieUrlRegistrationController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String movieNum = req.getParameter("movieNum");
		String urlType = req.getParameter("urlType");
		String movieName = "";
		if (movieNum == null) {
			movieNum = "";
			urlType = "";
		} else {
			Movie_MovieInfoDao movieInfoDao = Movie_MovieInfoDao.getInstance();
			movieName = movieInfoDao.getMovieInfo(Integer.parseInt(movieNum)).getMovieName();
		}
		req.setAttribute("movieNum", movieNum);
		req.setAttribute("movieName", movieName);
		req.setAttribute("urlType", urlType);
		req.setAttribute("pages", "/Admin/admin_MovieUrlRegistration.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int movieNum = Integer.parseInt(req.getParameter("movieNum"));
		int urlType = Integer.parseInt(req.getParameter("urlType"));
		String urlAddr = req.getParameter("urlAddr");
		Movie_UrlInfoVo vo = new Movie_UrlInfoVo(0, urlType, urlAddr, movieNum);
		Movie_UrlInfoDao dao = Movie_UrlInfoDao.getInstance();
		if (dao.urlInfoWrite(vo) > 0) {
			req.setAttribute("errMsg", "등록되었습니다.");
			req.setAttribute("pages", "/Admin/admin_MovieUrlRegistration.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		} else {
			req.setAttribute("errMsg", "urlWrite실패");
			req.setAttribute("pages", "/Admin/admin_MovieUrlRegistration.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
