package com.onetouch.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("LikeVo")
public class LikeVo {
 int like_idx;
 int post_idx;
 int mem_idx;
 String like_time;
}
