package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onetouch.service.OrderService;
import com.onetouch.vo.OrderVo;

@Controller
public class AdminOrderController {
	
	@Autowired
	private OrderService order_service;
	
	//관리자 주문 전체 조회
	@RequestMapping("/admin/order/list")
	public String orderList(Model model) {
		
		List<OrderVo> order_list = order_service.selectAllOrdersforAdmin();
		model.addAttribute("order_list", order_list);
		return "admin/order_list";
	}
	
	//검색
	@RequestMapping("/admin/order/search")
	public String searchOrders(@RequestParam(required=false) String search_keyword,
							@RequestParam(required=false) String order_status,
							Model model) {
		List<OrderVo> order_list = order_service.searchOrders(search_keyword, order_status);
		model.addAttribute("order_list",order_list);
		model.addAttribute("search_keyword",search_keyword);
		model.addAttribute("order_status",order_status);
		
		return "admin/order_list";
	}
	
	//송장 변경
	@RequestMapping("/admin/order/update_delivery")
	@ResponseBody
	public Map<String,Object> updateDeliveryInfo(@RequestParam int order_id,
								@RequestParam String order_tracking,
								@RequestParam String order_courier,
								@RequestParam String order_status) {
		Map<String,Object> map = new HashMap<>();
		
		try {
			int updateCount = order_service.updateDeliveryInfo(order_id, order_tracking, order_courier, order_status);
			if (updateCount>0) {
				map.put("result","success");
				map.put("message","배송 정보 업데이트에 성공했습니다.");
			} else {
				map.put("result","fail");
				map.put("message","배송 정보 업데이트에 실패했습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result","error");
			map.put("message","오류가 발생했습니다."+e.getMessage());
		}
		return map;
	}
	
	//주문상태 변경
	@RequestMapping("/admin/order/update_status")
	@ResponseBody
	public Map<String,Object> updateStatus(@RequestParam int order_id,
									@RequestParam String order_status){

		Map<String,Object> map = new HashMap<>();
		
		try {
			int updateCount = order_service.updateStatus(order_id, order_status);
			if (updateCount>0) {
				map.put("result","success");
				map.put("message","배송 정보 업데이트에 성공했습니다.");
			} else {
				map.put("result","fail");
				map.put("message","배송 정보 업데이트에 실패했습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result","error");
			map.put("message","오류가 발생했습니다."+e.getMessage());
		}
		
		return map;
	}
	
	//송장번호 수정
	@RequestMapping("/admin/order/management/update_tracking")
	@ResponseBody
	public Map<String, Object> updateTrackingNumber(
			@RequestParam int order_id,
			@RequestParam String order_tracking,
			@RequestParam String order_courier) {
		
		Map<String, Object> result = new HashMap<>();
		
		try {
			int updateCount = order_service.updateTracking(
				order_id, order_tracking, order_courier
			);
			
			if (updateCount > 0) {
				result.put("result", "success");
				result.put("message", "송장번호가 등록되었습니다.");
			} else {
				result.put("result", "fail");
				result.put("message", "송장번호 등록에 실패했습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "error");
			result.put("message", "오류가 발생했습니다: " + e.getMessage());
		}
		return result;
	}
}
