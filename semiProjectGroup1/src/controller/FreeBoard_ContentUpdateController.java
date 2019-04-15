package controller;

import java.io.IOException;
import java.util.ArrayList;
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
import vo.FreeBoard_FreeBoardImageVo;
import vo.FreeBoard_FreeBoardVo;

@WebServlet("/FreeBoard/ContentUpdate.do")
public class FreeBoard_ContentUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		int freeBoardNum=Integer.parseInt(req.getParameter("freeBoardNum"));
		FreeBoard_FreeBoardDao dao=FreeBoard_FreeBoardDao.getInstance();
		FreeBoard_FreeBoardVo vo=dao.getContentInfo(freeBoardNum);
		FreeBoard_FreeBoardImageDao dao1=FreeBoard_FreeBoardImageDao.getInstance();
		ArrayList<FreeBoard_FreeBoardImageVo> vo1=dao1.getContentImageInfo(freeBoardNum);
		req.setAttribute("vo", vo);
		req.setAttribute("vo1", vo1);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("pages", "/FreeBoard/contentUpdate.jsp");
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
			String pageNum=mr.getParameter("pageNum");
			int freeBoardNum=Integer.parseInt(mr.getParameter("freeBoardNum"));
			FreeBoard_FreeBoardVo vo=new FreeBoard_FreeBoardVo(freeBoardNum, freeBoardTitle, freeBoardContent, null, null);
			FreeBoard_FreeBoardDao dao=FreeBoard_FreeBoardDao.getInstance();
			FreeBoard_FreeBoardImageDao dao1=FreeBoard_FreeBoardImageDao.getInstance();
			if(dao.contentUpdate(vo)>0) {//내용 업데이트 되면 이미지 삭제
				String[] freeBoardImgNums=mr.getParameterValues("freeBoardImgNum");//이미지 삭제
				if(freeBoardImgNums!=null) {
					for(int i=0;i<freeBoardImgNums.length;i++) {
						int freeBoardImgNum=Integer.parseInt(freeBoardImgNums[i]);
						if(dao1.contentImgDelete(freeBoardImgNum)<0) {
							req.setAttribute("errCode", "-1");
							req.setAttribute("errMsg", "ImgDelete실패");
							req.getRequestDispatcher("/ETC/error.jsp").forward(req, resp);
							return;
						}
					}
				}
				Enumeration<String> em=mr.getFileNames();//삭제가 끝나면 이미지 등록
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
						return;
					}
				}
				resp.sendRedirect(req.getContextPath()+"/FreeBoard/Content.do?freeBoardNum="+freeBoardNum+"&pageNum="+pageNum);
			}else {
				req.setAttribute("errCode", "-1");
				req.setAttribute("errMsg", "Update실패");
				req.setAttribute("pages", "/ETC/error.jsp");
				req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
			}			
		}catch(Exception ex) {
			ex.printStackTrace();
		}		
	}
}
