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

import dao.FreeBoard_FreeBoardDao;
import dao.FreeBoard_FreeBoardImageDao;
import dao.User_UserInfoDao;
import vo.FreeBoard_FreeBoardImageVo;
import vo.FreeBoard_FreeBoardVo;

@WebServlet("/FreeBoard/write.do")
public class FreeBoard_WriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pages", "/FreeBoard/write.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dir=req.getServletContext().getRealPath("/FreeBoard/FreeBoardImageUpload");
		try {
			MultipartRequest mr=new MultipartRequest(
					req,
					dir,
					1024*1024*5,
					"utf-8",
					new DefaultFileRenamePolicy()
				);
			String freeBoardTitle=mr.getParameter("freeBoardTitle");
			String freeBoardContent=mr.getParameter("freeBoardContent");
			String userId=mr.getParameter("userId");
			FreeBoard_FreeBoardVo vo=new FreeBoard_FreeBoardVo(0, freeBoardTitle, freeBoardContent, null, userId);
			FreeBoard_FreeBoardDao dao=FreeBoard_FreeBoardDao.getInstance();
			FreeBoard_FreeBoardImageDao dao1=FreeBoard_FreeBoardImageDao.getInstance();
			int freeBoardNum=dao.write(vo);
			if(freeBoardNum>0) {
				Enumeration<String> em=mr.getFileNames();
				while(em.hasMoreElements()) {
					String name=em.nextElement();
					String freeBoardOrgImgName=mr.getOriginalFileName(name);
					String freeBoardSavImgName=mr.getFilesystemName(name);
					FreeBoard_FreeBoardImageVo vo1=new FreeBoard_FreeBoardImageVo(0, freeBoardOrgImgName, freeBoardSavImgName, freeBoardNum);
					if(dao1.writeImg(vo1)<0) {
						req.setAttribute("errCode", "-1");
						req.setAttribute("errMsg", "ImgWrite실패");
						req.setAttribute("pages", "/ETC/error.jsp");
						req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
					}
				}
			User_UserInfoDao uiDao=new User_UserInfoDao();
			uiDao.expCalc(userId);
			uiDao.levCalc(userId);
			req.setAttribute("pages", "/FreeBoard/Content.do?freeBoardNum="+freeBoardNum);
			req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
			}else {
				req.setAttribute("errCode", "-1");
				req.setAttribute("errMsg", "Write실패");
				req.setAttribute("pages", "/ETC/error.jsp");
				req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
