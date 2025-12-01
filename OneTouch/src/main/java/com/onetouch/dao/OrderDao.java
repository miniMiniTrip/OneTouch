package com.onetouch.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.OrderReviewVo;
import com.onetouch.vo.OrderVo;

//주문서 작성
@Mapper
public interface OrderDao {
	//단건주문
	int insert(OrderVo vo);
	
	//여러건 주문
	OrderVo insertOrder(OrderVo vo);
	
	//단건 주문 조회
	OrderVo selectOne(int order_id);
	
	//고객별 주문조회
	List<OrderVo> selectList(int mem_idx);
	
	//판매 상태(배송조회) 변경
	int updateStatus(int order_id, String order_status);
	
	//주문정보 변경
	int update(OrderVo vo);
	
	//주문번호로 검색
	OrderVo selectOneByOrderNo(String order_no);
	
	//아이디로 검색
	OrderVo selectOneByOrderId(int order_id);
	
	//주문상태 변경
	int updateDeliveryInfo(Map<String, Object> params);
	
	//송장 변경
	int updateTracking(Map<String, Object> params);
	
	//관리자 주문 조회
	List<OrderVo> selectAllOrdersforAdmin();
	
	//배송상태별 조회
	List<OrderVo> selectOrdersByStatus(String order_status);
	
	//검색
	List<OrderVo> searchOrders(Map<String, Object> params);
	
}	
