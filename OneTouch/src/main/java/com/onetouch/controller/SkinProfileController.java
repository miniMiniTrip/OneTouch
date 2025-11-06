package com.onetouch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SkinProfileController {
	
	@RequestMapping("/skinprofile/form.do")
	public String SkinProfileForm() {
		return "skinprofile/form";
	}
	
	@RequestMapping("/skinprofile/insert.do")
	public static String SkinProfile(@RequestParam("skin1") int skin1,
									@RequestParam("skin2") int skin2,
									@RequestParam("skin3") int skin3,
									@RequestParam("skin4") int skin4,
									@RequestParam("skin5") int skin5,
									Model model){
		String result1="";
		String result2="";
		String result3="";
		String result4="";
		String result5="";
		
		switch(skin1)
		{case 1 : result1 = "지성";	break; 
		 case 2 : result1 = "복합성"; break;
		 case 3 : result1 = "건성";	break;
		 default : result1 = ""; break;
		}
	
		switch(skin2)
		{case 1 : result2 = "민감성"; break;
		 case 2 : result2 = "저항성"; break;
		 default : result2 = ""; break;
		}
		
		switch(skin3)
		{case 1 : result3 = "색소성"; break;
		 case 2 : result3 = "비색소성"; break;
		 case 3 : result3 = "비색소성"; break;
		 default : result3 = ""; break;
		}
		
		switch(skin4)
		{case 1 : result4 = "주름성"; break;
		case 2 : result4 = "탄력성"; break;
		default : result4 = ""; break; 
		}
		
		switch(skin5)
		{case 1 : result5 = "밝은 톤"; break;
		 case 2 : result5 = "중간 톤"; break;
		 case 3 : result5 = "어두운 톤"; break;
		 default : result5 = ""; break;
		}
		
		model.addAttribute("result1", result1);
		model.addAttribute("result2", result2);
		model.addAttribute("result3", result3);
		model.addAttribute("result4", result4);
		model.addAttribute("result5", result5);
		
		return "skinprofile/view"; 
	}
}
