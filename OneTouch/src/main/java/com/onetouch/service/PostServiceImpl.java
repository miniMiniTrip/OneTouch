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

}
