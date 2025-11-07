package com.onetouch.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.HashtagVo;

@Mapper
public interface HashtagDao {
	//관리용>
	
	//1. 전체조회
	public List<HashtagVo> selectList();
	
	//2. 단건작성 - 중복처리는 Controller 혹은 service에서
	public int insertOne(HashtagVo vo);
	
	//3. 직접 삭제
	public int delete(int hashtag_idx);
	
	//게시글용
	
	//해시태그 작성용>
	//1. 중복검사용(3번 쓰기 전에 한 번 더 사용)
	public List<String> selectByNames(HashtagVo vo);
	
	//2. 생성
	public List<String> insert(HashtagVo vo);
	
	//3. 글쓰기 시 일괄 등록
	public Map<String,Object> insertPostHashtag(HashtagVo vo);
	
	//4. 글에서 해시태그 연결 끊기
	public int deletePostHashtagByPost(int post_idx);
	
	// 각 서비스단 조회용>
	
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
	
<<<<<<< HEAD

=======
	//해시태그 작성용
	
	//1. 중복검사용
	public List<String> selectByNames(HashtagVo vo);
>>>>>>> branch 'sw' of https://github.com/miniMiniTrip/OneTouch.git
	

}
