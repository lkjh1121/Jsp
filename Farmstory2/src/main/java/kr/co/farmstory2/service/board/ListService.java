package kr.co.farmstory2.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.dao.ArticleDao;
import kr.co.farmstory2.vo.ArticleVo;
import kr.co.farmstory2.controller.CommonService;

public class ListService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String cate = req.getParameter("cate");
		String type = req.getParameter("type");
		
//		String pg = req.getParameter("pg");
		
		// 페이지 처리		
//		int currentPage  = getCurrentPageNum(pg);
//		int total        = ArticleDao.getInstance().selectCountTotal(type);
//		int lastPageNum  = getLastPageNum(total);
//		int start        = getLimitStart(currentPage);
//		int pageStartNum = getPageStartNum(total, start); 
//		int[] groups     = getPageGroup(currentPage, lastPageNum);
		int start = 0;
		
		List<ArticleVo> articles = ArticleDao.getInstance().selectArticles(start, type);
		
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);
		req.setAttribute("articles", articles);
		
//		req.setAttribute("currentPage", currentPage);
//		req.setAttribute("lastPageNum", lastPageNum);
//		req.setAttribute("pageStartNum", pageStartNum);
//		req.setAttribute("groups", groups);
		
		return "/board/list.jsp";
		
	}// businessProc end
	
	public int getCurrentPageNum(String pg) {
		if(pg == null) {
			pg = "1";
		}
		return Integer.parseInt(pg);
	}
	
	public int getLastPageNum(int total) {
		int lastPageNum = 0;
		
		if(total % 10 == 0){
			lastPageNum = total / 10;
		}else{
			lastPageNum = total / 10 + 1;
		}
		
		return lastPageNum;
	}
	
	public int getLimitStart(int currentPage) {
		return (currentPage - 1) * 10;
	}
	
	public int getPageStartNum(int total, int start) {
		return (total - start)+1;
	}
	
	public int[] getPageGroup(int currentPage, int lastPageNum) {
		int groupCurrent = (int)Math.ceil(currentPage / 10.0);
		int groupStart = (groupCurrent - 1) * 10 + 1;
		int groupEnd = groupCurrent * 10;
		
		if(groupEnd > lastPageNum){
			groupEnd = lastPageNum;
		}
		
		int[] groups = {groupStart, groupEnd};
		
		return groups;
	}

}