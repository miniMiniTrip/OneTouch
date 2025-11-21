package com.onetouch;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.onetouch.interceptor.LoggerInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		System.out.println("	[Interceptors()]");
		
		registry.addInterceptor(new LoggerInterceptor())
				.addPathPatterns(
								 "/adminpage/**" // 관리자 페이지
								,"/post/insert"  // post 등록시
								,"/qna/write"    // qna 등록시
								,"/qna/modify"   // qna 수정시
								,"/qna/list"     // qna 목록 볼떄
								,"/post/postLikeNotUser"// post 좋아요 클릭시
								,"/post/modify"
								)  //로그인 여부 체크하는경우
		        .excludePathPatterns("/cart/count","/error","/sample/**","/assets/**","/css/**", "/image/**", "/js/**"); //체크하지않는경우  
	}
}
