package com.onetouch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.OrderItemVo;

@Mapper
public interface OrderItemDao {
	int insert(OrderItemVo vo);
	int insertProducts(List<OrderItemVo> list);
	List<OrderItemVo> selectListByOrderId(int order_id);
	OrderItemVo selectOne(int order_item_id);
}
