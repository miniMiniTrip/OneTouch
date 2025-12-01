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

import com.onetouch.dao.CartDao;
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
    
    @Autowired
    CartDao cart_dao;
     
    //TossPayments 승인 API 호출
    private Map<String, Object> confirmPayment(String paymentKey, String orderId, int amount) throws Exception {
    	
    	RestTemplate rest_template = new RestTemplate();
    	
    	// Secret Key를 Base64로 인코딩
    	String encodedAuth = Base64.getEncoder()
    	    .encodeToString((tossSecretKey + ":").getBytes(StandardCharsets.UTF_8));
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.set("Authorization", "Basic " + encodedAuth); 
    	headers.set("Content-Type", "application/json");
    	
    	//System.out.println("headers: "+ headers);
    	
    	Map<String, Object> body = new HashMap<>();
    	body.put("paymentKey", paymentKey);
    	body.put("orderId", orderId);
    	body.put("amount", amount);
    	
    	HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);
    	
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
    public String paymentSuccess(
                @RequestParam String paymentKey,
                @RequestParam String orderId,
                @RequestParam int amount,
                HttpSession session,
                Model model) {
            
        try {
            System.out.println("=== 결제 성공 콜백 ===");
            System.out.println("paymentKey(Toss): " + paymentKey);
            System.out.println("orderId(payment_key): " + orderId);
            System.out.println("amount: " + amount);
            
            // TossPayments 승인 요청
            Map<String, Object> confirmResult = confirmPayment(paymentKey, orderId, amount);
            System.out.println("=== TossPayments 승인 완료 ===");
            
            // 결제 정보 업데이트
            PaymentVo payment_vo = new PaymentVo();
            payment_vo.setPayment_key(paymentKey);
            payment_vo.setApproved_at(new Timestamp(System.currentTimeMillis()));
            
            // 영수증 URL 저장
            if (confirmResult.get("receipt") != null) {
                @SuppressWarnings("unchecked")
                Map<String, String> receipt = (Map<String, String>) confirmResult.get("receipt");
                payment_vo.setReceipt_url(receipt.get("url"));
            }
            
            // 결제 수단 저장
            if (confirmResult.get("method") != null) {
                payment_vo.setMethod(confirmResult.get("method").toString());
            }
            
            payment_service.approvePayment(payment_vo);
            System.out.println("=== 결제 승인 완료 ===");
            
            // 세션에서 주문 정보 가져오기
            Integer order_id = (Integer) session.getAttribute("order_id");
            String order_type = (String) session.getAttribute("orderType");
            
            System.out.println("세션 order_id: " + order_id);
            System.out.println("세션 orderType: " + order_type);
            
            // null 체크
            if (order_id == null) {
                System.err.println("세션에 order_id가 없습니다!");
                throw new RuntimeException("주문 정보를 찾을 수 없습니다.");
            }
            
            if (order_type == null) {
                System.err.println("세션에 orderType이 없습니다!");
                throw new RuntimeException("주문 타입 정보를 찾을 수 없습니다.");
            }
            
            // 주문 상태만 업데이트 (order_item은 이미 생성됨)
            if ("retry".equals(order_type)) {
                // 재결제: order_item은 이미 존재, 상태만 변경
                System.out.println("재결제 처리 - 주문 상태 업데이트");
                order_service.updateStatus(order_id, "결제완료");
                
            } else {
                // 신규 결제: order_item은 create_ready.do에서 이미 생성됨
                // 장바구니 결제인 경우 장바구니 삭제만 수행
                System.out.println("신규 결제 처리 - 주문 상태 업데이트");
                
                if ("cart".equals(order_type)) {
                    String[] cart_ids = (String[]) session.getAttribute("cart_ids");
                    if (cart_ids != null && cart_ids.length > 0) {
                        Map<String, Object> map = new HashMap<>();
                        map.put("cart_id_array", cart_ids);
                        cart_dao.deletePaymentComplete(map);
                        System.out.println("장바구니 삭제 완료");
                    }
                }
                
                order_service.updateStatus(order_id, "결제완료");
            }
            
            // 세션 정리
            session.removeAttribute("orderType");  
            session.removeAttribute("product_idx");
            session.removeAttribute("product_cnt");
            session.removeAttribute("cart_ids");
            session.removeAttribute("order_id");
            
            System.out.println("=== 세션 정리 완료 ===");
            
            System.out.println("리다이렉트: /order/complete.do?order_id=" + order_id);
            return "redirect:/order/complete.do?order_id=" + order_id;
            
        } catch (Exception e) {
            System.err.println("=== 결제 처리 중 오류 발생 ===");
            e.printStackTrace();
            model.addAttribute("error", "결제 승인 중 오류가 발생했습니다: " + e.getMessage());
            return "order/order_fail";
        }
    }

	
    @RequestMapping("/payment/fail.do")
    public String paymentFail(
                @RequestParam String code,
                @RequestParam String message,
                @RequestParam String orderId,
                HttpSession session,
                Model model) {
        
        try {
            System.out.println("=== 결제 실패/취소 ===");
            System.out.println("code: " + code);
            System.out.println("message: " + message);
            System.out.println("orderId(payment_key): " + orderId);
            
            // payment_key로 결제 정보 조회
            PaymentVo payment_vo = payment_service.getPaymentByKey(orderId);
            Integer order_id = (Integer) session.getAttribute("order_id");
            
            System.out.println("payment_vo: " + payment_vo);
            System.out.println("order_id from session: " + order_id);
            
            if (payment_vo != null && order_id != null) {
                // 실패 사유 저장
                payment_vo.setFailed_reason(code + ": " + message);
                payment_service.failPayment(payment_vo);
                System.out.println("결제 실패 정보 저장 완료");
                
                // 사용자 취소인지 실패인지 구분하여 주문 상태 변경
                String order_status;
                if ("USER_CANCEL".equals(code) || code.contains("CANCEL")) {
                    order_status = "결제취소";
                    System.out.println("사용자 결제 취소");
                } else {
                    order_status = "결제실패";
                    System.out.println("결제 시스템 오류");
                }
                
                System.out.println("주문 상태를 '" + order_status + "'로 변경 시도...");
                int updateResult = order_service.updateStatus(order_id, order_status);
                System.out.println("주문 상태 변경 결과: " + updateResult + "행 업데이트됨");
                
            } else {
                System.err.println("❌ payment_vo 또는 order_id가 NULL입니다!");
                System.err.println("payment_vo == null? " + (payment_vo == null));
                System.err.println("order_id == null? " + (order_id == null));
            }
            
            // 세션 정리
            session.removeAttribute("orderType"); 
            session.removeAttribute("product_idx");
            session.removeAttribute("product_cnt");
            session.removeAttribute("cart_ids");
            session.removeAttribute("order_id");
            
            model.addAttribute("errorCode", code);
            model.addAttribute("errorMessage", message);
            
            return "order/order_fail";
            
        } catch (Exception e) {
            System.err.println("=== 결제 실패/취소 처리 중 오류 발생 ===");
            e.printStackTrace();
            model.addAttribute("error", "결제 처리 중 오류가 발생했습니다.");
            return "order/order_fail";
        }
    }

}
