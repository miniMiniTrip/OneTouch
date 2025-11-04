package com.onetouch.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("post_hashtag")
public class PostHashtagVo {
	int hashtag_idx;
	String hashtag_name;
	Date hashtag_time;
}