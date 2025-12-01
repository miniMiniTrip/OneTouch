package com.onetouch.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onetouch.dao.CartDao;
import com.onetouch.dao.OrderDao;
import com.onetouch.dao.OrderItemDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.vo.CartVo;
import com.onetouch.vo.OrderItemVo;
import com.onetouch.vo.OrderReviewVo;
import com.onetouch.vo.OrderVo;
import com.onetouch.vo.ProductVo;

@Service
public class OrderService {
	
	@Autowired
	CartDao cart_dao;
	
	@Autowired
	OrderDao order_dao;
	
	@Autowired
	OrderItemDao order_item_dao;
	
	@Autowired
	ProductDao product_dao;
	
	//상품생성
	@Transactional
	public int insert(OrderVo vo) {
		if(vo.getOrder_status() == null || vo.getOrder_status().isEmpty()) {
			vo.setOrder_status("결제취소");
		}
		
		if(vo.getOrder_name() == null || vo.getOrder_name().isEmpty()) {
			vo.setOrder_name("주문");
		}
		
		if(vo.getTotal_amount() == 0) {
			vo.setTotal_amount(0);
		}
		
	    return order_dao.insert(vo);
	}
	
	//단건
	@Transactional
	public OrderVo insert_order(OrderVo vo, int product_idx, int product_cnt) {
		
		ProductVo pVo = product_dao.selectOne(product_idx);
		
		//상품이 없는 경우
		if(pVo==null) {
			throw new RuntimeException("product : not exist");
		}
		
		int total_amount = pVo.getProduct_price() * product_cnt;
		vo.setTotal_amount(total_amount);
		vo.setOrder_name(pVo.getProduct_name());
		vo.setOrder_no("OT" + System.currentTimeMillis());//OT+시간 = 주문번호
		
		order_dao.insert(vo);
		
		OrderItemVo itemVo = new OrderItemVo();
		itemVo.setOrder_id(vo.getOrder_id());
		itemVo.setProduct_idx(product_idx);
		itemVo.setProduct_name(pVo.getProduct_name());
		itemVo.setProduct_cnt(product_cnt);
        itemVo.setProduct_amount(pVo.getProduct_price());
		itemVo.setTotal_amount(total_amount);
		
		order_item_dao.insert(itemVo);
		
		return vo;
	}
	
	
	//장바구니
	@Transactional
	public OrderVo insert_cart_order(OrderVo vo,
								 String[] cart_ids
								){
		Map<String, Object> map = new HashMap<String, Object>();
		//String으로 받은 값을 map에서 병합
		map.put("cart_id_array", cart_ids);
		List<CartVo> cart_list = cart_dao.selectPaymentList(map);
	
		if(cart_list==null||cart_list.isEmpty()) {
			throw new RuntimeException("cart: empty");
		}
		
		int total_amount = cart_dao.selectPaymentTotalAmount(map);
		vo.setTotal_amount(total_amount);
		
		//주문내역에 쓸 이름 생성
		String order_name = cart_list.get(0).getProduct_name();
        if (cart_list.size() > 1) {
            order_name += " 외 " + (cart_list.size() - 1) + "건";
        }	
        vo.setOrder_name(order_name);
        vo.setOrder_no("OT" + System.currentTimeMillis());
        
		order_dao.insert(vo);
		
		List<OrderItemVo> order_list = new ArrayList<>();
		
		for(CartVo cVo : cart_list) { //장바구니 수만큼 반복
			OrderItemVo itemVo = new OrderItemVo();
			itemVo.setOrder_id(vo.getOrder_id());
			itemVo.setProduct_idx(cVo.getProduct_idx());
			itemVo.setProduct_name(cVo.getProduct_name());
			itemVo.setProduct_cnt(cVo.getCart_cnt());
			itemVo.setProduct_amount(cVo.getProduct_price());
			itemVo.setTotal_amount(cVo.getTotal_amount());
			order_list.add(itemVo);
		}
		
		//order_list에 다 넣기
		order_item_dao.insertProducts(order_list);
		
		//다 했으면 삭제
		cart_dao.deletePaymentComplete(map);
		
		return vo;
	}
	
