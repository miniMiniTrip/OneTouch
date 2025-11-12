package com.onetouch.interceptor;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.onetouch.vo.MemVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoggerInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception{
		
		log.info("");
		log.info("====================================================================================");
		log.info("===========================[로그인 여부 체크interceptor]================================");
		log.info("Request URI : "+request.getRequestURI());
		
		MemVo user=(MemVo)request.getSession().getAttribute("user");
		if(user==null) {
			String url=request.getRequestURL().toString();
			
			StringBuffer sb = new StringBuffer(url);
			sb.append("?");
			
			Enumeration<String> paramNames = request.getParameterNames();
			while(paramNames.hasMoreElements()) {
				String parameName=paramNames.nextElement();
				String parame=request.getParameter(parameName);
				sb.append(parameName);
				sb.append("=");
				sb.append(parame);
				sb.append("&");
			}
			
			String full_url=sb.toString();
			if(full_url.endsWith("&")||full_url.endsWith("?")) {
				full_url=full_url.substring(0,full_url.length()-1);
			}
			System.out.println("full_url:"+full_url);
			String encoded_full_url=URLEncoder.encode(full_url,StandardCharsets.UTF_8);
			System.out.println("encoded_full_url:"+encoded_full_url);
			
			response.sendRedirect(request.getContextPath()+"/user/login?usersession=logout&url="+encoded_full_url);
			return false;
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.info("==================== END ======================");
        log.info("===============================================");
        log.info("");
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }
    
}//end : LoggerInterceptor
