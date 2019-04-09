package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoard_FreeBoardCommDao;
import dao.FreeBoard_FreeBoardDao;
import dao.FreeBoard_FreeBoardImageDao;
import vo.FreeBoard_FreeBoardVo;

@WebServlet("/FreeBoard/list.do")
public class FreeBoard_ListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String sPageNum=req.getParameter("PageNum");
		String freeBoardSearchField=req.getParameter("freeBoardSearchField");
		String freeBoardSearchKeyword=req.getParameter("freeBoardSearchKeyword");
		int pageNum=1;
		if(sPageNum!=null) {
			pageNum=Integer.parseInt(sPageNum);
		}
		int endRow=pageNum*10;
		int startRow=endRow-9;
		FreeBoard_FreeBoardDao dao=FreeBoard_FreeBoardDao.getInstance();
		FreeBoard_FreeBoardCommDao daoComm=FreeBoard_FreeBoardCommDao.getInstance();
		FreeBoard_FreeBoardImageDao daoImg=FreeBoard_FreeBoardImageDao.getInstance();
		ArrayList<FreeBoard_FreeBoardVo> list=dao.list(startRow, endRow, freeBoardSearchField, freeBoardSearchKeyword);
		int pageCount=(int)Math.ceil((dao.getCountList(freeBoardSearchField, freeBoardSearchKeyword))/10.0);
		int startPageNum=((pageNum-1)/10*10) + 1;
		int endPageNum=startPageNum+9;
		if(pageNum>endPageNum) {
			startPageNum=pageNum;
		}
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}
		HashMap<Integer, Integer> commCount=daoComm.commCount();
		HashMap<Integer, Integer> imgCount=daoImg.imgCount();
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("freeBoardSearchField", freeBoardSearchField);
		req.setAttribute("freeBoardSearchKeyword", freeBoardSearchKeyword);
		req.setAttribute("list", list);
		req.setAttribute("commCount", commCount);
		req.setAttribute("imgCount", imgCount);
		req.setAttribute("pages", "/FreeBoard/list.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
}
