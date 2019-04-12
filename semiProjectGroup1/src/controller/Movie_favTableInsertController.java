package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.Admin_MovieInfoDao;
import dao.FreeBoard_FreeBoardCommDao;
import dao.Movie_favTableDao;
import vo.Admin_MovieInfoVo;
import vo.FreeBoard_FreeBoardCommVo;

@WebServlet("/Admin/favTableInsert.do")
public class Movie_favTableInsertController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		int movieNum=Integer.parseInt(req.getParameter("movieNum"));
		PrintWriter pw=resp.getWriter();
		resp.setContentType("text/plain;charset=utf-8");
		Movie_favTableDao dao=Movie_favTableDao.getInstance();
		int check=dao.favCheck(userId, movieNum);
		if(check==1) {			
			JSONObject json=new JSONObject();
			json.put("result", "true");
			pw.print(json.toString());
		}else if(check==0) {
			JSONObject json=new JSONObject();
			json.put("result", "false");
			pw.print(json.toString());
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "CommWrite실패");
			req.setAttribute("pages", "/ETC/error.jsp");			
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		int movieNum=Integer.parseInt(req.getParameter("movieNum"));
		PrintWriter pw=resp.getWriter();
		resp.setContentType("text/plain;charset=utf-8");
		Movie_favTableDao dao=Movie_favTableDao.getInstance();
		int check=dao.favCheck(userId, movieNum);
		if(check==1) {
			if(dao.favDelete(userId, movieNum)>0) {
				JSONObject json=new JSONObject();
				json.put("result", "delete");
				pw.print(json.toString());
			}
		}else if(check==0) {
			if(dao.favInsert(userId, movieNum)>0) {
				JSONObject json=new JSONObject();
				json.put("result", "insert");
				pw.print(json.toString());
			}
		}else {
			req.setAttribute("errCode", "-1");
			req.setAttribute("errMsg", "CommWrite실패");
			req.setAttribute("pages", "/ETC/error.jsp");			
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
		}
	}
}
