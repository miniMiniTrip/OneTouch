package com.onetouch.vo;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("hashtag")
public class HashtagVo {
	int hashtag_idx;
	String hashtag_name;
	Timestamp hashtag_time;
	int use_count;
}