package com.onetouch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.PostVo;

@Mapper
public interface PostDao {
	List<PostVo> selectPostList();

	List<PostVo> selectTipList();
	List<PostVo> selectReviewList();
	List<PostVo> selectFreeBoard();
}
