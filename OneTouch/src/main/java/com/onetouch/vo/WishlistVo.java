package com.onetouch.vo;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("wishlist")
public class WishlistVo {
	int wishlist_idx;
	int mem_idx;
	int product_idx;
	Timestamp wishlist_time;
}
