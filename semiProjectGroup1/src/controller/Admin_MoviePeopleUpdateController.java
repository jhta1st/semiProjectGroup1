package controller;

import java.io.File;
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

import dao.Admin_CharInfoDao;
import vo.Admin_CharInfoVo;



@WebServlet("/admin/MoviePeopleUpdate.do")
public class Admin_MoviePeopleUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int charNum=Integer.parseInt(req.getParameter("charNum"));
		Admin_CharInfoDao dao=Admin_CharInfoDao.getInstance();
		Admin_CharInfoVo vo=dao.detail(charNum);
		req.setAttribute("vo", vo);
		req.setAttribute("pages", "/Admin/admin_MoviePeopleUpdate.jsp");
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dir=req.getServletContext().getRealPath("/Movie/images/char");

			MultipartRequest mr=new MultipartRequest(
					req,
					dir,
					1024*1024*5,
					"utf-8",
					new DefaultFileRenamePolicy()
				);
			Admin_CharInfoDao dao= Admin_CharInfoDao.getInstance();
			int charNum=Integer.parseInt(mr.getParameter("charNum"));
			Admin_CharInfoVo vo=dao.detail(charNum);
			String charName=mr.getParameter("charName");
			String charOrgFileName=mr.getOriginalFileName("file2");//���۵� ���ϸ�
			int n=0;
			if(charOrgFileName!=null){//������ ������ ���۵� ���
				String savefile=mr.getFilesystemName("file2");//����� ���ϸ�	
				File f1=mr.getFile("file2");
				Admin_CharInfoVo vo1=new Admin_CharInfoVo(charNum, charName, charOrgFileName, savefile);
				n=dao.update(vo1);		
				//3. �������ϻ���
				String charSavFileName=vo.getCharSavFileName();
				File f=new File(dir +"\\" + charSavFileName);
				if(f.delete()){
					System.out.println("�������ϻ��� ����!");
				}
			}else{//������ ������ ���۵��� ���� ���
				//�������� �״�� �����ϱ�
				Admin_CharInfoVo vo2=new Admin_CharInfoVo(charNum, charName, vo.getCharOrgFileName(), vo.getCharSavFileName());			
				n=dao.update(vo2);
			}
			if(n>0){
				resp.sendRedirect(req.getContextPath()+"/admin/MoviePeopleList.do");
			}else{
				req.setAttribute("code", "fail");
				req.getRequestDispatcher("/User/user_result.jsp").forward(req, resp);
			}	
	}
}
