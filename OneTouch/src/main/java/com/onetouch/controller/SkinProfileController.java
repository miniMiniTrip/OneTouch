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
import com.onetouch.vo.ProductVo;
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
	
	@RequestMapping("/skinprofile/form")
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
		{case 1 : list.add(1); break; 
		 case 2 : list.add(2); break;
		 case 3 : list.add(3); break;
		}
	
		switch(skin2)
		{case 1 : list.add(4); break;
		 case 2 : list.add(5); break;
		}

		switch(skin3)
		{case 1 : list.add(6); break;
		 case 2 : 
		 case 3 : list.add(7); break;
		}
		
		switch(skin4)
		{case 1 : list.add(8); break;
		case 2 : list.add(9);  break; 
		}
		
		switch(skin5)
		{case 1 : list.add(10);  break;
		 case 2 : list.add(11); break;
		 case 3 : list.add(12); break;
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
		SkinProfileVo insertProfile = skin_profile_dao.selectOne(memVo.getMem_idx());
		
	    if(insertProfile == null) {
	    	// 최초 문진 - INSERT
	    	int result = skin_profile_dao.insert(spVo);
	    	System.out.println("피부 프로필 저장 완료: " + result);
	    } else {
	    	// 재문진 - UPDATE
	    	int result = skin_profile_dao.update(spVo);
	    	System.out.println("피부 프로필 업데이트 완료: " + result);
	    }
	    List<Integer> product_idx_list = hashtag_dao.selectProductsByHashtags(list, 2);
	    
	    List<ProductVo> product_list = new ArrayList<>();
	    
	    if(product_idx_list != null && !product_idx_list.isEmpty()) {
	    	// product_idx 리스트로 상품 상세 정보 조회
	    	product_list = product_dao.selectByIds(product_idx_list);
	    }
		model.addAttribute("list",list);
		model.addAttribute("hashtag_list",hashtag_list);
		model.addAttribute("product_list", product_list);
		
		return "skinprofile/view"; 
	}
	
	@RequestMapping("/mypage/skinprofile")
	public String myPageSkinProfile(Model model) {
	    
	    // 로그인 체크
	    MemVo memVo = (MemVo)session.getAttribute("user");
	    
	    if(memVo == null) {
	        return "redirect:/user/login";
	    }
	    
	    // 저장된 피부 프로필 조회
	    SkinProfileVo skinProfile = skin_profile_dao.selectOne(memVo.getMem_idx());
	    
	    if(skinProfile == null) {
	        // 아직 진단 안 한 경우
	        model.addAttribute("hasProfile", false);
	        return "mypage/skinprofile_view";
	    }
	    
	    // JSON 파싱: "[0,3,5,7,9]" → List<Integer>
	    String hashtagIdsJson = skinProfile.getHashtag_ids();
	    hashtagIdsJson = hashtagIdsJson.replace("[", "").replace("]", "");
	    
	    List<Integer> list = new ArrayList<>();
	    if(!hashtagIdsJson.isEmpty()) {
	        String[] idArray = hashtagIdsJson.split(",");
	        for(String id : idArray) {
	            list.add(Integer.parseInt(id.trim()));
	        }
	    }
	    
	    // 해시태그 정보 조회
	    List<HashtagVo> hashtag_list = new ArrayList<>();
	    for (Integer idx : list) {
	        HashtagVo vo = hashtag_dao.selectOne(idx);
	        if(vo != null) {
	            hashtag_list.add(vo);
	        }
	    }
	    
	    // 추천 상품 조회
	    List<Integer> product_idx_list = hashtag_dao.selectProductsByHashtags(list, 2);
	    
	    List<ProductVo> product_list = new ArrayList<>();
	    if(product_idx_list != null && !product_idx_list.isEmpty()) {
	        product_list = product_dao.selectByIds(product_idx_list);
	    }
	    
	    // JSP에 전달
	    model.addAttribute("hasProfile", true);
	    model.addAttribute("skinProfile", skinProfile);
	    model.addAttribute("list", list);
	    model.addAttribute("hashtag_list", hashtag_list);
	    model.addAttribute("product_list", product_list);
	    
	    return "skinprofile/skinprofile_view";
	}

}
