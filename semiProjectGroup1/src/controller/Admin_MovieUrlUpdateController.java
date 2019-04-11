package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Movie_MovieInfoDao;
import dao.Movie_UrlInfoDao;
import vo.Movie_MovieInfoVo;
import vo.Movie_UrlInfoVo;

/**
 * Servlet implementation class Admin_MovieUrlUpdateController
 */
@WebServlet("/admin/movieUrlUpdate.do")
public class Admin_MovieUrlUpdateController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int urlNum = Integer.parseInt(request.getParameter("urlNum"));
		int movieNum = Integer.parseInt(request.getParameter("movieNum"));
		Movie_MovieInfoDao movieDao = Movie_MovieInfoDao.getInstance();
		Movie_MovieInfoVo movieInfoVo = movieDao.getMovieInfo(movieNum);
		Movie_UrlInfoDao urlDao = Movie_UrlInfoDao.getInstance();
		Movie_UrlInfoVo urlVo = urlDao.getVedioInfo(urlNum);
		request.setAttribute("movieInfoVo", movieInfoVo);
		request.setAttribute("urlVo", urlVo);
		request.setAttribute("pages", "/Admin/admin_MovieUrlUpdate.jsp");
		request.getRequestDispatcher("/main/layout.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int movieNum = Integer.parseInt(request.getParameter("movieNum"));
		int urlNum = Integer.parseInt(request.getParameter("urlNum"));
		int urlType = Integer.parseInt(request.getParameter("urlType"));
		String urlAddr = request.getParameter("urlAddr");
		Movie_UrlInfoVo vo = new Movie_UrlInfoVo(urlNum, urlType, urlAddr, movieNum);
		Movie_UrlInfoDao urlInfodao = Movie_UrlInfoDao.getInstance();
		if (urlInfodao.urlInfoUpdate(vo) > 0) {
			response.sendRedirect(
					getServletContext().getAttribute("cp") + "/admin/MovieViewDetail.do?movieNum=" + movieNum);
		} else {
			request.setAttribute("errMsg", "수정실패!");
			request.setAttribute("pages", "/Admin/admin_MovieUrlUpdate.jsp");
			request.getRequestDispatcher("/main/layout.jsp").forward(request, response);
		}
	}

}
