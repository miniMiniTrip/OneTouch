package com.onetouch.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.dao.HashtagDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.dao.SkinProfileDao;
import com.onetouch.vo.HashtagVo;
import com.onetouch.vo.MemVo;
import com.onetouch.vo.SkinProfileVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class SkinProfileController {

	
	@Autowired
	HashtagDao hashtag_dao;
	
	@Autowired
	ProductDao product_dao;
	
	@Autowired
	SkinProfileDao skin_profile_dao; 
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/skinprofile/form.do")
	public String SkinProfileForm() {
		return "skinprofile/form";
	}
	
	@RequestMapping("/skinprofile/insert.do")
	public String SkinProfile(@RequestParam("skin1") int skin1,
									@RequestParam("skin2") int skin2,
									@RequestParam("skin3") int skin3,
									@RequestParam("skin4") int skin4,
									@RequestParam("skin5") int skin5,
									Model model){
		MemVo memVo =  
				(MemVo)session.getAttribute("user");
		
		if(memVo==null) {return "redirect:/user/login";}
		
		List<Integer> list = new ArrayList<>();

		switch(skin1)
		{case 1 : list.add(0);	break; 
		 case 2 : list.add(1); break;
		 case 3 : list.add(2);	break;
		}
	
		switch(skin2)
		{case 1 : list.add(3); break;
		 case 2 : list.add(4); break;
		}

		switch(skin3)
		{case 1 : list.add(5); break;
		 case 2 : 
		 case 3 : list.add(6); break;
		}
		
		switch(skin4)
		{case 1 : list.add(7); break;
		case 2 : list.add(8); break; 
		}
		
		switch(skin5)
		{case 1 : list.add(9); break;
		 case 2 : list.add(10); break;
		 case 3 : list.add(11); break;
		}
		
		List<HashtagVo> hashtag_list = new ArrayList<>();
		for (Integer idx : list) {
			HashtagVo vo = hashtag_dao.selectOne(idx);
			if(vo != null) {
				hashtag_list.add(vo);
			}
		} 
		
		SkinProfileVo spVo = new SkinProfileVo();
		spVo.setMem_idx(memVo.getMem_idx());
		
		spVo.setSp_skin_type(hashtag_list.get(0).getHashtag_name());
	    spVo.setSp_trouble(hashtag_list.get(1).getHashtag_name());
	    spVo.setSp_color_change(hashtag_list.get(2).getHashtag_name());
	    spVo.setSp_wrinkle(hashtag_list.get(3).getHashtag_name());
	    spVo.setSp_skin_tone(hashtag_list.get(4).getHashtag_name());
		
	    //Json화
	    String hashtagIds = list.stream()
	    						.map(String::valueOf)
	    						.collect(Collectors.joining(",", "[", "]"));
		
	    spVo.setHashtag_ids(hashtagIds);
	    
	    //DB insert
		/* SkinProfileVo insertProfile = skin_profile_dao. */
	    
		model.addAttribute("list",list);
		model.addAttribute("hashtag_list",hashtag_list);

		return "skinprofile/view"; 
	}
}
