package com.onetouch.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.LikeVo;
import com.onetouch.vo.PostPageVo;
import com.onetouch.vo.PostProductVo;
import com.onetouch.vo.PostVo;
import com.onetouch.vo.ProductVo;
import com.onetouch.vo.ReviewVo;

@Mapper
public interface PostDao {
	List<PostVo> selectPostList(Map<String, Object> map);
	/** post 총 갯수 카운트 함수*/
	int selectPostTotalCount(Map<String,Object> map);
	List<PostVo> selectTipList(Map<String, Object> map);
	List<PostVo> selectReviewList(Map<String, Object> map);
	List<PostVo> selectFreeBoard(Map<String, Object> map);

	int postInsert(PostVo postVo);
	
	int postProductInsert(PostVo postVo);

	List<ProductVo> selectProductList();

	/**post 좋아요 추가*/
	int insertPostLike(Map<String, Object> map);

	/** like 테이블 에서 post_idx 기준으로 있는지 확인을 위한 조회*/
	LikeVo selectLikePostIdxOne(Map<String, Object> map);
	int deletePostLike(Map<String, Object> map);

	
	// 좋아요수 카운트
	int selectLikeCount(Map<String, Object> map);

	int updatePostLikeCount(Map<String, Object> map);

	PostVo selectPostOne(int post_idx);

	List<PostProductVo> selectPostProductOne(int post_idx);

	int updatePostVo(PostVo postVo);

	int deletePostProduct(int post_idx);

	int deletePost(Map<String, Object> map);

	List<PostPageVo> selectPostIdxList(Map<String, Object> map);

	
	// 리뷰를 쓰기위해서 주문을 했는지 안했는지를 위해 1개 조회해오기
	ReviewVo selectReviewOrderOne(Map<String, Object> map);
	
	List<PostVo> selectByIds(List<Integer> post_idx);

}
