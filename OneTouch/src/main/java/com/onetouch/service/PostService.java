package com.onetouch.service;

import java.util.List;
import java.util.Map;

import com.onetouch.vo.PostVo;

public interface PostService {

	List<PostVo> selectPostList();

	List<PostVo> selectTipList();

	List<PostVo> selectReviewList();

	List<PostVo> selectFreeBoard();

	int postInsert(PostVo postVo) throws Exception;

	Map<String, Object> postLikeUpdate(Map<String, Object> map) throws Exception;
}
