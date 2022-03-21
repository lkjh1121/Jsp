package kr.co.farmstory2.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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


public class MainController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// 컨트롤러로 실행할 서비스모델 객체 자료구조
	private Map<String, Object> instances = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// 프로퍼티 파일 경로 구하기
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF")+"/urlMapping.properties";		
		System.out.println("path : "+path);
		
		// 프로퍼티 파일 입력스트림 연결 후 프로퍼티 객체 생성
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
				// 클래스를 객체로 동적생성
				Class obj = Class.forName(v);
				Object instance = obj.newInstance();
				
				instances.put(k, instance);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}// init end...
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}// doGet end...
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}// doPost end...
	
	protected void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 요청주소에서 service 객체의 key 구하기
		String path = req.getContextPath();
		String uri = req.getRequestURI();
		String key = uri.substring(path.length());
		
		// instances에서 service 객체 가져오기
		CommonService service = (CommonService) instances.get(key);

		// service 객체 실행 후 view 리턴 받기
		String result = service.businessProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			// 리다이렉트
			String redirectUrl = result.substring(9);
			resp.sendRedirect(redirectUrl);
		}else if(result.startsWith("json:")) {
			// Json 출력
			resp.setContentType("application/json;charset=UTF-8");
			resp.setCharacterEncoding("utf-8");
			
			PrintWriter out = resp.getWriter();
			out.print(result.substring(5));
			
		}else if(result.startsWith("file:")){
			// 파일전송(파일 다운로드)
			String oName = (String) req.getAttribute("oName");
			String nName = (String) req.getAttribute("nName");
			
			// 파일 다운로드 response 헤더수정	
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(oName, "utf-8"));
			resp.setHeader("Content-Transfer-Encoding", "binary");
			resp.setHeader("Pragma", "no-cache");
			resp.setHeader("Cache-Control", "private");
			
			// response 객체 스트림 작업
			String filePath = req.getServletContext().getRealPath("/file");
			
			File file = new File(filePath+"/"+nName);
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
			
			while(true){
				int data = bis.read();
				
				if(data == -1){
					break;			
				}
				
				bos.write(data);
			}
			
			bos.close();
			bis.close();
			
		}else {
		
			// view 포워드
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp);
		}
		
	}// requestProc end...
	
	
}