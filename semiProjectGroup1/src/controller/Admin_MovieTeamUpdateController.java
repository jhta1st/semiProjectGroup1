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
@WebServlet("/admin/movieTeamUpdate.do")
public class Admin_MovieTeamUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int movieNum = Integer.parseInt(req.getParameter("movieNum"));
		int charNum = Integer.parseInt(req.getParameter("charNum"));
		Admin_MovieViewDao dao = Admin_MovieViewDao.getInstance();
		Admin_MovieViewVo vo = dao.detail(movieNum);
		Admin_CastInfoDao castInfoDao=Admin_CastInfoDao.getInstance();
		Movie_CastInfoVo infoList=castInfoDao.getInfo(movieNum, charNum);
		Admin_CharInfoDao charInfoDao=Admin_CharInfoDao.getInstance();
		Admin_CharInfoVo charInfoList=charInfoDao.detail(charNum);
		req.setAttribute("charInfoList", charInfoList);
		req.setAttribute("infoList", infoList);
		req.setAttribute("vo", vo);
		req.setAttribute("pages", "/Admin/admin_MovieTeamUpdate.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int movieNum=Integer.parseInt(req.getParameter("movieNum"));
		int charNum=Integer.parseInt(req.getParameter("charNum"));
		int castDoNum=Integer.parseInt(req.getParameter("castDoNum"));
		int castNum=Integer.parseInt(req.getParameter("castNum"));
		String castDoName=req.getParameter("castDoName");
		Movie_CastInfoVo vo=new Movie_CastInfoVo(castNum, charNum, castDoNum, castDoName, movieNum);
		Admin_CastInfoDao dao=Admin_CastInfoDao.getInstance();
		if(dao.castInfoUpdate(vo)>0) {
			req.setAttribute("pages", "/admin/MovieViewDetail.do?movieNum="+movieNum);
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "castInfoUpdate½ÇÆÐ");
			req.setAttribute("pages", "/Admin/admin_MovieTeamUpdate.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
