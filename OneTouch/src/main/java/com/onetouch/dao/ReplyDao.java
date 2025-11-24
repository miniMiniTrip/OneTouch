package com.onetouch.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.ReplyPageVo;
import com.onetouch.vo.ReplyVo;

@Mapper
public interface ReplyDao {
	List<ReplyVo>selectReplyList(Map<String, Object> map);
	int insertPostReply(ReplyVo replyVo);
<<<<<<< HEAD
	int updatePostReply(ReplyVo replyVo);
	int deletePostReply(int reply_idx);
	//페이지 처리 하기위한 가져올 replyIdx 조회해오기
	List<ReplyPageVo> selectReplyIdxPageList(Map<String, Object>map);
	//post_idx 기준 reply전체 갯수 구하기
	int selectPostIdxReplyTotalCount(Map<String,Object>map);
=======
>>>>>>> 4449e6b8f0c1c6a293c456ca10b73466f341cc51
}
