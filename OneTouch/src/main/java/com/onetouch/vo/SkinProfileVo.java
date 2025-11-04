package com.onetouch.vo;

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
	String sp_time;
	String sp_update;
}
