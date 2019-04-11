package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_CastInfoDao;
import dao.Admin_CharInfoDao;
import dao.Admin_MovieViewDao;
import vo.Admin_CharInfoVo;
import vo.Admin_MovieViewVo;
import vo.Movie_CastInfoVo;
@WebServlet("/admin/movieTeamDelete.do")
public class Admin_MovieTeamDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int movieNum = Integer.parseInt(req.getParameter("movieNum"));
		int castNum = Integer.parseInt(req.getParameter("castNum"));		
		Admin_CastInfoDao castInfoDao=Admin_CastInfoDao.getInstance();
		if(castInfoDao.castInfoDelete(castNum)>0) {
			req.setAttribute("pages", "/admin/MovieViewDetail.do?movieNum="+movieNum);
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
