package com.onetouch.dao;

import com.onetouch.vo.OrderItemVo;

public interface OrderItemDao {
	//결제내역 작성
	OrderItemVo insertOrderItem(OrderItemVo vo);
}
