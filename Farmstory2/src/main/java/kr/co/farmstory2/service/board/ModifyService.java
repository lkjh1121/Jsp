package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.ArticleDao;
import kr.co.farmstory2.vo.ArticleVo;
import kr.co.farmstory2.vo.FileVo;

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
			
			return "redirect:/Farmstory2/Board/view.do?no="+no;
		}
		
		
		
	}

}
