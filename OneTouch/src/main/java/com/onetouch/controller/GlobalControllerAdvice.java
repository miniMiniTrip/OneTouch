package com.onetouch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.onetouch.dao.CartDao;
import com.onetouch.dao.WishlistDao;
import com.onetouch.vo.MemVo;

import jakarta.servlet.http.HttpSession;

@ControllerAdvice	//컨트롤러 전역의 예외처리
public class GlobalControllerAdvice {

	@Autowired	
	CartDao cart_dao;
	
	@Autowired
	WishlistDao wishlist_dao;
	
	@Autowired
	HttpSession session;
	
	@ModelAttribute("cartCount")
	public int getCartCount() {
		MemVo memVo = (MemVo) session.getAttribute("user");
		if (memVo==null) return 0;
		try {
			return cart_dao.selectCartCount(memVo.getMem_idx());
		} catch (Exception e) {
			return 0;
		}
	}
	
	@ModelAttribute("wishlistCount")
	public int getWishlistCount() {
		MemVo memVo = (MemVo) session.getAttribute("user");
		if (memVo==null) return 0;
		try {
			return wishlist_dao.selectWishlistCount(memVo.getMem_idx());
		} catch(Exception e) {
			return 0;
		}
	}
	
}
