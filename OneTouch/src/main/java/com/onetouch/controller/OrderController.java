package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onetouch.dao.CartDao;
import com.onetouch.dao.OrderDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.service.OrderService;
import com.onetouch.vo.CartVo;
import com.onetouch.vo.MemVo;
import com.onetouch.vo.OrderVo;
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
	ProductDao product_dao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	OrderService order_service;
	
	//단건 구매
	@RequestMapping("/direct_form.do")
	public String order_direct_form(
				@RequestParam int product_idx,
				@RequestParam int product_cnt,
				Model model) {
		
			MemVo memVo =  
					(MemVo)session.getAttribute("user");
			
			if(memVo==null) {return "redirect:/user/login";}

	        ProductVo pVo = product_dao.selectOne(product_idx);
			int total_amount = pVo.getProduct_price() * product_cnt;
			
			//미리보기용 이름
			String order_name_pre = pVo.getProduct_name();
	        
	        //request binding
	        model.addAttribute("product", pVo);
	        model.addAttribute("total_amount",total_amount);	        
	        model.addAttribute("order_name",order_name_pre);
	        model.addAttribute("order_type", "direct");
	        	
		return "order/order_form";
	}
	
	//장바구니 구매
	@RequestMapping("/cart_form.do")
	public String order_cart_form(
				@RequestParam("cart_id") String[] cart_ids,
				Model model) {
			
			MemVo memVo =  
					(MemVo)session.getAttribute("user");
			
			if(memVo==null)	{return "redirect:/user/login";}
			
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

	//주문
	@RequestMapping("/order_insert.do")
	public String order(OrderVo vo,
				@RequestParam(name="order_type") String order_type,
		        @RequestParam(name="cart_id", required=false) String[] cart_ids,
		        @RequestParam(name="product_idx", required=false, defaultValue="0") int product_idx,
		        @RequestParam(name="product_cnt", required=false, defaultValue="0") int product_cnt,
		        RedirectAttributes ra
				) {
		
		MemVo memVo =  
				(MemVo)session.getAttribute("user");
		
		if(memVo==null)	{return "redirect:/user/login";}
		
		Integer mem_idx = memVo.getMem_idx();
        
        vo.setMem_idx(mem_idx);
        
        //form에서 온 정보 담기
        OrderVo resultVo;
        
        //단독구매 or 장바구니
        if("cart".equals(order_type)) {
        	resultVo = order_service.insert_cart_order(vo, cart_ids);
        } else {
        	resultVo = order_service.insert_order(vo, product_idx, product_cnt);
        }
        
        ra.addAttribute("order_id",resultVo.getOrder_id());
        
		return "redirect:/order/complete.do";
	}
	
}
