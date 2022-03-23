package kr.co.farmstory2.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.config.DBConfig;
import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.ArticleDao;
import kr.co.farmstory2.vo.ArticleVo;
import kr.co.farmstory2.vo.UserVo;

public class ViewService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		// 로그인 체크
		HttpSession sess = req.getSession();
		UserVo userVo = (UserVo) sess.getAttribute("sessUser");
		
		if(userVo == null) {
			return "redirect:/Farmstory2/user/login.do";
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