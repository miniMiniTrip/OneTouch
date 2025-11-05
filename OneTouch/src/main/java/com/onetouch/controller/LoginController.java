package com.onetouch.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onetouch.dao.MemDao;
import com.onetouch.service.MemService;
import com.onetouch.vo.MemVo;

@Controller
public class LoginController {
	
	@Autowired
	MemService memService;
	@Autowired
	MemDao memDao;
	
	//==========계정
	
	
	@RequestMapping("/user/login")
	public String login() {
		System.out.println("	[LoginController] login() ");
		
		System.out.println("	[LoginController] return : user/login.jsp ");
		return "user/login";
	}
	
	@RequestMapping("/user/find_password")
	public String findPassword() {
		System.out.println("	[LoginController] findPassword()");
		
		System.out.println("	[LoginController] return : user/find_password.jsp ");
		return "user/find_password";
		
	}

	@RequestMapping("/user/reset_password")
	public String resetPassword() {
		System.out.println("	[LoginController] resetPassword() ");
		
		System.out.println("	[LoginController] return : user/reset_password.jsp ");
		return "user/reset_password";
		
	}
	
	/* 회원가입 폼 컨트롤러 */
	@RequestMapping("/user/register")
	public String register() {
		System.out.println("	[LoginController] register() ");
		
		
		
		System.out.println("	[LoginController] return : user/register.jsp ");
		return "user/register";
		
	}

	/* 회원가입 등록 */
	@RequestMapping("/user/insert")
	public String registerInsert(MemVo memVo) {
		System.out.println("	[LoginController] register() ");
		System.out.printf("				[회원가입등록요청정보]%s",memVo);
		int res=memDao.insert(memVo);
		if(res==1) {
			System.out.println("		회원정보 1개 등록성공");
		}
		System.out.println("	[LoginController] return : user/register.jsp ");
		return "redirect:/";
		
	}
	
	
	
	/* 아이디 중복 체크 */
	@RequestMapping("/user/idCheck")
	@ResponseBody
	public Map<String,Object> idCheck(String mem_id) {
		System.out.println("	[LoginController] idCheck() ");
		String memId=mem_id;
		Map<String,Object> map = new HashMap<String, Object>();
		MemVo memVo=memDao.selectMemIdOne(mem_id);
		System.out.println(memVo);
		if(memVo==null) {
			map.put("idCheck", true );
		}else {
			map.put("idCheck", false );
			
		}
		System.out.println("	 [@ResponseBody]");
		System.out.println("	[LoginController] return : map ");
		return map;
	}
	
	@RequestMapping("/user/emailCheck")
	@ResponseBody
	public Map<String,Object> emailCheck(String mem_email){
		System.out.println("	[LoginController] emailCheck() ");
		Map<String,Object> map = new HashMap<String, Object>();
		MemVo memVo=memDao.selectMemEmailOne(mem_email);
		//System.out.println(memVo);
		if(memVo==null) {
			map.put("emailCheck", true);
		}else {
			map.put("emailCheck", false);
		}
		//System.out.println(map);
		System.out.println("	 [@ResponseBody]");
		System.out.println("	[LoginController] return : map ");
		return map;
	}
	
	
}
