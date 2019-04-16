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

import dao.Movie_MovieInfoDao;
import dao.Movie_ReviewImageDao;
import vo.Movie_ReviewImageVo;

@WebServlet("/admin/movieImgRegistration.do")
public class Admin_MovieImgRegistrationController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String movieNum = req.getParameter("movieNum");
		String imageType = req.getParameter("imageType");
		String movieName = "";
		if (movieNum == null) {
			movieNum = "";
			imageType = "";
		} else {
			Movie_MovieInfoDao movieInfoDao = Movie_MovieInfoDao.getInstance();
			movieName = movieInfoDao.getMovieInfo(Integer.parseInt(movieNum)).getMovieName();
		}
		req.setAttribute("movieNum", movieNum);
		req.setAttribute("movieName", movieName);
		req.setAttribute("imageType", imageType);
		req.setAttribute("pages", "/Admin/admin_MovieImgRegistration.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dir = req.getServletContext().getRealPath("/Movie/images/photo");
		try {
			MultipartRequest mr = new MultipartRequest(req, dir, 1024 * 1024 * 5, "utf-8",
					new DefaultFileRenamePolicy());
			int movieNum = Integer.parseInt(mr.getParameter("movieNum"));
			int imageType = Integer.parseInt(mr.getParameter("imageType"));
			Enumeration<String> em = mr.getFileNames();
			if (em.hasMoreElements()) {
				String name = em.nextElement();
				String charOrgFileName = mr.getOriginalFileName(name);
				String charSavFileName = mr.getFilesystemName(name);
				Movie_ReviewImageVo vo = new Movie_ReviewImageVo(0, imageType, charOrgFileName, charSavFileName,
						movieNum);
				Movie_ReviewImageDao dao = Movie_ReviewImageDao.getInstance();
				if (dao.reviewImgWrite(vo) > 0) {
					req.setAttribute("errMsg", "등록되었습니다.");
					req.setAttribute("pages", "/Admin/admin_MovieImgRegistration.jsp");
					req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
				} else {
					req.setAttribute("errCode", "-1");
					req.setAttribute("errMsg", "reviewImgWrite실패");
					req.setAttribute("pages", "/Admin/admin_MovieImgRegistration.jsp");
					req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
