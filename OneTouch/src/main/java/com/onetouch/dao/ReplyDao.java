package com.onetouch.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.ReplyVo;

@Mapper
public interface ReplyDao {
	int insertPostReply(ReplyVo replyVo);
}
