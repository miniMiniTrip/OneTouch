package com.onetouch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.dao.PaymentDao;

@Service
public class PaymentService {
	
	@Autowired
	PaymentDao payment_dao;
	
	
	
}
