package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_CharInfoDao;
import dao.Movie_ReviewImageDao;



@WebServlet("/admin/MovieImgDelete.do")
public class Admin_MovieImgDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				int imageNum=Integer.parseInt(req.getParameter("ImageNum"));
				int movieNum=Integer.parseInt(req.getParameter("movieNum"));
				Movie_ReviewImageDao dao = Movie_ReviewImageDao.getInstance();
				int n=dao.delete(imageNum);
				if(n>0) {
					req.getRequestDispatcher("/admin/MovieViewDetail.do?movieNum="+movieNum).forward(req, resp);	
				}else {
					req.setAttribute("code", "fail");
					req.getRequestDispatcher("/User/user_result.jsp").forward(req, resp);
				}	
	}
}
