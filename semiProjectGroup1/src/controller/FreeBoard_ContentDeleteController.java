package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoard_FreeBoardDao;
import dao.User_UserInfoDao;
import vo.FreeBoard_FreeBoardVo;

@WebServlet("/FreeBoard/ContentDelete.do")
public class FreeBoard_ContentDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		String freeBoardNum=req.getParameter("freeBoardNum");
		req.setAttribute("userId", userId);
		req.setAttribute("freeBoardNum", freeBoardNum);
		req.setAttribute("pages", "/FreeBoard/contentDelete.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		int freeBoardNum=Integer.parseInt(req.getParameter("freeBoardNum"));
		FreeBoard_FreeBoardDao dao=FreeBoard_FreeBoardDao.getInstance();
		if(dao.contentDelete(freeBoardNum)>0) {
			User_UserInfoDao uiDao=new User_UserInfoDao();
			uiDao.expCalc(userId);
			uiDao.levCalc(userId);
			resp.sendRedirect(req.getContextPath()+"/FreeBoard/list.do");
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "Delete½ÇÆÐ");
			req.setAttribute("pages", "/ETC/error.jsp");
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
