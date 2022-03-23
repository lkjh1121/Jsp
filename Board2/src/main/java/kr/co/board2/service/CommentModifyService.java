package kr.co.board2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.ArticleDao;
import kr.co.board2.vo.ArticleVo;

public class CommentModifyService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String content = req.getParameter("content");
		String no = req.getParameter("no");
		
		int result = ArticleDao.getInstance().updateComment(content, no);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);

		return "json:"+json.toString();
	}

}