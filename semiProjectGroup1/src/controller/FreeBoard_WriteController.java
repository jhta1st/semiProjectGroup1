package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoard_FreeBoardDao;
import vo.FreeBoard_FreeBoardVo;

@WebServlet("/FreeBoard/write.do")
public class FreeBoard_WriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/FreeBoard/write.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String freeBoardTitle=req.getParameter("freeBoardTitle");
		String freeBoardContent=req.getParameter("freeBoardContent");
		String userId=req.getParameter("userId");
		FreeBoard_FreeBoardVo vo=new FreeBoard_FreeBoardVo(0, freeBoardTitle, freeBoardContent, null, userId);
		FreeBoard_FreeBoardDao dao=FreeBoard_FreeBoardDao.getInstance();
		if(dao.write(vo)>0) {
			resp.sendRedirect(req.getContextPath()+"/FreeBoard/list.do");
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "Write½ÇÆÐ");
			req.getRequestDispatcher("/ETC/error.jsp").forward(req, resp);
		}
	}
}
