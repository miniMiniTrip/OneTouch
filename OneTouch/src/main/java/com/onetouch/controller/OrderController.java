package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.dao.CartDao;
import com.onetouch.dao.OrderDao;
import com.onetouch.vo.CartVo;
import com.onetouch.vo.ProductVo;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	CartDao cart_dao;
	
	@Autowired
	OrderDao order_dao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/direct_form.do")
	public String order_direct_form(
				@RequestParam int product_idx,
				@RequestParam int product_cnt,
				Model model) {
		
			Integer mem_idx = (Integer) session.getAttribute("mem_idx");
	        if (mem_idx == null) {
	            return "redirect:/member/login.do";
	        }	
	        
	         ProductVo pVo = product_dao.selectOne()
			int total_amount = cart_dao.selectPaymentTotalAmount(map);
			
			//미리보기용 이름
			String order_name_pre = cart_list.get(0).getProduct_name();
	        if (cart_list.size() > 1) {
	            order_name_pre += " 외 " + (cart_list.size() - 1) + "건";
	        }
	        
	        //request binding
	        model.addAttribute("cart_list",cart_list);
	        model.addAttribute("total_amount",total_amount);	        
	        model.addAttribute("order_name",order_name_pre);
	        model.addAttribute("cart_ids",cart_ids);
	        model.addAttribute("order_type", "cart");
	        	
		return "order/order_form";
	}
	
	@RequestMapping("/cart_form.do")
	public String order_cart_form(
				@RequestParam("cart_id") String[] cart_ids,
				Model model) {
		
			Integer mem_idx = (Integer) session.getAttribute("mem_idx");
	        if (mem_idx == null) {
	            return "redirect:/member/login.do";
	        }		
	        
			//선택한 상품 찾기
			Map<String, Object> map = new HashMap<>();
			map.put("cart_id_array", cart_ids);
			
			List<CartVo> cart_list = cart_dao.selectPaymentList(map);
			int total_amount = cart_dao.selectPaymentTotalAmount(map);
			
			//미리보기용 이름
			String order_name_pre = cart_list.get(0).getProduct_name();
	        if (cart_list.size() > 1) {
	            order_name_pre += " 외 " + (cart_list.size() - 1) + "건";
	        }
	        
	        //request binding
	        model.addAttribute("cart_list",cart_list);
	        model.addAttribute("total_amount",total_amount);	        
	        model.addAttribute("order_name",order_name_pre);
	        model.addAttribute("cart_ids",cart_ids);
	        model.addAttribute("order_type", "cart");
	        	
		return "order/order_form";
	}

}
