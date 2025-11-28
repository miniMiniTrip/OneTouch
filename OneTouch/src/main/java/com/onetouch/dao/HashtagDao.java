package com.onetouch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.HashtagVo;

@Mapper
public interface HashtagDao {
	//관리용
	
	//1. 전체조회
	public List<HashtagVo> selectList();
	
	//2. 단건작성 - 중복처리는 Controller 혹은 service에서
	public int insertOne(HashtagVo vo);
	
	//3. 단건조회
	public HashtagVo selectOne(int hashtag_idx);
	
	//4. 직접 삭제
	public int delete(int hashtag_idx);
	
	//게시글용
	
	//해시태그 작성용
	//1. 중복검사용(3번 쓰기 전에 한 번 더 사용)
	public List<HashtagVo> selectByNames(List<String> hashtag_names);
	
	//2. 생성
	public int insert(List<String> hashtag_names);
	
	//3-1. 글쓰기 시 일괄 등록 (POST용)
	public int insertPostHashtag(Map<String, Object> params);
	
	//3-2. 상품 등록 시 일괄 등록 (PRODUCT용)
	public int insertProductHashtag(Map<String, Object> params);
	
	//4-1. 글에서 해시태그 연결 끊기
	public int deletePostHashtagByPost(int post_idx);
	
	//4-2. 상품에서 해시태그 연결 끊기
	public int deleteProductHashtagByProduct(int product_idx);
	
	// 각 서비스단 조회용
	
	//게시글 해시태그 출력
	public List<String> selectHashNamesByPost(int post_idx);
	
	//상품 해시태그 출력
	public List<String> selectHashNamesByProduct(int product_idx);
	
	//해시태그의 idx 조회
	public int selectByIdx (int post_idx);
	
	//해시태그 클릭 시 상품 조회
	public List<Integer> selectProductByHashtag(int hashtag_idx);
	
	//해시태그 클릭 시 글 조회
	public List<Integer> selectPostByHashtag(int hashtag_idx);
	
	//문진 결과 상품 조회
	public List<Integer> selectProductsByHashtags(Map<String, Object> params);
	
	default List<Integer> selectProductsByHashtags(List<Integer> hashtag_list, int min_match) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("hashtag_list", hashtag_list);
	    params.put("min_match", min_match);
	    return selectProductsByHashtags(params);
	}
	
	//문진 결과 추천글 조회
	public List<Integer> selectPostsByHashtags(Map<String, Object> params);
	
	//post_hashtag 테이블과 product_hashtag 테이블에 있는 hashtag_idx 카운트해서 hashtag 테이블에 use_count컬럼에 update
	public void updatePostProductHashtagTotalConut();
	
	//hashtag 랭킹 가져오기
	public List<HashtagVo> selectHashtagRank();
	
}