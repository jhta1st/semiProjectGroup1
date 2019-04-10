package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main/home.do")
public class HomeController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cp = request.getContextPath();
		ServletContext application = getServletContext();
		application.setAttribute("cp", cp);
		request.setAttribute("pages", "/Movie/movie_mainlist.jsp");
		request.getRequestDispatcher("/main/layout.jsp").forward(request, response);
	}
}
