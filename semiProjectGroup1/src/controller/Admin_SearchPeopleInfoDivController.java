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

import dao.Admin_CharInfoDao;
import dao.Admin_MovieInfoDao;
import dao.FreeBoard_FreeBoardCommDao;
import vo.Admin_CharInfoVo;
import vo.Admin_MovieInfoVo;
import vo.FreeBoard_FreeBoardCommVo;

@WebServlet("/Admin/SearchPeopleInfoDiv.do")
public class Admin_SearchPeopleInfoDivController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String sPageNum=req.getParameter("pageNum");
		String charInfo=req.getParameter("charInfo");
		int pageNum=1;
		if(sPageNum!=null) {
			pageNum=Integer.parseInt(sPageNum);
		}
		int endRow=pageNum*5;
		int startRow=endRow-4;
		Admin_CharInfoDao dao = Admin_CharInfoDao.getInstance();
		ArrayList<Admin_CharInfoVo> list = dao.list(startRow, endRow, "charName", charInfo);
		int pageCount = (int) Math.ceil(dao.getCount("charName", charInfo) / 5.0);
		int startPageNum = ((pageNum - 1) / 5 * 5) + 1;
		int endPageNum = startPageNum + 4;
		if (endPageNum > pageCount) {
			endPageNum = pageCount;
		}
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.println("<?xml version='1.0' encoding='utf-8'?>");
		pw.println("<result>");
		pw.println("<charInfoSearchDivData>");
		pw.println("<pageNum>" + pageNum + "</pageNum>");
		pw.println("<pageCount>" + pageCount + "</pageCount>");
		pw.println("<startPageNum>" + startPageNum + "</startPageNum>");
		pw.println("<endPageNum>" + endPageNum + "</endPageNum>");
		pw.println("</charInfoSearchDivData>");
		for(Admin_CharInfoVo vo:list) {
			pw.println("<people>");
			pw.println("<charNum>" + vo.getCharNum() + "</charNum>");
			pw.println("<charName>" + vo.getCharName() + "</charName>");
			pw.println("<charOrgFileName>" + vo.getCharOrgFileName() + "</charOrgFileName>");
			pw.println("<charSavFileName>" + vo.getCharSavFileName() + "</charSavFileName>");
			pw.println("</people>");
		}
		pw.println("</result>");
	}
}
