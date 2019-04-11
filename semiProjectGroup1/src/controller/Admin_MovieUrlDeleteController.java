package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Movie_UrlInfoDao;

/**
 * Servlet implementation class Admin_MovieUrlDeleteController
 */
@WebServlet("/admin/MovieUrlDelete.do")
public class Admin_MovieUrlDeleteController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int urlNum = Integer.parseInt(request.getParameter("urlNum"));
		int movieNum = Integer.parseInt(request.getParameter("movieNum"));
		Movie_UrlInfoDao urlInfodao = Movie_UrlInfoDao.getInstance();
		if (urlInfodao.urlInfoDelete(urlNum) > 0) {
			response.sendRedirect(
					getServletContext().getAttribute("cp") + "/admin/MovieViewDetail.do?movieNum=" + movieNum);
		} else {
			request.setAttribute("code", "삭제오류!");
			request.getRequestDispatcher("/Admin/urlDelResult.jsp").forward(request, response);
			;
		}
	}

}
