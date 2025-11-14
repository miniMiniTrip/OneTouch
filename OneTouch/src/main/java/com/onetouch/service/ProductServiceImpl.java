package com.onetouch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.dao.ProductDao;
import com.onetouch.vo.ProductVo;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao product_dao;
	
	@Override
	public int insert(ProductVo productVo) {
		
		System.out.printf("		초기productVo::%s\n",productVo);
		product_dao.insert(productVo);
		System.out.printf("		초기등록후productVo의 product_idx체크::%s\n",productVo);
		product_dao.productImageInsert(productVo);
		
		return 0;
	}

	
	
}
