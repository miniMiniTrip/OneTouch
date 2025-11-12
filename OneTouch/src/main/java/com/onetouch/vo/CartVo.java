package com.onetouch.vo;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("cart")
public class CartVo {

	int cart_id;
	int mem_idx;
	int product_idx;
	int cart_cnt;
	Timestamp cart_time;
	
	String product_name;
	int product_price;
	
	String product_image_url;
	
	int total_amount;
	
}