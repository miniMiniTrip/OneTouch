package com.onetouch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onetouch.dao.WishlistDao;
import com.onetouch.vo.WishlistVo;

/*@Service*/
public class WishlistService {
	
	@Autowired
	WishlistDao wishlist_dao;
	
	@Transactional
	public int addWishList(WishlistVo vo) {
		int res = wishlist_dao.insert(vo);
		
		if(res==1) {
			wishlist_dao.plusWishlistCount(res);
		}
		
		return res;
	}
	
}
