package com.onetouch.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PostProductVo")
public class PostProductVo {
	int post_product_idx;
	int post_idx;
	int product_idx;
	String post_product_time;
}
