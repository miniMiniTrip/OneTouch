package com.onetouch.controller;

import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.onetouch.service.OrderService;
import com.onetouch.service.PaymentService;
import com.onetouch.vo.PaymentVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {
	
    @Value("${toss.secret.key}")
    private String tossSecretKey;
    
    @Value("${toss.api.url}")
    private String tossApiUrl;
    
    @Autowired
    PaymentService payment_service;
    
    @Autowired
    OrderService order_service;
     
    //토스페이먼트 승인 호출
    private Map<String, Object> confirmPayment(String paymentKey, String orderId, int amount) throws Exception{
    	
    	RestTemplate rest_template = new RestTemplate();
    	
    	String encodedAuth = Base64.getEncoder().encodeToString((tossSecretKey+":").getBytes(StandardCharsets.UTF_8));
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.set("Autorization", "Basic "+ encodedAuth);
    	headers.set("Content-Type", "application/json");
    	
    	Map<String, Object> body = new HashMap<>();
    	body.put("paymentKey", paymentKey);
    	body.put("orderId", orderId);
    	body.put("amount", amount);
    	HttpEntity<Map<String,Object>> request = new HttpEntity<>(body, headers);
    	
    	String confirmUrl = tossApiUrl + "/confirm";
    	ResponseEntity<Map> response = rest_template.exchange(
    			confirmUrl,
    			HttpMethod.POST,
    			request,
    			Map.class
    			);
    	return response.getBody();
    }
    
    
	@RequestMapping("/payment/success.do")
	public String paymentSuccess (
				@RequestParam String paymentKey,
				@RequestParam String orderId,
				@RequestParam int amount,
				HttpSession session,
				Model model
				) {
			
			try {
				//결제정보
				Map<String, Object> confirmResult = confirmPayment(paymentKey, orderId, amount);
				PaymentVo payment_vo = new PaymentVo();
				payment_vo.setPayment_key(paymentKey);
				payment_vo.setApproved_at(new Timestamp(System.currentTimeMillis()));
				
				//영수증 받으면
				if(confirmResult.get("receipt") != null){
					@SuppressWarnings("unchecked")
					Map<String, String> receipt = (Map<String, String>)confirmResult.get("receipt");
					payment_vo.setReceipt_url(receipt.get("url"));
				}
				
				if(confirmResult.get("method") != null) {
					payment_vo.setMethod(confirmResult.get("method").toString());
				}
				
				payment_service.approvePayment(payment_vo);
				

				Integer order_id = (Integer)session.getAttribute("order_id");
				String order_type = (String)session.getAttribute("order_type");
				
				//단건
				if("direct".equals(order_type)) {
					int product_idx = Integer.parseInt((String)session.getAttribute("product_idx"));
					int product_cnt = Integer.parseInt((String)session.getAttribute("product_cnt"));
					order_service.insertOrderToss(order_id, product_idx, product_cnt);
					
				} else if ("cart".equals(order_type)){
					String[] cart_ids = (String[])session.getAttribute("cart_ids");
					order_service.insertOrderCartByToss(order_id, cart_ids);
				}
				
				session.removeAttribute("order_type");
				session.removeAttribute("product_idx");
				session.removeAttribute("product_cnt");
				session.removeAttribute("cart_ids");
				session.removeAttribute("order_id");
				
				//주문 페이지
				return "redirect:/order/complete.do?order_id=" + orderId;
				
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("error", "결제 승인 중 오류가 발생했습니다." + e.getMessage());
				return "order/order_fail";
			}
	}//end.success
	
	@RequestMapping("/order/fail.do")
	public String paymentFail(
				@RequestParam String code,
	            @RequestParam String message,
	            @RequestParam String orderId,
	            Model model) {
		
		try {
			PaymentVo payment_vo = new PaymentVo();
			payment_vo = payment_service.getPaymentByKey(orderId);
			if(payment_vo != null) {
				payment_vo.setFailed_reason(code + ": " + message);
				payment_service.failPayment(payment_vo);
			}
			
			model.addAttribute("errorCode",code);
			model.addAttribute("errorMessage",message);
			
			return "order/order_fail";
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("error", "결제 실패 처리 중 오류가 발생했습니다.");
			return "order/order_fail";
		}
	}//end.fail
}
