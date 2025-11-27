package com.onetouch.service;

import java.util.List;
import java.util.Map;

import com.onetouch.vo.PostVo;

public interface PostService {

	Map<String, Object> selectPostList(Map<String, Object> map);

	Map<String, Object> selectTipList(Map<String, Object> map);

	Map<String, Object> selectReviewList(Map<String, Object> map);

	Map<String, Object> selectFreeBoard(Map<String, Object> map);

	int postInsert(PostVo postVo,String[] post_hashtag_array) throws Exception;

	Map<String, Object> postLikeUpdate(Map<String, Object> map) throws Exception;

	int updatePostVo(PostVo postVo,String[] post_hashtag_array) throws Exception;
}
