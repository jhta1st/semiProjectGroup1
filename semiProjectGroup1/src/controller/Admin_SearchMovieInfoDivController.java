package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_MovieInfoDao;
import dao.FreeBoard_FreeBoardCommDao;
import vo.Admin_MovieInfoVo;
import vo.FreeBoard_FreeBoardCommVo;

@WebServlet("/Admin/SearchMovieInfoDiv.do")
public class Admin_SearchMovieInfoDivController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String sPageNum=req.getParameter("pageNum");
		String movieInfo=req.getParameter("movieInfo");
		int pageNum=1;
		if(sPageNum!=null) {
			pageNum=Integer.parseInt(sPageNum);
		}
		int endRow=pageNum*5;
		int startRow=endRow-4;
		Admin_MovieInfoDao dao = Admin_MovieInfoDao.getInstance();
		ArrayList<Admin_MovieInfoVo> list = dao.list(startRow, endRow, "movieName", movieInfo);
		int pageCount = (int) Math.ceil(dao.getCount("movieName", movieInfo) / 5.0);
		int startPageNum = ((pageNum - 1) / 5 * 5) + 1;
		int endPageNum = startPageNum + 4;
		if (endPageNum > pageCount) {
			endPageNum = pageCount;
		}
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.println("<?xml version='1.0' encoding='utf-8'?>");
		pw.println("<result>");
		pw.println("<movieInfoSearchDivData>");
		pw.println("<pageNum>" + pageNum + "</pageNum>");
		pw.println("<pageCount>" + pageCount + "</pageCount>");
		pw.println("<startPageNum>" + startPageNum + "</startPageNum>");
		pw.println("<endPageNum>" + endPageNum + "</endPageNum>");
		pw.println("</movieInfoSearchDivData>");
		for(Admin_MovieInfoVo vo:list) {
			pw.println("<movies>");
			pw.println("<movieNum>" + vo.getMovieNum() + "</movieNum>");
			pw.println("<movieName>" + vo.getMovieName() + "</movieName>");
			pw.println("<movieIntro>" + "null" + "</movieIntro>");
			pw.println("<movieReleaseDate>" + vo.getMovieReleaseDate().substring(0,4) + "</movieReleaseDate>");
			pw.println("<movieRunTime>" + vo.getMovieRunTime() + "</movieRunTime>");
			pw.println("<movieProduction>" + vo.getMovieProduction() + "</movieProduction>");
			pw.println("<movieDistributer>" + vo.getMovieDistributer() + "</movieDistributer>");
			pw.println("<nation>" + vo.getNation() + "</nation>");
			pw.println("<movieAge>" + vo.getMovieAge() + "</movieAge>");
			pw.println("</movies>");
		}
		pw.println("</result>");
	}
}
