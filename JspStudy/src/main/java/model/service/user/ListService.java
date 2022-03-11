package model.service.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDao;
import model.service.CommonService;
import vo.UserVo;

public class ListService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		// Dao 실행(데이터 가져오기)
		List<UserVo> users = UserDao.getInstance().selectUsers();
		
		// users 데이터셋을 View에서 참조하기 위해 request 객체로 저장
		req.setAttribute("users", users);
		
		return "/Sub8/user/list.jsp";
	}

}