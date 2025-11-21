package com.onetouch.dao;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.PaymentVo;

@Mapper
public interface PaymentDao {
	int insertPayment(PaymentVo vo);
	
	PaymentVo selectPaymentByKey(String payment_key);
	PaymentVo selectPaymentByOrderId(int order_id);
	
	int updatePaymentApproved(PaymentVo vo);
	int updatePaymentFailed(PaymentVo vo);
	int updatePaymentCanceled(PaymentVo vo);
}
