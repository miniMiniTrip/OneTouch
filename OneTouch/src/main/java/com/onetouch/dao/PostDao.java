package com.onetouch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.PostVo;
import com.onetouch.vo.ProductVo;

@Mapper
public interface PostDao {
	List<PostVo> selectPostList();

	List<PostVo> selectTipList();
	List<PostVo> selectReviewList();
	List<PostVo> selectFreeBoard();

	int postInsert(PostVo postVo);

	int postProductInsert(PostVo postVo);

	List<ProductVo> selectProductList();
}
