package com.onetouch.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.dao.HashtagDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.vo.HashtagVo;
import com.onetouch.vo.ProductVo;

@Controller
public class SkinProfileController {

	
	@Autowired
	HashtagDao hashtag_dao;
	
	@Autowired
	ProductDao product_dao;
	
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
		
		List<HashtagVo> hashtag_list = new ArrayList<>();
		for (Integer idx : list) {
			HashtagVo vo = hashtag_dao.selectOne(idx);
			if(vo != null) {
				hashtag_list.add(vo);
			}
		} 
		
		/*
		 * Map<String, Object> params = new HashMap<>(); params.put("hashtag_list",
		 * list); params.put("min_match", 2); // 최소 2개 이상 매칭 params.put("limit", 10);
		 * 
		 * List<Integer> product_idx_list =
		 * hashtag_dao.selectProductsByHashtags(params);
		 * 
		 * List<ProductVo> product_list = new ArrayList<>(); if (product_idx_list !=
		 * null && !product_idx_list.isEmpty()) { product_list =
		 * product_dao.selectByIds(product_idx_list); }
		 */

		
		model.addAttribute("list",list);
		model.addAttribute("hashtag_list",hashtag_list);
		/* model.addAttribute("product_list", product_list); */
		
		return "skinprofile/view"; 
	}
}
