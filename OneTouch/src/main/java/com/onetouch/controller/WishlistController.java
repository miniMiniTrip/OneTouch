package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onetouch.dao.ProductDao;
import com.onetouch.dao.WishlistDao;
import com.onetouch.vo.MemVo;
import com.onetouch.vo.WishlistVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class WishlistController {

	@Autowired
	WishlistDao wishlist_dao;
	
	@Autowired
    ProductDao product_dao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/wishlist/list.do")
	public String list(Model model) {

		MemVo memVo =  
				(MemVo)session.getAttribute("user");
		
		if(memVo==null)	{
			return "redirect:/user/login";
			}
		
		Integer mem_idx = memVo.getMem_idx();
		
		List<WishlistVo> wishlist_list = wishlist_dao.selectList(mem_idx);
		model.addAttribute("wishlist_list", wishlist_list);
		
		return "/wishlist/wishlist_list";
	}
	
	@RequestMapping("/wishlist/insert.do")
	@ResponseBody
	public Map<String, String> insert(WishlistVo vo){
		Map<String, String> map = new HashMap<String, String>();
	    
	    MemVo memVo = (MemVo) session.getAttribute("user");
	    if(memVo == null) {
	        map.put("result", "not_login");
	        return map;
	    }
	    
	    vo.setMem_idx(memVo.getMem_idx());
	    
	    WishlistVo existWishlist = wishlist_dao.selectWishlistByIdProduct(vo);
	    
	    if(existWishlist != null) {
	        map.put("result", "exist");
	        return map;
	    }
	    
	    int res = wishlist_dao.insert(vo);
	    if(res == 1) {
	        map.put("result", "success");
	        wishlist_dao.plusWishlistCount(vo.getProduct_idx());
	    }
	    else {
	        map.put("result", "fail");
	    }
		return map;
	}
	
	//찜 토글에 필요
	@RequestMapping("/wishlist/toggle.do")
	@ResponseBody
	public Map<String, String> toggle(WishlistVo vo){
Map<String, String> map = new HashMap<String, String>();
	    
	    MemVo memVo = (MemVo) session.getAttribute("user");
	    if(memVo == null) {
	        map.put("result", "not_login");
	        return map;
	    }
	    
	    vo.setMem_idx(memVo.getMem_idx());
	    
	    WishlistVo existWishlist = wishlist_dao.selectWishlistByIdProduct(vo);
	    
	    if(existWishlist != null) {
	    	wishlist_dao.delete(existWishlist.getWishlist_idx());
	    	wishlist_dao.minusWishlistCount(vo.getProduct_idx());	    	
            map.put("result", "success");
            map.put("action", "removed");
	    } else {
	    	 int res = wishlist_dao.insert(vo);
	            if (res == 1) {
	                wishlist_dao.plusWishlistCount(vo.getProduct_idx());
	                map.put("result", "success");
	                map.put("action", "added");  // 추가했다는 정보
	            } else {
	                map.put("result", "fail");
	            }
	    }
	    
	    return map;
	}
	
	
    @RequestMapping("/wishlist/delete.do")
    public String delete(int wishlist_idx, RedirectAttributes ra) { 
        MemVo memVo = (MemVo) session.getAttribute("user");
        
        if(memVo == null) {
            return "redirect:/user/login";
        }
        
        WishlistVo vo = wishlist_dao.selectOne(wishlist_idx); 
        
        if(vo != null) {
            wishlist_dao.delete(wishlist_idx);
            wishlist_dao.minusWishlistCount(vo.getProduct_idx()); 
        }
        
        ra.addAttribute("mem_idx", memVo.getMem_idx()); 
        return "redirect:list.do";
    }
}
