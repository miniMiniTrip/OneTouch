package com.onetouch.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.CartVo;

@Mapper
public interface CartDao {
	
	//장바구니 상품 조회
	List<CartVo> selectList();
	int selectCartTotalAmount();
	//선택한 상품 조회
	List<CartVo> selectPaymentList(Map<String, Object> map);
	int selectPaymentTotalAmount(CartVo vo);
	
	int insert(CartVo vo);
	int update(CartVo vo);
	int delete(int c_idx);
	//결제시 삭제
	int deletePaymentComplete(Map<String, Object> map);

}
