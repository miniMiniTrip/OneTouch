package com.onetouch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.WishlistVo;

@Mapper
public interface WishlistDao {
	
	//찜 목록 조회
	List<WishlistVo> selectList(int mem_idx);
	
	//중복검사
	WishlistVo selectWishlistByIdProduct(WishlistVo vo);
	
	int insert(WishlistVo vo);
	int delete(int wishlist_idx);
	
	//찜 개수 (토글)
	int plusWishlistCount(int wishlist_idx);
	int minusWishlistCount(int wishlist_idx);
	
}
