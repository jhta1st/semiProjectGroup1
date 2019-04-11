package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Admin_CharInfoDao;
import dao.Movie_ReviewImageDao;
import vo.Admin_CharInfoVo;
import vo.Movie_ReviewImageVo;

@WebServlet("/admin/MovieImgUpdate.do")
public class Admin_MovieImgUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int movieNum = Integer.parseInt(req.getParameter("movieNum"));
		int imageNum = Integer.parseInt(req.getParameter("ImageNum"));
		Movie_ReviewImageDao dao = Movie_ReviewImageDao.getInstance();
		ArrayList<HashMap<String, Object>> vo = dao.getImages(movieNum);
		Movie_ReviewImageVo vo1 = dao.detail(imageNum);
		req.setAttribute("vo", vo);
		req.setAttribute("vo1", vo1);
		req.setAttribute("pages", "/Admin/admin_MovieImageUpdate.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dir = req.getServletContext().getRealPath("/Movie/images/photo");
		MultipartRequest mr = new MultipartRequest(
				req, 
				dir, 
				1024 * 1024 * 5, 
				"utf-8", 
				new DefaultFileRenamePolicy());
		int imageNum = Integer.parseInt(mr.getParameter("imageNum"));
		System.out.println("00" + imageNum);
		int movieNum = Integer.parseInt(mr.getParameter("movieNum"));
		System.out.println("movieNum" + movieNum);
		Movie_ReviewImageDao dao = Movie_ReviewImageDao.getInstance();
		Movie_ReviewImageVo vo1 = dao.detail(imageNum);
		int imageType = Integer.parseInt(mr.getParameter("imageType"));
		String imageOrgName = mr.getOriginalFileName("file2");// ���۵� ���ϸ�
		int n = 0;
		if (imageOrgName != null) {// ������ ������ ���۵� ���
			String savefile = mr.getFilesystemName("file2");// ����� ���ϸ�
			File f1 = mr.getFile("file2");
			Movie_ReviewImageVo vo2 = new Movie_ReviewImageVo(imageNum, imageType, imageOrgName, savefile, movieNum);
			n = dao.update(vo2);
			// 3. �������ϻ���
			String imageSavName = vo2.getImageSavName();
			File f = new File(dir + "\\" + imageSavName);
			if (f.delete()) {
				System.out.println("�������ϻ��� ����!");
			}
		} else {// ������ ������ ���۵��� ���� ���
				// �������� �״�� �����ϱ�
			Movie_ReviewImageVo vo3 = new Movie_ReviewImageVo(imageNum, imageType, vo1.getImageOrgName(),
					vo1.getImageSavName(), movieNum);
			n = dao.update(vo3);
		}
		if (n > 0) {
			req.getRequestDispatcher("/admin/MovieViewDetail.do?movieNum=" + movieNum).forward(req, resp);
		} else {
			req.setAttribute("code", "fail");
			req.getRequestDispatcher("/User/user_result.jsp").forward(req, resp);
		}
	}
}