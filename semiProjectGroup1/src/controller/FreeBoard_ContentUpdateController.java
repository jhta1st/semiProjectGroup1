package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoard_FreeBoardDao;
import vo.FreeBoard_FreeBoardVo;

@WebServlet("/FreeBoard/ContentUpdate.do")
public class FreeBoard_ContentUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int freeBoardNum=Integer.parseInt(req.getParameter("freeBoardNum"));
		FreeBoard_FreeBoardDao dao=FreeBoard_FreeBoardDao.getInstance();
		FreeBoard_FreeBoardVo vo=dao.getContentInfo(freeBoardNum);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/FreeBoard/contentUpdate.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int freeBoardNum=Integer.parseInt(req.getParameter("freeBoardNum"));
		String freeBoardTitle=req.getParameter("freeBoardTitle");
		String freeBoardContent=req.getParameter("freeBoardContent");
		FreeBoard_FreeBoardVo vo=new FreeBoard_FreeBoardVo(freeBoardNum, freeBoardTitle, freeBoardContent, null, null);
		FreeBoard_FreeBoardDao dao=FreeBoard_FreeBoardDao.getInstance();
		if(dao.contentUpdate(vo)>0) {
			req.setAttribute("freeBoardNum", freeBoardNum);
			req.getRequestDispatcher("/FreeBoard/Content.do").forward(req, resp);
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "Update½ÇÆÐ");
			req.getRequestDispatcher("/ETC/error.jsp").forward(req, resp);
		}
	}
}
