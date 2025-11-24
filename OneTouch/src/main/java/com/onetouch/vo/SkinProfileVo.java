package com.onetouch.vo;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("skin_profile")
public class SkinProfileVo {
	int mem_idx;
	String sp_skin_type;
	String sp_trouble;
	String sp_color_change;
	String sp_wrinkle;
	String sp_skin_tone;
	String hashtag_ids;
	Timestamp sp_time;
	Timestamp sp_update;
}
