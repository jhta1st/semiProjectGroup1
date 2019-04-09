package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoard_FreeBoardCommDao;
import vo.FreeBoard_FreeBoardCommVo;

@WebServlet("/FreeBoard/commUpdate.do")
public class FreeBoard_CommContentUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int freeBoardCommNum=Integer.parseInt(req.getParameter("freeBoardCommNum"));
		FreeBoard_FreeBoardCommDao dao=FreeBoard_FreeBoardCommDao.getInstance();
		FreeBoard_FreeBoardCommVo vo=dao.getCommContentInfo(freeBoardCommNum);
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.println("<?xml version='1.0' encoding='utf-8'?>");
		pw.println("<commInfo>");
		pw.println("<freeBoardCommNum>" + vo.getFreeBoardCommNum() + "</freeBoardCommNum>");
		pw.println("<freeBoardCommContent>" + vo.getFreeBoardCommContent() + "</freeBoardCommContent>");
		pw.println("<freeBoardCommWdate>" + vo.getFreeBoardCommWdate() + "</freeBoardCommWdate>");
		pw.println("<freeBoardNum>" + vo.getFreeBoardNum() + "</freeBoardNum>");
		pw.println("<userId>" + vo.getUserId() + "</userId>");
		pw.println("</commInfo>");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int freeBoardCommNum=Integer.parseInt(req.getParameter("freeBoardCommNum"));
		String freeBoardCommContent=req.getParameter("freeBoardCommContent");
		FreeBoard_FreeBoardCommVo vo=new FreeBoard_FreeBoardCommVo(freeBoardCommNum, freeBoardCommContent, null, 0, null);
		FreeBoard_FreeBoardCommDao dao=FreeBoard_FreeBoardCommDao.getInstance();
		if(dao.contentCommUpdate(vo)>0) {
			
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "Update2½ÇÆÐ");
			req.setAttribute("pages", "/ETC/error.jsp");			
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
