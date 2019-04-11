package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoard_FreeBoardCommDao;
import dao.User_UserInfoDao;

@WebServlet("/FreeBoard/commDelete.do")
public class FreeBoard_CommDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		System.out.println("userId:"+userId);
		int freeBoardCommNum=Integer.parseInt(req.getParameter("freeBoardCommNum"));
		FreeBoard_FreeBoardCommDao dao=FreeBoard_FreeBoardCommDao.getInstance();
		if(dao.commDelete(freeBoardCommNum)>0) {
			User_UserInfoDao uiDao=new User_UserInfoDao();
			uiDao.expCalc(userId);
			uiDao.levCalc(userId);
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "CommDelete½ÇÆÐ");
			req.setAttribute("pages", "/ETC/error.jsp");			
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
