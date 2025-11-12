package com.onetouch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.OrderVo;

//주문서 작성
@Mapper
public interface OrderDao {
	int insert(OrderVo vo);
	OrderVo insertOrder(OrderVo vo);
	List<OrderVo> selectList(int mem_idx);
	int updateStatus(int order_id, String order_status);
	int update(OrderVo vo);
	OrderVo selectOneByOrderNo(String order_no);
}