	@Transactional
	public void insertOrderToss(int order_id, int product_idx, int product_cnt) {
		
		ProductVo pVo = product_dao.selectOne(product_idx);
		if(pVo==null) {
			throw new RuntimeException("product : not exist");
		}
		
		OrderItemVo itemVo = new OrderItemVo();
		itemVo.setOrder_id(order_id);
		itemVo.setProduct_idx(product_idx);
		itemVo.setProduct_name(pVo.getProduct_name());
		itemVo.setProduct_cnt(product_cnt);
        itemVo.setProduct_amount(pVo.getProduct_price());
		itemVo.setTotal_amount(pVo.getProduct_price() * product_cnt);
		
		order_item_dao.insert(itemVo);
		order_dao.updateStatus(order_id, "결제완료");
	}//end orderToss
	
	public void insertOrderCartByToss(int order_id, String[] cart_ids) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		//String으로 받은 값을 map에서 병합
		map.put("cart_id_array", cart_ids);
		List<CartVo> cart_list = cart_dao.selectPaymentList(map);
	
		if(cart_list==null||cart_list.isEmpty()) {
			throw new RuntimeException("cart: empty");
		}
		
		List<OrderItemVo> order_list = new ArrayList<>();
		
		for(CartVo cVo : cart_list) { //장바구니 수만큼 반복
			OrderItemVo itemVo = new OrderItemVo();
			itemVo.setOrder_id(order_id);
			itemVo.setProduct_idx(cVo.getProduct_idx());
			itemVo.setProduct_name(cVo.getProduct_name());
			itemVo.setProduct_cnt(cVo.getCart_cnt());
			itemVo.setProduct_amount(cVo.getProduct_price());
			itemVo.setTotal_amount(cVo.getTotal_amount());
			order_list.add(itemVo);
		}
		
		order_item_dao.insertProducts(order_list);
		cart_dao.deletePaymentComplete(map);
		order_dao.updateStatus(order_id, "결제완료");
	}//end ordercartToss
	
	//=============관리자용 메서드===============
	
	//배송정보 업데이트
	@Transactional
	public int updateDeliveryInfo(int order_id, String order_tracking,
								 String order_courier, String order_status) {
		Map<String,Object> map = new HashMap<>();
		map.put("order_id", order_id);
		map.put("order_tracking", order_tracking);
		map.put("order_courier", order_courier);
		map.put("order_status", order_status);
		
		return order_dao.updateDeliveryInfo(map);
	}
	
	//송장 변경
	@Transactional
	public int updateTracking(int order_id, String order_tracking,
								 String order_courier) {
		Map<String,Object> map = new HashMap<>();
		map.put("order_id", order_id);
		map.put("order_tracking", order_tracking);
		map.put("order_courier", order_courier);
		
		return order_dao.updateTracking(map);
	}
	
	//관리자 주문 조회
	public List<OrderVo> selectAllOrdersforAdmin(){
		return order_dao.selectAllOrdersforAdmin();
	}
	
	//배송상태별 주문 조회
	public List<OrderVo> selectOrdersByStatus(String order_status){
		return order_dao.selectOrdersByStatus(order_status);
	}
	
	//검색
	public List<OrderVo> searchOrders(String search_keyword,
										String order_status){
		Map<String,Object> map = new HashMap<>();
		map.put("search_keyword", search_keyword);
		map.put("order_status", order_status);
		
		return order_dao.searchOrders(map);
	}
	
	//재결제를 위한 order

	public OrderVo selectOneByOrderId(int order_id) {
	    return order_dao.selectOneByOrderId(order_id);
	}
	
	//주문상태만 변경
	public int updateStatus(int order_id, String order_status){
		return order_dao.updateStatus(order_id,order_status);
	}

	public List<OrderVo> selectList(int mem_idx) {
		return order_dao.selectList(mem_idx);
	}


}
