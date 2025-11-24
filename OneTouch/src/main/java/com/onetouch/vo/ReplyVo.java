package com.onetouch.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ReplyVo")
public class ReplyVo {
	int reply_idx;
	int mem_idx;
	String mem_id;
	int post_idx;
	String reply_content;
	/** 삭제여부 0:정상(기본값) 1:본인삭제 2:관리자삭제*/
	int reply_delete;
	String reply_time;
	String reply_update;
}
