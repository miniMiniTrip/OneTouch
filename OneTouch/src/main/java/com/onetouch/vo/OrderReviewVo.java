package com.onetouch.vo;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
@Alias("OrderReviewVo")
public class OrderReviewVo {
	int order_id;
	int mem_idx;
	String order_no;
	String order_status;
	int total_amount;
	String order_name;
	String order_mem_name;
	String order_phone;
	String order_postal;
	String order_address;
	String order_address_more;
	Timestamp order_time;
	Timestamp order_update;
	
	String order_tracking;
	String order_courier;
	
	int order_item_id; 
	int product_idx; 
	String product_name; 
	int product_cnt;
	int product_amount;
	String product_image_url;
	/** 커뮤니티 번호 */
	int post_idx;
}
