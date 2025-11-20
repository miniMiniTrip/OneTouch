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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onetouch.dao.CartDao;
import com.onetouch.dao.OrderDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.service.OrderService;
import com.onetouch.service.PaymentService;
import com.onetouch.vo.CartVo;
import com.onetouch.vo.MemVo;
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
	HttpSession session;
	
	@Autowired
	OrderService order_service;
	
	@Autowired
	PaymentService payment_service;

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
	
	//결제대기 (토스)
	@RequestMapping("create_ready.do")
	@ResponseBody
	public Map<String, Object> createOrderReady(
				HttpServletRequest request,
				@RequestParam Map<String, Object> params){
		Map<String, Object> result = new HashMap<>();
		
		try {	
			session = request.getSession();
			MemVo user = (MemVo) session.getAttribute("user");
			
			if(user==null) {
				result.put("success", false);
				result.put("message", "로그인이 필요합니다.");
				return result;
			}
			//파라미터값 받기
			OrderVo order = new OrderVo();
			order.setMem_idx(user.getMem_idx());
			order.setOrder_mem_name((String)params.get("order_mem_name"));
			order.setOrder_phone((String)params.get("order_phone"));		
			order.setOrder_postal((String)params.get("order_postal"));
			order.setOrder_address((String)params.get("order_address"));
			order.setOrder_address_more((String)params.get("order_address_more"));
			
			int totalAmount = 0;
			String orderName = "";
			String orderType = (String)params.get("order_type");
			
			//단건
			if("direct".equals(orderType)) {
				int product_idx = Integer.parseInt((String)params.get("product_idx"));
				int product_cnt = Integer.parseInt((String)params.get("product_cnt"));
				
				ProductVo vo = product_dao.selectOne(product_idx);
				totalAmount = vo.getProduct_price() * product_cnt;
				orderName = vo.getProduct_name();
				
				session.setAttribute("orderType", "direct");
				session.setAttribute("product_idx", product_idx);
				session.setAttribute("product_cnt", product_cnt);
				
			} else if ("cart".equals(orderType)){
				//장바구니
				String[] cart_id_array = request.getParameterValues("cart_id");
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("cart_id_array", cart_id_array);
				List<CartVo> cartList = cart_dao.selectPaymentList(map);
				totalAmount = cart_dao.selectPaymentTotalAmount(map);
				
				orderName = cartList.get(0).getProduct_name();
				if(cartList.size() > 1) {
					orderName += "외" + (cartList.size() - 1) + "건";  
				}
				
				session.setAttribute("orderType", "cart");
				session.setAttribute("cart_ids", cart_id_array);
			}
			
			order.setTotal_amount(totalAmount);
			order.setOrder_name(orderName);
			order.setOrder_no("OT" + System.currentTimeMillis());
			
			String payment_key = "OTPAY" + System.currentTimeMillis();
			PaymentVo payment = new PaymentVo();
			payment.setPayment_key(payment_key);
			payment.setOrder_id(order.getOrder_id());
			payment.setAmount(totalAmount); //
			payment.setMethod("카드");
			
			//결제대기로 내용 전송
			payment_service.createPaymentReady(payment);
			
			session.setAttribute("order_id", order.getOrder_id());
			
			//결제 성공
			result.put("success", true);
			result.put("payment_key", payment_key);
			result.put("order_name", orderName);
			result.put("amount", totalAmount);
		
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("message", "오류" + e.getMessage());
		}	
		return result;
	}
}
