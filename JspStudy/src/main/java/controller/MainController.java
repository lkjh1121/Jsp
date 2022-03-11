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
	
	// ��Ʈ�ѷ��� ������ ���񽺸� ��ü �ڷᱸ��
	private Map<String, Object> instances = new HashMap<>();

	@Override // ���� 1ȸ ���� �ʱ�(����)ȭ �޼���
	public void init(ServletConfig config) throws ServletException {
		// url�������� ������Ƽ ��ü ���� Ű ���� �� Ű ����ü(��ü) = ����� Ű(����)prop �� ���� Ű(��ü)instances
		// �ּҸ� ������ ������Ƽ ���� ��� ���ϱ�
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF")+"/urlMapping.properties";
		System.out.println("path : "+path);
		
		// ������Ƽ ���� �Է½�Ʈ������ �� ������Ƽ ��ü ����
		Properties prop = new Properties();
				
		try {
			FileInputStream fis = new FileInputStream(path);
			prop.load(fis);
			fis.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// ������Ƽ ��ü�� ���� ���� ��ü ����
		Iterator iter = prop.keySet().iterator();		
		
		while(iter.hasNext()) {
			
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				// Ŭ������ ��ü�� ���� ����
				Class obj = Class.forName(v);
				Object instance = obj.newInstance();
			
				instances.put(k, instance);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // init end....
	
	@Override
	protected void doGet(HttpServletRequest req/*(������Ʈ ��ü)*/, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	
	
	} // doGet end...
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	} // .. doPost end...
		
	protected void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// ���� request ���ڼ� ����
		req.setCharacterEncoding("utf-8");
		
		// ���׽�Ʈ�о�(Context path) ������Ʈ �̸�
		// ��û�ּ�(Ŭ���̾�Ʈ�� �Է���)���� service ��ü�� key ���ϱ�
		String path = req.getContextPath(); // /JspStudy
		String uri = req.getRequestURI(); 	// �ּ�(������Ʈ �̸�) url(������) ��  uri�ּҵڿ� 8080/JspStudy/....jsp~ 
		String key = uri.substring(path.length());
		
		// instances���� service ��ü ��������
		CommonService service = (CommonService) instances.get(key);

		// service ��ü ���� �� view ���� �ޱ�
		String result = service.businessProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			// �����̷�Ʈ
			String redirectUrl = result.substring(9);
			/*result(�����̷�Ʈ�ּ�)��*/
			resp.sendRedirect(redirectUrl);
			
		}else {
			// view ������
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp);
		}
		
	}// requestProc end

}
