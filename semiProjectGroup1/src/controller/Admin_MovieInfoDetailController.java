package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_CharInfoDao;
import dao.Admin_MovieViewDao;
import vo.Admin_CharInfoVo;
import vo.Admin_MovieInfoVo;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int movieNum=Integer.parseInt(req.getParameter("movieNum"));
		Admin_MovieViewDao dao = Admin_MovieViewDao.getInstance();
		ArrayList<Admin_MovieViewVo> vo = dao.detail(movieNum);
		req.setAttribute("movieNum", movieNum);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/Admin/admin_MovieInfoDetail.jsp").forward(req, resp);
	}(movieNum);
		req.setAttribute("movieNum", movieNum);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/Admin/admin_MovieInfoDetail.jsp").forward(req, resp);
	}
		req.setAttribute("movieNum", movieNum);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/Admin/admin_MovieInfoDetail.jsp").forward(req, resp);
	}
}
ward(req, resp);
	}).forward(req, resp);
	}
}
