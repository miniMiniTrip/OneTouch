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

import com.onetouch.dao.CartDao;
import com.onetouch.dao.CategoryDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.vo.CartVo;
import com.onetouch.vo.MemVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	
	
	@Autowired
	CartDao cart_dao;
	
    @Autowired
    ProductDao product_dao;
    
    @Autowired
    CategoryDao category_dao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/cart/list.do")
	public String list(Model model) {
		
		MemVo memVo =  
				(MemVo)session.getAttribute("user");
		
		if(memVo==null)	{
			return "redirect:/user/login";
			}
		
		Integer mem_idx = memVo.getMem_idx();
		

		List<CartVo> cart_list = cart_dao.selectList(mem_idx);
		int total_amount = cart_dao.selectCartTotalAmount(mem_idx);
		model.addAttribute("cart_list",cart_list);
		model.addAttribute("total_amount",total_amount);
		
		return "/cart/cart_list";
	}
	
	@RequestMapping("/cart/modify.do")
	public String modify(CartVo vo, RedirectAttributes ra) {
		int res = cart_dao.update(vo);
		ra.addAttribute("mem_idx",vo.getMem_idx());
		return "redirect:list.do";
	}
	
	@RequestMapping("/cart/delete.do")
	public String delete(CartVo vo, RedirectAttributes ra) {
		int res = cart_dao.delete(vo.getCart_id());
		ra.addAttribute("mem_idx",vo.getMem_idx());
		return "redirect:list.do";
	}
	
	@RequestMapping("/cart/insert.do")
	@ResponseBody
	public Map<String, String> insert(CartVo vo) {
	    Map<String, String> map = new HashMap<String, String>();
	    
	    MemVo memVo = (MemVo) session.getAttribute("user");
	    if(memVo == null) {
	        map.put("result", "not_login");
	        return map;
	    }
	    
	    vo.setMem_idx(memVo.getMem_idx());
	    
	    CartVo existCart = cart_dao.selectCartIdByProduct(vo);
	    
	    if(existCart != null) {
	        map.put("result", "exist");
	        return map;
	    }
	    
	    int res = cart_dao.insert(vo);
	    if(res == 1)
	        map.put("result", "success");
	    else
	        map.put("result", "fail");
	    
	    return map;
	}
	
	//헤더 드롭다운 목록용
	@RequestMapping("/cart/dropdown")
	@ResponseBody
	public Map<String,Object> dropdown(){
		Map<String,Object> map = new HashMap<>();
		MemVo memVo = (MemVo) session.getAttribute("user");
		if(memVo==null) {
			map.put("result", "not_login");
			map.put("cart_list", new java.util.ArrayList<>());
			map.put("total_amount", 0);
			map.put("count", 0);
			return map;
		}
		
		try {
			int mem_idx = memVo.getMem_idx();
			
			List<CartVo> cart_list = cart_dao.selectList(mem_idx);
			if(cart_list.size() > 4) {
				cart_list = cart_list.subList(0, 4);
			}	
			int total_amount = cart_dao.selectCartTotalAmount(mem_idx);
			int count = cart_dao.selectCartCount(mem_idx);
			
			map.put("result", "success");
			map.put("cart_list", cart_list);
			map.put("total_amount", total_amount);
			map.put("count", count);
			
		} catch(Exception e) {
			map.put("result", "error");
			map.put("cart_list", new java.util.ArrayList<>());
			map.put("total_amount", 0);
			map.put("count", 0);
		}
		return map;
	}
}
