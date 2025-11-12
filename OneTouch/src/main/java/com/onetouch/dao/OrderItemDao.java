package com.onetouch.dao;

import java.util.List;

import com.onetouch.vo.OrderItemVo;

public interface OrderItemDao {
	int insert(OrderItemVo vo);
	int insertProduct(List<OrderItemVo> list);
	List<OrderItemVo> selectListByOrderId(int order_id);
	OrderItemVo selectOne(int order_item_id);
}
