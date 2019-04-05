package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoard_FreeBoardCommDao;
import vo.FreeBoard_FreeBoardCommVo;

@WebServlet("/FreeBoard/commWrite.do")
public class FreeBoard_CommWriteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String freeBoardCommContent=req.getParameter("freeBoardCommContent");
		int freeBoardNum=Integer.parseInt(req.getParameter("freeBoardNum"));
		String userId=req.getParameter("userId");
		FreeBoard_FreeBoardCommVo vo=new FreeBoard_FreeBoardCommVo(0, freeBoardCommContent, null, freeBoardNum, userId);
		FreeBoard_FreeBoardCommDao dao=FreeBoard_FreeBoardCommDao.getInstance();
		if(dao.commWrite(vo)>0) {
			
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "CommWrite½ÇÆÐ");
			req.getRequestDispatcher("/ETC/error.jsp").forward(req, resp);
		}		
	}
}
