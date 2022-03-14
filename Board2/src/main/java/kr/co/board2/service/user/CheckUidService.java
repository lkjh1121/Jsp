package kr.co.board2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.UserDao;

public class CheckUidService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String uid = req.getParameter("uid");
		int count = UserDao.getInstance().selectCountUid(uid);

		// Json 데이터 생성
		JsonObject json = new JsonObject();
		json.addProperty("result", count);
		
		// Json 출력
		return "json:"+json.toString();
	}

}