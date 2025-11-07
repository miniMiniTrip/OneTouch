package com.onetouch.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("product")
public class ProductVo{
	// 상품 정보
    private int product_idx;
    private int category_idx;
    private int product_wishlist;
    private int product_price;
    private String product_name;
    private String product_brand;
    private String product_comment;
    private int product_cnt;
    private String product_time;
    private String product_update;
    
    // 카테고리 정보
    private String category_name;
 // private String category_description;
    
    // 상품 이미지 정보
    private int product_image_idx;
    private String product_image_url;
    private int product_image_level;
    


}//end: ProductVo 
