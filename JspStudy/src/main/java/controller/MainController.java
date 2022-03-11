package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.CommonService;
import model.service.MVCService;
public class MainController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	// 컨트롤러로 실행할 서비스모델 객체 자료구조
	private Map<String, Object> instances = new HashMap<>();

	@Override // 최초 1회 실행 초기(설정)화 메서드
	public void init(ServletConfig config) throws ServletException {
		// url맵핑으로 프로퍼티 객체 생성 키 벨류 → 키 구조체(객체) = 적재로 키(벨류)prop → 최종 키(객체)instances
		// 주소를 지정한 프로퍼티 파일 경로 구하기
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF")+"/urlMapping.properties";
		System.out.println("path : "+path);
		
		// 프로퍼티 파일 입력스트림연결 후 프로퍼티 객체 생성
		Properties prop = new Properties();
				
		try {
			FileInputStream fis = new FileInputStream(path);
			prop.load(fis);
			fis.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// 프로퍼티 객체로 부터 서비스 객체 생성
		Iterator iter = prop.keySet().iterator();		
		
		while(iter.hasNext()) {
			
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				// 클래스를 객체로 동적 생성
				Class obj = Class.forName(v);
				Object instance = obj.newInstance();
			
				instances.put(k, instance);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // init end....
	
	@Override
	protected void doGet(HttpServletRequest req/*(리퀘스트 객체)*/, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	
	
	} // doGet end...
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	} // .. doPost end...
		
	protected void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전송 request 문자셋 설정
		req.setCharacterEncoding("utf-8");
		
		// 컨테스트패쓰(Context path) 프로젝트 이름
		// 요청주소(클라이언트에 입력한)에서 service 객체의 key 구하기
		String path = req.getContextPath(); // /JspStudy
		String uri = req.getRequestURI(); 	// 주소(프로젝트 이름) url(도메인) →  uri주소뒤에 8080/JspStudy/....jsp~ 
		String key = uri.substring(path.length());
		
		// instances에서 service 객체 가져오기
		CommonService service = (CommonService) instances.get(key);

		// service 객체 실행 후 view 리턴 받기
		String result = service.businessProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			// 리다이렉트
			String redirectUrl = result.substring(9);
			/*result(리다이렉트주소)↓*/
			resp.sendRedirect(redirectUrl);
			
		}else {
			// view 포워드
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp);
		}
		
	}// requestProc end

}
