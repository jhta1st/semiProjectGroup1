package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_CharInfoDao;



@WebServlet("/admin/MoviePeopleDelete.do")
public class Admin_MoviePeopleDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				int charNum=Integer.parseInt(req.getParameter("charNum"));
				Admin_CharInfoDao dao = Admin_CharInfoDao.getInstance();
				int n=dao.delete(charNum);
				if(n>0) {
					req.setAttribute("pages", "/admin/MoviePeopleList.do");
					req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
				}else {
					req.setAttribute("code", "fail");
					req.setAttribute("pages", "/User/user_result.jsp");
					req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
				}	
	}
}
