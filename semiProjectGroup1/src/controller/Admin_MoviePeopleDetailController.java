package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_CharInfoDao;
import vo.Admin_CharInfoVo;
import vo.Movie_CharInfoVo;

@WebServlet("/admin/MoviePeopleDetail.do")
public class Admin_MoviePeopleDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int charNum=Integer.parseInt(req.getParameter("charNum"));
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		String field =req.getParameter("field");
		String keyword = req.getParameter("keyword");
		
		Admin_CharInfoDao dao = Admin_CharInfoDao.getInstance();
		Admin_CharInfoVo vo = dao.detail(charNum);
		req.setAttribute("vo", vo);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("field", field);
		req.setAttribute("keyword", keyword);
		req.setAttribute("pages", "/Admin/admin_MoviePeopleDetail.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
}
