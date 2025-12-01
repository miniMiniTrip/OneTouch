package com.onetouch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onetouch.dao.PaymentDao;
import com.onetouch.vo.PaymentVo;

@Service
public class PaymentService {
	
	@Autowired
	PaymentDao payment_dao;
	
	@Transactional
	    public int createPaymentReady(PaymentVo vo) {
	        vo.setStatus("READY");
	    return payment_dao.insertPayment(vo);
	}
	 
	@Transactional
	public int approvePayment(PaymentVo vo) {
	    //디버깅: 전달받은 PaymentVo 확인
	    System.out.println("=== PaymentService.approvePayment 호출됨 ===");
	    System.out.println("전달받은 payment_key: " + vo.getPayment_key());
	    System.out.println("전달받은 method: " + vo.getMethod());
	    System.out.println("전달받은 approved_at: " + vo.getApproved_at());
	    System.out.println("전달받은 receipt_url: " + vo.getReceipt_url());
	    System.out.println("전달받은 PaymentVo: " + vo);
	    
	    int result = payment_dao.updatePaymentApproved(vo);
	    
	    System.out.println("=== updatePaymentApproved 실행 결과: " + result + "행 업데이트 ===");
	    return result;
	}
	
	@Transactional
	public int failPayment(PaymentVo vo) {
	    return payment_dao.updatePaymentFailed(vo);
	}
	
	@Transactional
	public int cancelPayment(PaymentVo vo) {
	    return payment_dao.updatePaymentCanceled(vo);
	}
	
	public PaymentVo getPaymentByKey(String payment_key) {
	    return payment_dao.selectPaymentByKey(payment_key);
	}
	
	public PaymentVo getPaymentByOrderId(int order_id) {
	    return payment_dao.selectPaymentByOrderId(order_id);
	}
	
	@Transactional
	public int updatePaymentForRetry(PaymentVo vo) {
	    return payment_dao.updatePaymentForRetry(vo);
	}
		 
}