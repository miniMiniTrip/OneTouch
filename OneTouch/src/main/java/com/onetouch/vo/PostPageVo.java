package com.onetouch.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PostPageVo")
public class PostPageVo {
	/** 페이지*/
	int post_idx;
	int block_list;
}
