package com.onetouch.vo;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("order")
public class OrderVo {
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
}