package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_adminDao;
import vo.User_UserInfoVo;

@WebServlet("/admin/list.do")
public class Admin_UserListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String spageNum = req.getParameter("pageNum");
		int userPower = Integer.parseInt(req.getParameter("userPower"));
		
		String field =req.getParameter("field");
		String keyword = req.getParameter("keyword");
		int pageNum = 1;
		if (spageNum != null) {
			pageNum = Integer.parseInt(spageNum);
		}
		int startRow = (pageNum - 1) * 10 + 1;
		int endRow = startRow + 9;
		Admin_adminDao dao = new Admin_adminDao();
		ArrayList<User_UserInfoVo> list = dao.list(startRow, endRow, field, keyword);
		int pageCount = (int) Math.ceil(dao.getCount(field, keyword) / 10.0);
		int startPageNum = ((pageNum - 1) / 10 * 10) + 1;
		int endPageNum = startPageNum + 9;
		if (endPageNum > pageCount) {
			endPageNum = pageCount;
		}
		req.setAttribute("list", list);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPageNum);
		req.setAttribute("endPage", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("field", field);
		req.setAttribute("keyword", keyword);
		req.getRequestDispatcher("/Admin/admin_list.jsp").forward(req, resp);
	}
}
