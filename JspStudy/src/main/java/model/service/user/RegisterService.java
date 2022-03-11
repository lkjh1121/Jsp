package model.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDao;
import model.service.CommonService;
import vo.UserVo;

public class RegisterService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			// Get 夸没老 版快
			return "/Sub8/user/register.jsp";	
		}else {
			// Post 夸没老 版快
			String uid  = req.getParameter("uid");
			String name = req.getParameter("name");
			String hp   = req.getParameter("hp");
			String age  = req.getParameter("age");
			
			// Dao 角青
			UserVo vo = new UserVo();
			vo.setUid(uid);
			vo.setName(name);
			vo.setHp(hp);
			vo.setAge(age);
			
			UserDao.getInstance().insertUser(vo);
			
			return "redirect:/JspStudy/Sub8/user/list.do";
		}
		
	}

}