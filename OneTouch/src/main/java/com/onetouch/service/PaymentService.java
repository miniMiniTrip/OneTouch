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
	    return payment_dao.updatePaymentApproved(vo);
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
