package com.onetouch.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.HashtagVo;

@Mapper
public interface HashtagDao {
	//전체조회
	public List<HashtagVo> selectList();
	
	//게시글 해시태그 출력
	public String selectHashNamesByPost(int post_idx);
	
	//해시태그의 idx 조회
	public int selectByIdx (int post_idx);
	
	//해시태그 클릭 시 상품 조회
	public int selectProductByHashtag(int hashtag_idx);
	
	//해시태그 클릭 시 글 조회
	public int selectPostByHashtag(int hashtag_idx);
	
	//문진 결과
	public Map<String, Object> 
	
}
