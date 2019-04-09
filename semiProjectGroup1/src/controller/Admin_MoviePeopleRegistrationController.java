package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Admin_CharInfoDao;
import vo.Admin_charInfoVo;

@WebServlet("/admin/moviePeopleRegistration.do")
public class Admin_MoviePeopleRegistrationController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pages", "/Admin/admin_MoviePeopleRegistration.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dir=req.getServletContext().getRealPath("/Admin/AdminMoviePeopleImageUpload");
		try {
			MultipartRequest mr=new MultipartRequest(
					req,
					dir,
					1024*1024*5,
					"utf-8",
					new DefaultFileRenamePolicy()
				);
			String charName=mr.getParameter("charName");
			Enumeration<String> em=mr.getFileNames();
			if(em.hasMoreElements()) {
				String name=em.nextElement();
				String charOrgFileName=mr.getOriginalFileName(name);
				String charSavFileName=mr.getFilesystemName(name);
				Admin_charInfoVo vo=new Admin_charInfoVo(0, charName, charOrgFileName, charSavFileName);
				Admin_CharInfoDao dao=Admin_CharInfoDao.getInstance();
				if(dao.charWrite(vo)>0){
					resp.sendRedirect(req.getContextPath()+"/Admin/MoviePeopleList.do");
				}else {
					req.setAttribute("errCode", "-1");
					req.setAttribute("errMsg", "charWrite½ÇÆÐ");
					req.setAttribute("pages", "/ETC/error.jsp");
					req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
