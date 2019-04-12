package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoard_FreeBoardCommDao;
import dao.FreeBoard_FreeBoardDao;
import dao.Movie_favTableDao;
import dao.User_UserInfoDao;
import vo.FreeBoard_FreeBoardCommVo;
import vo.FreeBoard_FreeBoardVo;
import vo.User_UserInfoVo;
@WebServlet("/user/detail.do")
public class User_MyPageController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		User_UserInfoDao dao = new User_UserInfoDao();
		User_UserInfoVo vo = dao.detail(userId);
		Movie_favTableDao ftDao=Movie_favTableDao.getInstance();
		ArrayList<HashMap<String, Object>> favList=ftDao.favList(userId);
		FreeBoard_FreeBoardDao fbDao=FreeBoard_FreeBoardDao.getInstance();
		ArrayList<FreeBoard_FreeBoardVo> fbList=fbDao.getListAll(userId);
		FreeBoard_FreeBoardCommDao fbcDao=FreeBoard_FreeBoardCommDao.getInstance();
		ArrayList<FreeBoard_FreeBoardCommVo> fbcList=fbcDao.getCommListAll(userId);
		int exp=dao.expCalc(userId);
		int lev=dao.levCalc(userId);
		req.setAttribute("fbcList", fbcList);
		req.setAttribute("fbList", fbList);
		req.setAttribute("favList", favList);
		req.setAttribute("exp", exp);
		req.setAttribute("lev", lev);
		req.setAttribute("vo", vo);
		req.setAttribute("pages", "/User/user_myPage.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
}
