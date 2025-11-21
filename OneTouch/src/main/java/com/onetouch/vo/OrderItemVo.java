package com.onetouch.vo;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("order_item")
public class OrderItemVo {
	int order_item_id; 
	int order_id; 
	int product_idx; 
	String product_name; 
	int product_cnt;
	int product_amount;
	int total_amount;
	Timestamp order_time; 
	String product_image_url;
}
