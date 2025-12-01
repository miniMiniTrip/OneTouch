package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onetouch.dao.CartDao;
import com.onetouch.dao.OrderDao;
import com.onetouch.dao.OrderItemDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.service.OrderService;
import com.onetouch.service.PaymentService;
import com.onetouch.vo.CartVo;
import com.onetouch.vo.MemVo;
import com.onetouch.vo.OrderItemVo;
import com.onetouch.vo.OrderReviewVo;
import com.onetouch.vo.OrderVo;
import com.onetouch.vo.PaymentVo;
import com.onetouch.vo.ProductVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
	
	@Autowired
	CartDao cart_dao;
	
	@Autowired
	OrderDao order_dao;
	
	@Autowired
	ProductDao product_dao;
	
	@Autowired
	OrderItemDao order_item_dao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	OrderService order_service;
	
	@Autowired
	PaymentService payment_service;
	
	@Value("${toss.client.key}")
	private String tossClientKey;  // 클래스 상단에 추가

	
	//단건 구매(무통장 입금)
	@RequestMapping("/order/direct_form.do")
	public String order_direct_form(
				@RequestParam int product_idx,
				@RequestParam int product_cnt,
				Model model) {
		
			MemVo memVo =  
					(MemVo)session.getAttribute("user");
			
			if(memVo==null) {return "redirect:/user/login";}

	        ProductVo pVo = product_dao.selectOne(product_idx);
			int total_amount = pVo.getProduct_price() * product_cnt;
			
			//미리보기용 이름
			String order_name_pre = pVo.getProduct_name();
	        
	        //request binding
	        model.addAttribute("product", pVo);
	        model.addAttribute("total_amount",total_amount);	        
	        model.addAttribute("order_name",order_name_pre);
	        model.addAttribute("order_type", "direct");
	        	
		return "order/order_form";
	}
	
	//장바구니 구매(무통장 입금)
	@RequestMapping("/order/cart_form.do")
	public String order_cart_form(
				@RequestParam("cart_id") String[] cart_ids,
				Model model) {
			
			MemVo memVo =  
					(MemVo)session.getAttribute("user");
			
			if(memVo==null)	{return "redirect:/user/login";}
			
			//선택한 상품 찾기
			Map<String, Object> map = new HashMap<>();
			map.put("cart_id_array", cart_ids);
			
			List<CartVo> cart_list = cart_dao.selectPaymentList(map);
			int total_amount = cart_dao.selectPaymentTotalAmount(map);
			
			//미리보기용 이름
			String order_name_pre = cart_list.get(0).getProduct_name();
	        if (cart_list.size() > 1) {
	            order_name_pre += " 외 " + (cart_list.size() - 1) + "건";
	        }
	        
	        //request binding
	        model.addAttribute("cart_list",cart_list);
	        model.addAttribute("total_amount",total_amount);	        
	        model.addAttribute("order_name",order_name_pre);
	        model.addAttribute("cart_ids",cart_ids);
	        model.addAttribute("order_type", "cart");
	        	
		return "order/order_form";
	}

	//주문
	@RequestMapping("/order/order_insert.do")
	public String order(OrderVo vo,
				@RequestParam(name="order_type") String order_type,
		        @RequestParam(name="cart_id", required=false) String[] cart_ids,
		        @RequestParam(name="product_idx", required=false, defaultValue="0") int product_idx,
		        @RequestParam(name="product_cnt", required=false, defaultValue="0") int product_cnt,
		        RedirectAttributes ra
				) {
		
		MemVo memVo =  
				(MemVo)session.getAttribute("user");
		
		if(memVo==null)	{return "redirect:/user/login";}
		
		Integer mem_idx = memVo.getMem_idx();
        
        vo.setMem_idx(mem_idx);
        
        //form에서 온 정보 담기
        OrderVo resultVo;
        
        //단독구매 or 장바구니
        if("cart".equals(order_type)) {
        	resultVo = order_service.insert_cart_order(vo, cart_ids);
        } else {
        	resultVo = order_service.insert_order(vo, product_idx, product_cnt);
        }
        
        ra.addAttribute("order_id",resultVo.getOrder_id());
        
		return "redirect:/order/complete.do";
	}
	
	@RequestMapping("/order/create_ready.do")
	@ResponseBody
	public Map<String, Object> createOrderReady(
	            HttpServletRequest request,
	            @RequestParam Map<String, Object> params) {
	    
	    Map<String, Object> result = new HashMap<>();
	    System.out.println("진입");
	    
	    try {	
	        session = request.getSession();
	        MemVo user = (MemVo) session.getAttribute("user");
	        
	        if(user == null) {
	            result.put("success", false);
	            result.put("message", "로그인이 필요합니다.");
	            return result;
	        }
	        
	        String orderType = (String)params.get("order_type");
	        int totalAmount = 0;
	        String orderName = "";
	        OrderVo order = null;
	        
	        if("repay".equals(orderType)) {
	            int order_id = Integer.parseInt((String)params.get("order_id"));
	            
	            // 기존 주문 조회
	            order = order_dao.selectOneByOrderId(order_id);
	            
	            // 권한 체크
	            if(order == null || order.getMem_idx() != user.getMem_idx()) {
	                result.put("success", false);
	                result.put("message", "잘못된 접근입니다.");
	                return result;
	            }
	            
	            // 결제실패/결제취소 상태만 재결제 가능
	            if(!"결제실패".equals(order.getOrder_status()) && 
	               !"결제취소".equals(order.getOrder_status())) {
	                result.put("success", false);
	                result.put("message", "결제 실패 또는 취소된 주문만 재결제할 수 있습니다.");
	                return result;
	            }
	            
	            // 주문 정보 업데이트 (주문자, 배송지 정보만)
	            order.setOrder_mem_name((String)params.get("order_mem_name"));
	            order.setOrder_phone((String)params.get("order_phone"));
	            order.setOrder_postal((String)params.get("order_postal"));
	            order.setOrder_address((String)params.get("order_address"));
	            order.setOrder_address_more((String)params.get("order_address_more"));
	            
	            // 기존 주문 정보 유지
	            totalAmount = order.getTotal_amount();
	            orderName = order.getOrder_name();
	            
	            // 주문 정보 업데이트 (DB)
	            order_dao.update(order);
	            
	            session.setAttribute("orderType", "retry");
	            session.setAttribute("order_id", order_id);
	            
	        } else {
	            // 신규 주문 생성
	            order = new OrderVo();
	            order.setMem_idx(user.getMem_idx());
	            order.setOrder_mem_name((String)params.get("order_mem_name"));
	            order.setOrder_phone((String)params.get("order_phone"));		
	            order.setOrder_postal((String)params.get("order_postal"));
	            order.setOrder_address((String)params.get("order_address"));
	            order.setOrder_address_more((String)params.get("order_address_more"));
	            
	            // 단건
	            if("direct".equals(orderType)) {
	                int product_idx = Integer.parseInt((String)params.get("product_idx"));
	                int product_cnt = Integer.parseInt((String)params.get("product_cnt"));
	                
	                ProductVo vo = product_dao.selectOne(product_idx);
	                totalAmount = vo.getProduct_price() * product_cnt;
	                orderName = vo.getProduct_name();
	                
	                //order에 값 설정 (insert 전에 설정)
	                order.setTotal_amount(totalAmount);
	                order.setOrder_name(orderName);
	                order.setOrder_no("OT" + System.currentTimeMillis());
	                // order_status는 OrderService.insert()에서 "결제취소"로 자동 설정됨
	                
	                session.setAttribute("orderType", "direct");
	                session.setAttribute("product_idx", product_idx);
	                session.setAttribute("product_cnt", product_cnt);
	                
            } else if("cart".equals(orderType)) {
                // 장바구니
                String[] cart_id_array = null;
                
                //cart_ids 다양한 형식 처리
                Object cart_ids_obj = params.get("cart_ids");
                
                if(cart_ids_obj == null) {
                    // cart_ids가 없으면 cart_id로 시도
                    cart_ids_obj = params.get("cart_id");
                }
                
                if(cart_ids_obj == null) {
                    result.put("success", false);
                    result.put("message", "장바구니 정보가 없습니다.");
                    return result;
                }
                
                // String으로 전달된 경우 (예: "1,2,3" 또는 "1")
                if(cart_ids_obj instanceof String) {
                    String cart_ids = (String)cart_ids_obj;
                    cart_id_array = cart_ids.split(",");
                } 
                // 배열로 전달된 경우
                else if(cart_ids_obj instanceof String[]) {
                    cart_id_array = (String[])cart_ids_obj;
                }
                // 기타 형식
                else {
                    result.put("success", false);
                    result.put("message", "장바구니 데이터 형식이 올바르지 않습니다.");
                    return result;
                }
                
                System.out.println("cart_id_array: " + String.join(",", cart_id_array));
                
                Map<String, Object> map = new HashMap<>();
                map.put("cart_id_array", cart_id_array);
	                
	                List<CartVo> cart_list = cart_dao.selectPaymentList(map);
	                if(cart_list == null || cart_list.isEmpty()) {
	                    result.put("success", false);
	                    result.put("message", "장바구니가 비어있습니다.");
	                    return result;
	                }
	                
	                totalAmount = cart_dao.selectPaymentTotalAmount(map);
	                
	                orderName = cart_list.get(0).getProduct_name();
	                if (cart_list.size() > 1) {
	                    orderName += " 외 " + (cart_list.size() - 1) + "건";
	                }
	                
	                //order에 값 설정 (insert 전에 설정)
	                order.setTotal_amount(totalAmount);
	                order.setOrder_name(orderName);
	                order.setOrder_no("OT" + System.currentTimeMillis());
	                // order_status는 OrderService.insert()에서 "결제취소"로 자동 설정됨
	                
	                session.setAttribute("orderType", "cart");
	                session.setAttribute("cart_ids", cart_id_array);
	            }
	            
	            //order insert (이제 모든 필드가 설정된 상태)
	            order_service.insert(order);
	            session.setAttribute("order_id", order.getOrder_id());
	        }
	        
        // Payment 생성 또는 업데이트
        String payment_key = "OT_" + System.currentTimeMillis();
        
        //항상 기존 payment가 있는지 먼저 확인
        PaymentVo existingPayment = payment_service.getPaymentByOrderId(order.getOrder_id());
        
        if(existingPayment != null) {
            //기존 payment가 있으면 업데이트
            existingPayment.setPayment_key(payment_key);
            existingPayment.setAmount(totalAmount);
            existingPayment.setStatus("READY");
            existingPayment.setFailed_reason(null);
            payment_service.updatePaymentForRetry(existingPayment);
            System.out.println("payment 업데이트 완료 (order_id: " + order.getOrder_id() + ")");
        } else {
            //기존 payment가 없으면 신규 생성
            PaymentVo payment = new PaymentVo();
            payment.setOrder_id(order.getOrder_id());
            payment.setPayment_key(payment_key);
            payment.setAmount(totalAmount);
            payment.setStatus("READY");
            
            payment_service.createPaymentReady(payment);
            System.out.println("payment 생성 완료 (order_id: " + order.getOrder_id() + ")");
        }
	        
	        
	        result.put("success", true);
	        result.put("payment_key", payment_key);
	        result.put("order_name", orderName);
	        result.put("amount", totalAmount);
	        System.out.println(result);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("success", false);
	        result.put("message", "오류: " + e.getMessage());
	    }	
	    
	    return result;
	}

	
	@RequestMapping("/order/complete.do")
	public String orderComplete(@RequestParam int order_id, Model model) {
	    
	    // order 조회
	    OrderVo order = order_dao.selectOneByOrderId(order_id);
	    
	    // order_item 조회
	    List<OrderItemVo> order_items = order_item_dao.selectListByOrderId(order_id);
	    
	    // payment 조회 (영수증 URL 등)
	    PaymentVo payment = payment_service.getPaymentByOrderId(order_id);
	    
	    model.addAttribute("order", order);
	    model.addAttribute("order_items", order_items);
	    model.addAttribute("payment", payment);
	    
	    return "order/order_complete";
	}
	
	@RequestMapping("/order/list.do")
	public String orderList(Model model) {
		
		MemVo memVo =  
				(MemVo)session.getAttribute("user");
		
		if(memVo==null) {return "redirect:/user/login";}
		
		int mem_idx = memVo.getMem_idx();
			
		List<OrderVo> order_list = order_service.selectList(mem_idx);
		
		// 각 주문의 order_items 조회 (리뷰 작성용)
		for(OrderVo order : order_list) {
			List<OrderItemVo> items = order_item_dao.selectListByOrderId(order.getOrder_id());
			order.setOrder_items(items);
		}
		
		model.addAttribute("order_list",order_list);
		
		return "order/order_list";
	}
	
	@RequestMapping("/order/detail.do")
	public String orderDetail(@RequestParam int order_id, Model model) {
		
		MemVo memVo =  
				(MemVo)session.getAttribute("user");
		
		if(memVo==null) {return "redirect:/user/login";}
		
		OrderVo order = order_dao.selectOneByOrderId(order_id);
		
		if(order == null || order.getMem_idx() != memVo.getMem_idx()) {
			return "redirect:/order/list.do";
		}
		
		List<OrderItemVo> order_items = order_item_dao.selectListByOrderId(order_id);
		
		PaymentVo payment = payment_service.getPaymentByOrderId(order_id);
		
		model.addAttribute("order", order);
		model.addAttribute("order_items", order_items);
		model.addAttribute("payment", payment);
		
		return "order/order_detail";
	}
	
	@RequestMapping("/order/retry_payment.do")
	public String retryPayment(
	        @RequestParam int order_id,
	        HttpSession session,
	        Model model) {
	    
	    try {
	        // 로그인 체크
	        MemVo memVo = (MemVo) session.getAttribute("user");
	        if (memVo == null) {
	            return "redirect:/user/login";
	        }
	        
	        // 주문 정보 조회
	        OrderVo order_vo = order_service.selectOneByOrderId(order_id);
	        
	        // 주문 검증
	        if (order_vo == null || order_vo.getMem_idx() != memVo.getMem_idx()) {
	            model.addAttribute("error", "잘못된 접근입니다.");
	            return "order/order_fail";
	        }
	        
	        // 재결제 가능한 상태인지 확인
	        if (!"결제실패".equals(order_vo.getOrder_status()) && 
	            !"결제취소".equals(order_vo.getOrder_status())) {
	            model.addAttribute("error", "재결제가 불가능한 주문입니다.");
	            return "order/order_fail";
	        }
	        
	        // 주문 아이템 정보 조회
	        List<OrderItemVo> order_items = order_item_dao.selectListByOrderId(order_id);
	        
	        // 기존 결제 정보 조회
	        PaymentVo payment_vo = payment_service.getPaymentByOrderId(order_id);
	        
	        // 새로운 payment_key 생성하여 기존 레코드 업데이트
	        String new_payment_key = "OT_RETRY_" + System.currentTimeMillis();
	        payment_vo.setPayment_key(new_payment_key);
	        payment_vo.setStatus("READY");
	        payment_vo.setFailed_reason(null);  // 실패 사유 초기화
	        
	        // 기존 payment 업데이트 (새로 생성하지 않음)
	        payment_service.updatePaymentForRetry(payment_vo);
	        
	        // 세션에 재결제 정보 저장
	        session.setAttribute("order_id", order_id);
	        session.setAttribute("orderType", "retry");
	        
	        // 모델에 데이터 전달
	        model.addAttribute("order", order_vo);
	        model.addAttribute("order_items", order_items);
	        model.addAttribute("payment_key", new_payment_key);
	        model.addAttribute("tossClientKey", tossClientKey);
	        
	        // 재결제 전용 페이지로 이동
	        return "order/order_retry_payment";
	        
	    } catch (Exception e) {
	        System.err.println("=== 재결제 준비 중 오류 발생 ===");
	        e.printStackTrace();
	        model.addAttribute("error", "재결제 준비 중 오류가 발생했습니다: " + e.getMessage());
	        return "order/order_fail";
	    }
	}

	
	//환불
	@RequestMapping("/order/refund.do")
	public String refund(int order_id,
			RedirectAttributes ra) {
		
        // 로그인 체크
        MemVo login_user = (MemVo) session.getAttribute("login_user");
        if (login_user == null) {
            return "redirect:/member/login_form.do";
        }
        
		Integer mem_idx = login_user.getMem_idx();
		
		//주문 찾기
		OrderVo order = order_dao.selectOneByOrderId(order_id);
		
		if(order == null || order.getMem_idx() != mem_idx) {
			ra.addFlashAttribute("message", "잘못된 접근입니다.");
			return "redirect:/order/list.do";
		}
		
		String current_status = order.getOrder_status();
		if(!"상품확인중".equals(current_status)&&
		   !"배송확인중".equals(current_status)){
			ra.addFlashAttribute("message","상품확인중 혹은 배송준비중 상태에서만 환불 가능합니다.");
			return "redirect:/order/detail.do?order_id=" + order_id;
		}
		
		int res = order_service.updateStatus(order_id, "환불");
		
		if( res > 0 ) {
			ra.addFlashAttribute("message","환불 요청이 성공했습니다. 관리자 확인 후 처리됩니다.");			
		} else {
			ra.addFlashAttribute("message","환불 요청이 실패했습니다. 관리자에게 문의하세요.");
		}
		return "redirect:/order/list.do";
	}
	
	//취소
	@RequestMapping("/order/cancel.do")
	public String cancel(int order_id,
			RedirectAttributes ra) {
		
		MemVo memVo =  
				(MemVo)session.getAttribute("user");
		if(memVo==null) {return "redirect:/user/login";}
		
		Integer mem_idx = memVo.getMem_idx();
		
		OrderVo order = order_dao.selectOneByOrderId(order_id);
		
		if(order == null || order.getMem_idx() != mem_idx) {
			ra.addFlashAttribute("message", "잘못된 접근입니다.");
			return "redirect:/order/list.do";
		}
		
		String current_status = order.getOrder_status();
		//결제대기 대신 결제취소/결제실패 상태에서만 취소 가능
		if(!"결제취소".equals(current_status) && !"결제실패".equals(current_status)) {
			ra.addFlashAttribute("message","결제취소 또는 결제실패 상태에서만 취소 가능합니다.");
			return "redirect:/order/detail.do?order_id=" + order_id;
		}
		
		int res = order_service.updateStatus(order_id, "취소");
		
		if( res > 0 ) {
			ra.addFlashAttribute("message","주문이 취소되었습니다.");			
		} else {
			ra.addFlashAttribute("message","주문 취소에 실패했습니다.");
		}
		return "redirect:/order/list.do";
	}
}
