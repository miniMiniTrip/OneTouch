package com.onetouch.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("hashtag")
public class HashtagVo {
	int hashtag_idx;
	String hashtag_name;
	Date hashtag_time;
}