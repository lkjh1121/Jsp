package kr.co.farmstory2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.UserDao;

public class CheckUidService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String uid = req.getParameter("uid");
		int count = UserDao.getInstance().selectCountUid(uid);

		// Json ������ ����
		JsonObject json = new JsonObject();
		json.addProperty("result", count);
		
		// Json ���
		return "json:"+json.toString();
	}

}