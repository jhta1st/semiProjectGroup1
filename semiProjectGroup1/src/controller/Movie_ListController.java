package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Movie_ListController
 */
@WebServlet("/Movie/movielist.do")
public class Movie_ListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String searchResult = req.getParameter("keyword");
		String genreName = req.getParameter("genreName");
		if (searchResult.equals("")) {
			
			resp.sendRedirect(req.getContextPath() + "/Movie/movie_list.jsp");
		} else {
			
		}
	}
}
