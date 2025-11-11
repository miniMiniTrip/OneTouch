package com.onetouch.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PostVo")
public class PostVo {

	/** 커뮤니티 번호 */
	int post_idx;
	
	/** 회원번호 */
	int mem_idx;
	
	/** 글내용*/
	String post_content;
	
	/** 업로드한이미지명*/
	String post_image;
	
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
}
