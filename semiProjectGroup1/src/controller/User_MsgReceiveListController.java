package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_MsgTableDao;
import vo.User_MsgTableVo;

@WebServlet("/user/msgReceiveList.do")
public class User_MsgReceiveListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		req.setCharacterEncoding("utf-8");

		String userId = req.getParameter("userId");
		String spageNum = req.getParameter("pageNum");
		
		//검색조건
		String field =req.getParameter("field");
		String keyword = req.getParameter("keyword");
		
		int pageNum = 1;
		if (spageNum != null) {
			pageNum = Integer.parseInt(spageNum);
		}
		int startRow = (pageNum - 1) * 10 + 1;
		int endRow = startRow + 9;
		User_MsgTableDao dao = new User_MsgTableDao();
		ArrayList<User_MsgTableVo> list = dao.getList("RECEIVE", userId, startRow, endRow, field, keyword);
		int pageCount = (int) Math.ceil(dao.getCount("RECEIVE", userId, field,keyword) / 10.0);
		int startPageNum = ((pageNum - 1) / 10 * 10) + 1;
		int endPageNum = startPageNum + 9;
		if (endPageNum > pageCount) {
			endPageNum = pageCount;
		}
		req.setAttribute("userId", userId);
		req.setAttribute("type", "RECEIVE");
		req.setAttribute("list", list);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPageNum);
		req.setAttribute("endPage", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("field", field);
		req.setAttribute("keyword", keyword);
		req.setAttribute("pages", "/User/user_myMsgList.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
}
