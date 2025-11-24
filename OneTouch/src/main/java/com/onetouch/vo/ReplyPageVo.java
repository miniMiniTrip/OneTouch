package com.onetouch.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ReplyPageVo")
public class ReplyPageVo {
	int reply_idx;
}
