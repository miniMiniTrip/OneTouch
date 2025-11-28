package com.onetouch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.dao.HashtagDao;
import com.onetouch.vo.HashtagVo;

@Service
public class HashtagServiceImpl implements HashtagService {
	
	@Autowired
	HashtagDao hashtagDao;
	
	@Override
	public List<HashtagVo> updatePostProductHashtagTotalConut() {
		hashtagDao.updatePostProductHashtagTotalConut();
		List<HashtagVo> hashtagRank = hashtagDao.selectHashtagRank();
		System.out.printf("		(updatePostProductHashtagTotalConut) hashtagRank => %s\n",hashtagRank);
		return hashtagRank;
	}

	
}
