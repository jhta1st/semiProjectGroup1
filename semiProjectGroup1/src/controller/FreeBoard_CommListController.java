package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoard_FreeBoardCommDao;
import vo.FreeBoard_FreeBoardCommVo;

@WebServlet("/FreeBoard/commList.do")
public class FreeBoard_CommListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String sPageNum=req.getParameter("pageNum");
		int freeBoardNum=Integer.parseInt(req.getParameter("freeBoardNum"));
		int pageNum=1;
		if(sPageNum!=null) {
			pageNum=Integer.parseInt(sPageNum);
		}
		int endRow=pageNum*10;
		int startRow=endRow-9;
		FreeBoard_FreeBoardCommDao dao=FreeBoard_FreeBoardCommDao.getInstance();
		ArrayList<FreeBoard_FreeBoardCommVo> list=dao.commList(freeBoardNum,startRow, endRow);
		int pageCount=(int)Math.ceil((dao.getCountCommList(freeBoardNum))/10.0);
		int startPageNum=((pageNum-1)/10*10) + 1;
		int endPageNum=startPageNum+9;
		if(pageNum>endPageNum) {
			startPageNum=pageNum;
		}
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}		
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.println("<?xml version='1.0' encoding='utf-8'?>");
		pw.println("<result>");
		pw.println("<commListData>");
		pw.println("<pageNum>" + pageNum + "</pageNum>");
		pw.println("<pageCount>" + pageCount + "</pageCount>");
		pw.println("<startPageNum>" + startPageNum + "</startPageNum>");
		pw.println("<endPageNum>" + endPageNum + "</endPageNum>");
		pw.println("</commListData>");
		for(FreeBoard_FreeBoardCommVo vo:list) {
			pw.println("<comms>");
			pw.println("<freeBoardCommNum>" + vo.getFreeBoardCommNum() + "</freeBoardCommNum>");
			pw.println("<freeBoardCommContent>" + vo.getFreeBoardCommContent() + "</freeBoardCommContent>");
			pw.println("<freeBoardCommWdate>" + vo.getFreeBoardCommWdate() + "</freeBoardCommWdate>");
			pw.println("<freeBoardNum>" + vo.getFreeBoardNum() + "</freeBoardNum>");
			pw.println("<userId>" + vo.getUserId() + "</userId>");
			pw.println("</comms>");
		}
		pw.println("</result>");
	}
}
