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
	
    String product_name;
    int product_price;
    int product_sale_price;
    String product_image_url;
}
