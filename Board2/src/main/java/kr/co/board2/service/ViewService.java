package kr.co.board2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.ArticleDao;
import kr.co.board2.db.DBConfig;
import kr.co.board2.vo.ArticleVo;
import kr.co.board2.vo.UserVo;

public class ViewService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		// 로그인 체크
		HttpSession sess = req.getSession();
		UserVo userVo = (UserVo) sess.getAttribute("sessUser");
		
		if(userVo == null) {
			return "redirect:/Board2/user/login.do";
		}else {
			String no = req.getParameter("no");
			
			ArticleDao dao = ArticleDao.getInstance();
			
			ArticleVo article = dao.selectArticle(no);
			List<ArticleVo> comments = dao.selectComments(no);
			
			req.setAttribute("article", article);
			req.setAttribute("comments", comments);
			
			return "/view.jsp";
		}
	}

}