package com.onetouch.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("PostVo")
public class PostVo {

	/** 커뮤니티 번호 */
	int post_idx;
	
	/** 회원번호 */
	int mem_idx;
	
	/** 회원 아이디 */
	String mem_id;
	
	/** 카테고리*/
	String post_category;

	/** 제목 */
	String post_title;
	
	/** 글내용*/
	String post_content;
	
	/** 업로드한이미지명*/
	String post_image;
	
	/** 이미지 받아올때 사용 */
	MultipartFile post_images[];
	
	/** 좋아요 갯수*/
	int post_like;
	
	/** 댓글 갯수*/
	int post_comment_count;
	
	/** 주문번호*/
	int order_id;
	
	/** 리뷰여부(구매확정했을때 true*/
	String post_review;
	
	/** 별점*/
	int post_rating;
	
	/** 삭제 여부*/
	int post_delete;
	
	/** 작성시각*/
	String post_time;
	
	/** 업데이트시각*/
	String post_update;
	
	/** post에 등록된 상품 정보*/
	List<ProductVo> productList;
	
	/** post_insert 페이지에서 상품 등록할때 상품번호들*/
	List<Integer> product_idx_array;

	/** 상품번호*/
	int product_idx;
}
