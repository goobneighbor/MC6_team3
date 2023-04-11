package com.t09ether.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 interceptoró���� Ŭ����
 �ݵ�� HandlerInterceptorAdapter�� ��ӹ޾� ����� 
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{
	//��Ʈ�ѷ��� ȣ��Ǳ� ���� ����ȴ�
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//�α��� ������ Ȯ���ϰ� �α��� �� ��� ȣ���� �����ּҷ� �̵��ϰ�,
		//�α����� �ȵ� ��� �α��� ������ ������ �̵��ǵ����Ѵ�
		
		HttpSession session = request.getSession();
		
		String logId = (String) session.getAttribute("logId");
		String logStatus = (String) session.getAttribute("logStatus"); //null. 'Y'
		
		if(logStatus==null|| !logStatus.equals("Y")) {//�α����� �ȵȰ�� ->������ ���߰� �α������� ������
			response.sendRedirect(request.getContextPath()+"/loginForm");
			return false;
		}
		
		//��ȯ���� false�̸� �����������ϰ�
		//true�̸� ������ �����Ѵ�
		return true;
	}
	//��Ʈ�ѷ��� ������  View�� �̵��ϱ����� ����Ǵ� �޼ҵ�
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView mav) throws Exception{
		
	}
	
	//��Ʈ�ѷ��� ������ ȣ��Ǵ� �޼ҵ�
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception{
		
	}
}