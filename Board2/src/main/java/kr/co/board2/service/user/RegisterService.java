package kr.co.board2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.UserDao;
import kr.co.board2.vo.UserVo;

public class RegisterService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			// Get 夸没老 版快
			return "/user/register.jsp";	
		}else {
			// Post 夸没老 版快
			
			String uid    = req.getParameter("uid");
			String pass  = req.getParameter("pass1");
			String name   = req.getParameter("name");
			String nick   = req.getParameter("nick");
			String email  = req.getParameter("email");
			String hp     =	 req.getParameter("hp");
			String zip    =	 req.getParameter("zip");
			String addr1  = req.getParameter("addr1");
			String addr2  = req.getParameter("addr2");
			String regip  = req.getParameter("regip");
			
			// Dao 角青
			UserVo vo = new UserVo();
			vo.setUid(uid);
			vo.setPass(pass);
			vo.setName(name);
			vo.setNick(nick);
			vo.setEmail(email);
			vo.setHp(hp);
			vo.setZip(zip);
			vo.setAddr1(addr1);
			vo.setAddr2(addr2);
			vo.setRegip(regip);
			
			UserDao.getInstance().insertUser(vo);
			
		
		
		
		
		
			return "redirect:/Board2/user/login.do?success=102";
		}
	}
}