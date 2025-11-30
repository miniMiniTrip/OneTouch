package com.onetouch.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ReviewVo")
public class ReviewVo {
	int order_id;
	int mem_idx;
	int order_item_id;
	int product_idx;
	String product_name;
}
