package com.onetouch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.dao.ProductDao;
import com.onetouch.vo.ProductVo;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productdao;

    @Override
    public List<ProductVo> selectList() {
        return productdao.selectList();
    }

    @Override
    public void insert(ProductVo productvo) {
        productdao.insert(productvo);
    }

    @Override
    public ProductVo selectOne(int product_idx) {
        return productdao.selectOne(product_idx);
    }
}