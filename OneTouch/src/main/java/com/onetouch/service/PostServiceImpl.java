package com.onetouch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.dao.PostDao;
import com.onetouch.vo.PostVo;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostDao postDao;
	
	@Override
	public List<PostVo> selectPostList() {
		List<PostVo> postVo_array=postDao.selectPostList();
		return postVo_array;
	}

	@Override
	public List<PostVo> selectTipList() {
		List<PostVo> postTip_array=postDao.selectTipList();
		return postTip_array;
	}

	@Override
	public List<PostVo> selectReviewList() {
		List<PostVo> postReview_array=postDao.selectReviewList();
		return postReview_array;
	}

	@Override
	public List<PostVo> selectFreeBoard() {
		List<PostVo> postFreeBoard_array=postDao.selectFreeBoard();
		return postFreeBoard_array;
	}

}
