package com.onetouch.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
@Alias("BestProductVo")
public class BestProductVo {
	int product_idx;
	String product_name;
	int product_price;
	String category_name;
	String product_image_url;
	
	// db 에서 그룹으로 해시 이름 받아옴  "건성,  주름성,  탄력성"
	String hashtag_names;
	
	// 뷰에 뿌려주기위해서 다시 List 담는곳
	List<HashtagVo> hashtagsList;
	
	// db 에서 그룹으로 hashtag_idx 들 받아오기  "3, 8, 9"
	String hashtag_idxs;
	
	int product_sell;
}
