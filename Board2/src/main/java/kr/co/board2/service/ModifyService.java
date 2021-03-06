package kr.co.board2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.ArticleDao;
import kr.co.board2.vo.ArticleVo;
import kr.co.board2.vo.FileVo;

public class ModifyService implements CommonService{

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			//데이터 수신
			String no = req.getParameter("no");
			
			//데이터베이스 처리
			ArticleVo article = ArticleDao.getInstance().selectArticle(no);
			
			//requestSope 처리
			req.setAttribute("article", article);
			
			return "/modify.jsp";
		}else {
			String no = req.getParameter("no");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			ArticleDao.getInstance().updateArticle(no, title, content);
			
			return "redirect:/Board2/view.do?no="+no;
		}
		
		
		
	}

}
