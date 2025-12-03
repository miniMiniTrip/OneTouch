package com.onetouch.vo;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

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
    private String product_comment; //상품설명
    private int product_cnt;
    private String product_time;
    private String product_update;
    private String product_sell;
    
    
    // 카테고리 정보
    private String category_name;
 // private String category_description;
    
    // 상품 이미지 정보
    private MultipartFile[] photo_sub; // 서브이미지
    private MultipartFile[] photo_content; // 내용이미지
    private int product_image_idx;
    private String product_image_url;
    private int product_image_level;
    
    private int remain_idx;          // 재고번호 (재고이력 조회시에만 사용)
    private String remain_name;      // 재고명 (재고등록 내역)
    private int remain_cnt;          // 재고수량 (추가된 수량)
    private LocalDate remain_regdate;     // 재고등록일자
    
    private String main_image_url;      // level 1 (메인 이미지)
    private String detail_image_url;    // level 2 (상세 이미지)

    private List<HashtagVo> hashtag_list; // 해시태그Vo 리스트
    
    private String trackingNumber;   // 송장번호
    private String deliveryStatus;   // 배송상태

}//end: ProductVo 
