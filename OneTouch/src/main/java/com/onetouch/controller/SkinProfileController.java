package com.onetouch.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.dao.HashtagDao;
import com.onetouch.vo.HashtagVo;

@Controller
public class SkinProfileController {

	
	@Autowired
	HashtagDao hashtag_dao;
	
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
		
		List<HashtagVo> hash_list = new ArrayList<>();
		for (Integer idx : list) {
			HashtagVo vo = hashtag_dao.selectOne(idx);
			if(vo != null) {
				hash_list.add(vo);
			}
		} 
		
		model.addAttribute("list",list);
		model.addAttribute("hash_list",hash_list);		
		
		return "skinprofile/view"; 
	}
}
