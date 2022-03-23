package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.ArticleDao;
import kr.co.farmstory2.vo.ArticleVo;

public class CommentService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String parent  = req.getParameter("parent");
		String content = req.getParameter("content");
		String uid     = req.getParameter("uid");
		String regip   = req.getRemoteAddr();
		
		ArticleVo vo = new ArticleVo();
		vo.setParent(parent);
		vo.setContent(content);
		vo.setUid(uid);
		vo.setRegip(regip);
		
		ArticleDao dao = ArticleDao.getInstance();
		
		int no = dao.insertComment(vo);
		ArticleVo comment = dao.selectComment(no);
		Gson gson = new Gson();
		String jsonData = gson.toJson(comment);

		return "json:"+jsonData;
	}

}