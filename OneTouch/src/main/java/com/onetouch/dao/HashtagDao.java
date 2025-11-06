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
	public List<Integer> selectProductByHashtag(int hashtag_idx);
	
	//해시태그 클릭 시 글 조회
	public List<Integer> selectPostByHashtag(int hashtag_idx);
	
	//문진 결과 상품 조회
	public List<Integer> selectProductsByHashtags(Map<String, Object> params);
	
	//문진 결과 추천글 조회
	public List<Integer> selectPostsByHashtags(Map<String, Object> params);
	
	//해시태그 작성용
	
	//1. 중복검사용
	public List<String> selectByNames(HashtagVo vo);
	
	//2. 생성
	public List<String> insert(HashtagVo vo);
	
	//3. 글쓰기 시 일괄 등록
	public Map<String,Object> insertPostHashtag(HashtagVo vo);
	
	//직접 삭제
	public int delete(int hashtag_idx);
}
