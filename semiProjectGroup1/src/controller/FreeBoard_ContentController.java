package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoard_FreeBoardDao;
import dao.FreeBoard_FreeBoardImageDao;
import vo.FreeBoard_FreeBoardImageVo;
import vo.FreeBoard_FreeBoardVo;

@WebServlet("/FreeBoard/Content.do")
public class FreeBoard_ContentController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageNum=req.getParameter("pageNum");
		if(pageNum==null || pageNum=="") {
			pageNum="1";
		}
		String freeBoardSearchField=req.getParameter("freeBoardSearchField");
		String freeBoardSearchKeyword=req.getParameter("freeBoardSearchKeyword");
		int freeBoardNum=Integer.parseInt(req.getParameter("freeBoardNum"));
		FreeBoard_FreeBoardDao dao=FreeBoard_FreeBoardDao.getInstance();
		FreeBoard_FreeBoardVo vo=dao.getContentInfo(freeBoardNum);
		FreeBoard_FreeBoardImageDao dao1=FreeBoard_FreeBoardImageDao.getInstance();
		ArrayList<FreeBoard_FreeBoardImageVo> vo1=dao1.getContentImageInfo(freeBoardNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("freeBoardSearchField", freeBoardSearchField);
		req.setAttribute("freeBoardSearchKeyword", freeBoardSearchKeyword);
		req.setAttribute("vo", vo);
		req.setAttribute("vo1", vo1);
		req.setAttribute("pages", "/FreeBoard/content.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
}
