package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_MovieViewDao;
import dao.Movie_CharInfoDao;
import dao.Movie_ReviewImageDao;
import dao.Movie_UrlInfoDao;
import vo.Admin_MovieViewVo;

@WebServlet("/admin/MovieViewDetail.do")
public class Admin_MovieInfoDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int movieNum = Integer.parseInt(req.getParameter("movieNum"));
		Admin_MovieViewDao dao = Admin_MovieViewDao.getInstance();
		Admin_MovieViewVo vo = dao.detail(movieNum);
		Movie_ReviewImageDao reviewImgDao = Movie_ReviewImageDao.getInstance();
		ArrayList<HashMap<String, Object>> imgList = reviewImgDao.getImages(movieNum);
		Movie_UrlInfoDao urlInfoDao = Movie_UrlInfoDao.getInstance();
		ArrayList<HashMap<String, Object>> urlList = urlInfoDao.getVedioUrl(movieNum);
		Movie_CharInfoDao charInfoDao = Movie_CharInfoDao.getInstance();
		ArrayList<HashMap<String, Object>> crewList = charInfoDao.getCharinfo(movieNum);
		req.setAttribute("vo", vo);
		req.setAttribute("movieNum", movieNum);
		req.setAttribute("imgList", imgList);
		req.setAttribute("urlList", urlList);
		req.setAttribute("crewList", crewList);
		req.setAttribute("pages", "/Admin/admin_MovieInfoDetail.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
}
