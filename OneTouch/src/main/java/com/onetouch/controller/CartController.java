package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onetouch.dao.CartDao;
import com.onetouch.vo.CartVo;

public class CartController {
	
	@Autowired
	CartDao cart_dao;
	
	@RequestMapping("/cart/list.do")
	public String list(int mem_idx, Model model) {
		
		List<CartVo> cart_list = cart_dao.selectList(mem_idx);
		int total_amount = cart_dao.selectCartTotalAmount(mem_idx);
		model.addAttribute("cart_list",cart_list);
		model.addAttribute("total_amount",total_amount);
		
		return "/cart/list";
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
	public Map <String,String> insert(CartVo vo){
		
		CartVo orderMap = cart_dao.selectPaymentList(vo);
		Map<String, String> map = new HashMap<String, String>();
		
		return map;
	}
}
