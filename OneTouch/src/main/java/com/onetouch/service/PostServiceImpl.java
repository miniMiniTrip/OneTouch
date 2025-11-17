package com.onetouch.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.onetouch.dao.PostDao;
import com.onetouch.vo.LikeVo;
import com.onetouch.vo.MemVo;
import com.onetouch.vo.PostVo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostDao postDao;
	@Autowired
	ServletContext application;
	
	
	@Override
	public List<PostVo> selectPostList() {
		List<PostVo> postVo_array = new ArrayList<PostVo>();
			postVo_array=postDao.selectPostList();
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

	@Override
	/**post 등록처리*/
	public int postInsert(PostVo postVo) throws Exception {
		
		//이미지 등록처리
		String webPath = "/images/";
		String absPath = application.getRealPath(webPath);
		//System.out.printf("		파일 저장 절대경로:%s\n",absPath);
		String p_filename="no_file";
		String full_image_name="";
		StringBuilder sb = new StringBuilder();
		if(postVo.getPost_images()!=null) {
			for(MultipartFile post_image:postVo.getPost_images()){
				p_filename=post_image.getOriginalFilename(); // 저장할 순수한 파일명
				
				File f = new File(absPath,p_filename); // 저장할 파일 정보(경로,파일이름)
				if(f.exists()){ // 같은 파일명이 존재하면
					long tm =System.currentTimeMillis();
					p_filename=String.format("%d_%s",tm,p_filename);
					
					f = new File(absPath,p_filename);
				}
				sb.append(p_filename);
				
				sb.append("*");
				
				post_image.transferTo(f); //MultipartFile에 임시로 저장된 파일을 내가 설정한 경로로 복사
			}
		}
		if(sb.toString().endsWith("*")) {
			full_image_name=sb.toString().substring(0,sb.toString().length()-1);
		}
		postVo.setPost_image(full_image_name);		
		int res =postDao.postInsert(postVo);
		//-------------------------------------
		System.out.printf("		[PostServiceImpl-postInsert()]postVo:%s\n",postVo);
		
		//==== 카테고리가 스킨일때 상품등록처리
		if((postVo.getProduct_idx_array()!=null)&&(postVo.getPost_category().equals("skin"))) {
			
			List<Integer> product_idx_array=postVo.getProduct_idx_array();
			for(Integer product_idx : product_idx_array ) {
				postVo.setProduct_idx(product_idx);
				// post_product 목록 테이블에저장
				res=res * (postDao.postProductInsert(postVo));
			}
		}
		
		
		return res;
	}

	/** post 좋아요 등록, 삭제 처리 (post_idx,mem_idx)
	 * @throws Exception */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Map<String, Object> postLikeUpdate(Map<String, Object> map) throws Exception {
		int res=1;
		//post_idx 기준으로 like 테이블에 존재하는지 조회
		LikeVo likeVo=postDao.selectLikePostIdxOne(map);
			System.out.printf("		likeVo:%s\n",likeVo);
		if(likeVo==null) {
			//like 테이블에 추가
			System.out.println("		like 테이블 추가");
			res = res*postDao.insertPostLike(map);
			map.put("res",res==1 );
		}else {
			System.out.println("		like 테이블 삭제");
			res = res*postDao.deletePostLike(map);
			map.put("res",res==1 );
		}
		
		if(res==0) {
			throw new Exception("like_not");
		}
		return map;
	}
	

	
	
}
