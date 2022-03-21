package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;

public class ListService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String cate = req.getParameter("cate");
		String type = req.getParameter("type");
		
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);
		
		return "/board/list.jsp";
	}

}