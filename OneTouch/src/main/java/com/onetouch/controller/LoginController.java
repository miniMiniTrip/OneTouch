package com.onetouch.controller;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onetouch.dao.MemDao;
import com.onetouch.service.EmailService;
import com.onetouch.service.MemService;
import com.onetouch.vo.MemVo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@Autowired
	MemService memService;
	@Autowired
	MemDao memDao;
	@Autowired
	HttpSession session;
	@Autowired
	EmailService emailService; 
	
	@Autowired
	ServletContext application;
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
	public String registerInsert(MemVo memVo, RedirectAttributes ra) {
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
			ra.addAttribute("register","success");
		}
		System.out.println("	[LoginController] return : user/register.jsp ");
		return "redirect:/user/login";
		
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
		System.out.println(		"[LoginController] logout()");
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
		System.out.println("");
		return"user/user_modify";
	}
	
	//마이페이지에서 회원정보 수정 처리
	@RequestMapping("/user/updateMember")
	public String userUpdate(MemVo memVo, RedirectAttributes ra)  {
		System.out.println("	[LoginController]  userUpdate() ");
		
		System.out.printf("		수정할 회원 정보 => %s\n",memVo);
		int res=1;
		try {
			res =res* memService.userUpdate(memVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("회원정보 수정실패");
			System.out.println(e.getMessage());
			ra.addAttribute("error", "not_mem_update");
		}
		
		System.out.printf("		res => %d\n",res);
		System.out.println("	[LoginController]  return: redirect:/user/user_modify  ");
		System.out.println("");
		
		return "redirect:/user/user_modify";
	}
	
	
	 // 마이페이지 회원정보 수정 페이지 열기 , 비밀번호 확인 폼 열기
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
	
	// 아이디 찾기 페이지
	@RequestMapping("/user/find_id_form")
	public String findIdFrom() {
		System.out.println("	[LoginController] findIdFrom() ");
		System.out.println("	[LoginController] return :  ");
		System.out.println("");
		return"/user/find_id";
	}
	
	// 아이디 찾기
	@RequestMapping("/user/find_id")
	public String findId(String mem_name,String mem_email,Model model) {
		System.out.println("	[LoginController] findId() ");
		System.out.println(mem_name);
		System.out.println(mem_email);
		String mem_id =memService.findUserId(mem_name, mem_email);
		System.out.println(mem_id);
		if(mem_id==null) {
			model.addAttribute("errorMessage","일치하는 회원정보가 없습니다.");
		}else {
			String maskeId=maskId(mem_id);
			maskeId=String.format("회원님의 아이디는 %s입니다",maskeId);
			model.addAttribute("successMessage",maskeId);
		}
		System.out.println("	[LoginController] return : /user/find_id.jsp ");
		System.out.println("");
		return"/user/find_id";
	}
	
	// 아이디 마킹
	private String maskId(String mem_id) {
		if(mem_id.length() <=4) {
			return "****";
		}
		
		return mem_id.substring(0,2)+"****"+mem_id.substring(mem_id.length()-2);
	}
	
	
	
	// 비밀번호 찾기 폼
    @GetMapping("/user/find_pw_form")
    public String findPwForm() {
        return "/user/find_pw";
    }

    
    //임시 비밀번호 생성기
    public String generateTempPassword(int length) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int index = (int) (Math.random() * chars.length());
            sb.append(chars.charAt(index));
        }
        return sb.toString();
    }
    
    
    // 비밀번호 재설정 요청
    @PostMapping("/user/find_pw")
    public String findPw(
            @RequestParam String mem_id,
            @RequestParam String mem_email,
            Model model) {
    	System.out.println("	[LoginController] findPw() ");
        MemVo user = memService.findUserForPwReset(mem_id, mem_email);

        if (user == null) {
            model.addAttribute("msg", "notfound");
            return "/user/find_pw";
        }

        String temporary_pw = generateTempPassword(10);
        System.out.printf("발급받은 임시 비밀번호 : %s\n",temporary_pw);
        MemVo memVo=memDao.selectMemIdOne(mem_id);
        memVo.setMem_pw(temporary_pw);
        int res=memDao.updateMem(memVo);
        if(res==0){
        	model.addAttribute("msg","email");
        	return"/user/find_pw";
        }
        String text=String.format("안녕하세요. 임시비밀번호를 발급해드렸습니다. \n 회원님의 임시 비밀번호 다음과 같습니다 :   %s \n 로그인 후 반드시 비밀번호를 변경해주시기 바랍니다.",temporary_pw);
        emailService.send(mem_email, "OneTouch 임시 비밀번호",text);

        
        model.addAttribute("successMessage", "비밀번호 재설정 링크가 이메일로 발송되었습니다.");
        System.out.println("	[LoginController] return :  ");
        System.out.println("");
        return "/user/find_pw";
    }
	
	
    
    //회원탈퇴처리
    @RequestMapping("/user/delete")
    public String userDelete(@RequestParam(name="idx") int mem_idx, String image) {
    	System.out.println("	[LoginController] userDelete()  ");
    	System.out.printf("		삭제할 mem_idx => %d\n",mem_idx);
    	memDao.userDelete(mem_idx);
    	File f=new File(application.getRealPath("/images/mem/"),image);
    	f.delete();
    	session.removeAttribute("user");
    	System.out.println("	[LoginController] return :   ");
    	System.out.println();
    	return"redirect:/main";
    }
}
