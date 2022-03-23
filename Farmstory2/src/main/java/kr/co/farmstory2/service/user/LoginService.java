package kr.co.farmstory2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.UserDao;
import kr.co.farmstory2.vo.UserVo;

public class LoginService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			return "/user/login.jsp";	
		}else {
			
			String uid  = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			UserVo user = UserDao.getInstance().selectUser(uid, pass);
			
			if(user == null) {
				// 회원이 아님
				return "redirect:/Farmstory2/user/login.do?success=100";	
				
			}else {
				// 회원이 맞음
				HttpSession sess = req.getSession(); // 현재 세션 가져오기
				sess.setAttribute("sessUser", user);
				
				return "redirect:/Farmstory2/";
			}
		}
	}
}