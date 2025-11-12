package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.onetouch.dao.CartDao;
import com.onetouch.dao.OrderDao;
import com.onetouch.vo.CartVo;
import com.onetouch.vo.OrderVo;

@Controller
public class OrderController {

	@Autowired
	CartDao cart_dao;
	
	@Autowired
	OrderDao order_dao;
	
	public String insert_order(OrderVo vo, int[] cart_ids) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("cart_id_array", cart_ids); //상품
		List<CartVo> carts = cart_dao.selectPaymentList(map);
		if(carts==null || carts.isEmpty()==true) {
			//장바구니가 비었을 경우
		}
		int payment_total_amount = cart_dao.selectPaymentTotalAmount(map); //총합
		
		return "";
	}
}
