package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoard_FreeBoardDao;
import vo.FreeBoard_FreeBoardVo;

@WebServlet("/FreeBoard/Content.do")
public class FreeBoard_ContentController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageNum=req.getParameter("pageNum");
		String freeBoardSearchField=req.getParameter("freeBoardSearchField");
		String freeBoardSearchKeyword=req.getParameter("freeBoardSearchKeyword");
		int freeBoardNum=Integer.parseInt(req.getParameter("freeBoardNum"));
		FreeBoard_FreeBoardDao dao=FreeBoard_FreeBoardDao.getInstance();
		FreeBoard_FreeBoardVo vo=dao.getContentInfo(freeBoardNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("freeBoardSearchField", freeBoardSearchField);
		req.setAttribute("freeBoardSearchKeyword", freeBoardSearchKeyword);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/FreeBoard/content.jsp").forward(req, resp);
	}
}
