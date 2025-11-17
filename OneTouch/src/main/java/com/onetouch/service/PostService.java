package com.onetouch.service;

import java.util.List;

import com.onetouch.vo.PostVo;

public interface PostService {

	List<PostVo> selectPostList();

	List<PostVo> selectTipList();

	List<PostVo> selectReviewList();

	List<PostVo> selectFreeBoard();

	int postInsert(PostVo postVo) throws Exception;
}
