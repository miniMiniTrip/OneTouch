package com.onetouch.dao;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.OrderVo;

//주문서 작성
@Mapper
public interface OrderDao {
	OrderVo insertOrder(OrderVo vo);
}
