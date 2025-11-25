package com.onetouch.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onetouch.dao.MemDao;
import com.onetouch.service.MemService;
import com.onetouch.vo.MemVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@Autowired
	MemService memService;
	@Autowired
	MemDao memDao;
	@Autowired
	HttpSession session;
	
	//==========계정
	
	
	//로그인 화면 보여주기
	@RequestMapping("/user/login")
	public String loginForm(
			@RequestParam(defaultValue = "1") String mem_id_check
			,@RequestParam(defaultValue = "1") String mem_pw_check
			,Model model
			,String usersession
			,String url) {
		System.out.println("	[LoginController] loginForm() ");
		System.out.println(mem_id_check);
		model.addAttribute("usersession", usersession);
		model.addAttribute("mem_id_check",mem_id_check);
		model.addAttribute("mem_pw_check",mem_pw_check);
		model.addAttribute("url", url);
		System.out.println("	[LoginController] return : user/login.jsp ");
		return "user/login";
	}
	
//	@RequestMapping("/user/find_password")
//	public String findPassword() {
//		System.out.println("	[LoginController] findPassword()");
//		
//		System.out.println("	[LoginController] return : user/find_password.jsp ");
//		return "user/find_password";
//		
//	}
//
//	@RequestMapping("/user/reset_password")
//	public String resetPassword() {
//		System.out.println("	[LoginController] resetPassword() ");
//		
//		System.out.println("	[LoginController] return : user/reset_password.jsp ");
//		return "user/reset_password";
//		
//	}
	
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
		int res=1;
		try {
			res = res*memService.insert(memVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
	//로그인시 이메일 체크
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
	
	//로그인처리
	@PostMapping("/user/login")
	public String login(
			@RequestParam String mem_id
			,@RequestParam String mem_pwd_check
			,RedirectAttributes ra
			,@RequestParam String url) {
		System.out.println("	[LoginController] login() ");

		System.out.println(url);
		//등록되어있는 아이디가 존재하는지 체크하기
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("mem_pwd_check", mem_pwd_check);
		map =memService.loginCheck(map);
		
		// 아이디가 틀린경우 , 비밀번호가 틀린경우
		if(map.get("mem_id_check").equals(false)|| map.get("mem_pw_check").equals(false)) {
			ra.addAttribute("mem_id_check",map.get("mem_id_check"));
			ra.addAttribute("mem_pw_check",map.get("mem_pw_check"));
			System.out.println("	[LoginController] redirect:user/login");
			return "redirect:/user/login";
		}
//		else if(map.get("mem_pw_check").equals(false)){
//			return "redirect:/user/login";
//			
//		}
		System.out.println(map.get("memVo"));
		session.setAttribute("user",map.get("memVo") );
		
		if(url != null && !url.isEmpty()) {
				//String decoded_url = URLDecoder.decode(url,StandardCharsets.UTF_8);
			try {
				URI redirectUri = new URI(url);
				return "redirect:"+redirectUri.toASCIIString();
			} catch (URISyntaxException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		System.out.println("	[LoginController] return : redirect:/ ");
		return"redirect:/";
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout() {
		session.removeAttribute("user");
		return"redirect:/";
	}
	

	//-------------------------------------------------------------------------------------

	
	//회원 수정 페이지 열기 
	@RequestMapping("/user/user_modify")
	public String userModufy(Model model) {
		System.out.println("	[LoginController] userModufy() ");
		MemVo memVo=(MemVo)session.getAttribute("user");
		if(memVo==null) {
			return "redirect:/";
		}
		int mem_idx=memVo.getMem_idx();
		memVo=memDao.selectMemIdxOne(mem_idx);
		
		model.addAttribute("memVo",memVo);
		System.out.println("	[LoginController] return :user/user_modify.jsp  ");
		return"user/user_modify";
	}
	
	
	 //비밀번호 확인 폼 열기
	@RequestMapping("/user/check_password")
	public String checkPasswordFrom() {
		System.out.println("	[LoginController]  checkPasswordFrom() ");
		System.out.println("	[LoginController] return : user/check_password.jsp  ");
		return"user/check_password";
		
	}
	
	//회원 수정시 비밀번호체크
	@PostMapping("/user/check_password")
	@ResponseBody
	public Map<String,Object> checkPassword(String password) {
		System.out.println("	[LoginController-@ResponseBody]  checkPassword() ");
		
		Map<String,Object> map = new HashMap<String, Object>();
		MemVo memVo=(MemVo)session.getAttribute("user");
		if(memVo==null) {
			map.put("login", "로그인해주세요");
			return map;
		}
		int mem_idx=memVo.getMem_idx();
		MemVo memVoOrigin=memDao.selectMemIdxOne(mem_idx);
		if(memVoOrigin.getMem_pw().equals(password)) {
			map.put("checkPassword",true);
		}else {
			map.put("checkPassword",false);
		}
		System.out.println("	[LoginController-@ResponseBody]  return : map ");
		System.out.println("");
		return map;
	}
	
	
	
	
}
