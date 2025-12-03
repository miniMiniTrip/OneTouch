package com.onetouch.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.onetouch.common.MyConstant;
import com.onetouch.dao.HashtagDao;
import com.onetouch.dao.PostDao;
import com.onetouch.util.PostPaging;
import com.onetouch.vo.HashtagVo;
import com.onetouch.vo.LikeVo;
import com.onetouch.vo.PostPageVo;
import com.onetouch.vo.PostProductVo;
import com.onetouch.vo.PostVo;

import jakarta.servlet.ServletContext;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostDao postDao;
	@Autowired
	ServletContext application;
	@Autowired
	HashtagDao hashtagDao;
	
	//전체 목록 불러오기
	@Override
	public Map<String, Object> selectPostList(Map<String, Object> map) {
		List<PostVo> postVo_array = new ArrayList<PostVo>();
		map.put("page", ((Integer)map.get("nowPage")-1)*MyConstant.Post.BLOCK_LIST);
		map.put("block_list", MyConstant.Post.BLOCK_LIST);
		List<PostPageVo> postPageVo=postDao.selectPostIdxList(map);
		map.put("postPageVo",postPageVo);
		
		int rowTotal=postDao.selectPostTotalCount(map);
		System.out.printf("		post 총 갯수 => %d\n",rowTotal);
		String pagination=PostPaging.getPaging((String)map.get("post_category"),null, (Integer)map.get("nowPage"), rowTotal, MyConstant.Post.BLOCK_LIST, MyConstant.Post.BLOCK_PAGE);
		System.out.println(pagination);
		map.put("pagination", pagination);
		
		postVo_array=postDao.selectPostList(map);
		map.put("postVo_array", postVo_array);
		return map;
	}

	@Override
	public Map<String, Object> selectTipList(Map<String, Object> map) {
		List<PostVo> postTip_array =new ArrayList<PostVo>();
		map.put("page", ((Integer)map.get("nowPage")-1)*MyConstant.Post.BLOCK_LIST);
		map.put("block_list", MyConstant.Post.BLOCK_LIST);
		List<PostPageVo> postPageVo=postDao.selectPostIdxList(map);
		map.put("postPageVo",postPageVo);
		
		int rowTotal=postDao.selectPostTotalCount(map);
		System.out.printf("		post 총 갯수 => %d\n",rowTotal);
		String pagination=PostPaging.getPaging((String)map.get("post_category"),null, (Integer)map.get("nowPage"), rowTotal, MyConstant.Post.BLOCK_LIST, MyConstant.Post.BLOCK_PAGE);
		System.out.println(pagination);
		map.put("pagination", pagination);
		
		System.out.printf("		[selectTipList]postPageVo =>%s\n",postPageVo);
		
		postTip_array=postDao.selectTipList(map);
		map.put("postTip_array", postTip_array);
		return map;
	}

	@Override
	public Map<String, Object> selectReviewList(Map<String, Object> map) {
		List<PostVo> postReview_array=new ArrayList<PostVo>();
		map.put("page", ((Integer)map.get("nowPage")-1)*MyConstant.Post.BLOCK_LIST);
		map.put("block_list", MyConstant.Post.BLOCK_LIST);
		List<PostPageVo> postPageVo=postDao.selectPostIdxList(map);
		map.put("postPageVo",postPageVo);
		int rowTotal=postDao.selectPostTotalCount(map);
		System.out.printf("		post 총 갯수 => %d\n",rowTotal);
		String pagination=PostPaging.getPaging((String)map.get("post_category"),null, (Integer)map.get("nowPage"), rowTotal, MyConstant.Post.BLOCK_LIST, MyConstant.Post.BLOCK_PAGE);
		System.out.println(pagination);
		map.put("pagination", pagination);
		System.out.printf("		[selectReviewList]postPageVo =>%s\n",postPageVo);
		postReview_array=postDao.selectReviewList(map);
		map.put("postReview_array", postReview_array);
		return map;
	}

	@Override
	public Map<String, Object> selectFreeBoard(Map<String, Object> map) {
		List<PostVo> postFreeBoard_array=new ArrayList<PostVo>();
		map.put("page", ((Integer)map.get("nowPage")-1)*MyConstant.Post.BLOCK_LIST);
		map.put("block_list", MyConstant.Post.BLOCK_LIST);
		List<PostPageVo> postPageVo=postDao.selectPostIdxList(map);
		map.put("postPageVo",postPageVo);
		int rowTotal=postDao.selectPostTotalCount(map);
		System.out.printf("		post 총 갯수 => %d\n",rowTotal);
		String pagination=PostPaging.getPaging((String)map.get("post_category"),null, (Integer)map.get("nowPage"), rowTotal, MyConstant.Post.BLOCK_LIST, MyConstant.Post.BLOCK_PAGE);
		System.out.println(pagination);
		map.put("pagination", pagination);
		System.out.printf("		[selectFreeBoard()]postPageVo =>%s\n",postPageVo);
		postFreeBoard_array=postDao.selectFreeBoard(map);
		map.put("postFreeBoard_array", postFreeBoard_array);
		return map;
	}

	@Override
	/**post 등록처리*/
	public int postInsert(PostVo postVo,String[] post_hashtag_array) throws Exception {
		String webPath="";
		//이미지 등록처리
		if(postVo.getPost_category().equals("review")) {
			
			webPath = "/images/posts/reviews";
		}else {
			
			webPath = "/images/posts/";
		}
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
		// post 등록처리
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
		
		if(post_hashtag_array != null) {
		    // 1. 공백 제거
		    List<String> hashtagNameList = Arrays.stream(post_hashtag_array)
		        .map(String::trim)
		        .filter(h -> !h.isEmpty())
		        .collect(Collectors.toList());

		    // 2. DB에서 기존 해시태그 조회
		    List<HashtagVo> existingHashtags = hashtagDao.selectByNames(hashtagNameList);

		    // 3. DB에 없는 해시태그만 새로 insert
		    List<String> newHashtags = hashtagNameList.stream()
		        .filter(h -> existingHashtags.stream().noneMatch(e -> e.getHashtag_name().equals(h)))
		        .collect(Collectors.toList());

		    if(!newHashtags.isEmpty()) {
		        res = res * hashtagDao.insert(newHashtags);
		    }

		    // 4. 현재 post와 모든 해시태그 연결
		    Map<String,Object> map = new HashMap<>();
		    map.put("post_idx", postVo.getPost_idx());

		    // 전체 해시태그 조회 (기존 + 새로 등록된)
		    List<HashtagVo> allHashtags = hashtagDao.selectByNames(hashtagNameList);
		    map.put("hashtag_list", allHashtags);

		    res = res * hashtagDao.insertPostHashtag(map);
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
			int count=postDao.selectLikeCount(map);
			System.out.println("count:"+count);
			map.put("post_like", count);
			res=res*postDao.updatePostLikeCount(map);
		
		if(res==0) {
			throw new Exception("like_not");
		}
		return map;
	}

	// post 수정 하기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updatePostVo(PostVo postVo,String[] post_hashtag_array) throws Exception{
		System.out.println("기존이미지:"+postVo.getPost_image());
		for(MultipartFile postVo_image:postVo.getPost_images()) {
			System.out.println("새로받아온 이미지 :"+postVo_image.getOriginalFilename());
		}
		
		//이미지 등록처리
		String webPath = "/images/posts/";
		String absPath = application.getRealPath(webPath);
		//System.out.printf("		파일 저장 절대경로:%s\n",absPath);
		String p_filename="no_file";
		String full_image_name="";
		StringBuilder sb=new StringBuilder();
		sb.append(postVo.getPost_image());
		sb.append("*");
		if(postVo.getPost_images()!=null) {
			for(MultipartFile post_image:postVo.getPost_images()){
				p_filename=post_image.getOriginalFilename(); // 저장할 순수한 파일명
				
	            if (p_filename == null || p_filename.trim().isEmpty()) {
	                // 파일명이 없으면 continue로 건너뛰기
	                continue;
	            }
	            
				File f = new File(absPath,p_filename); // 저장할 파일 정보(경로,파일이름)
				if(f.exists()){ // 같은 파일명이 존재하면
					long tm =System.currentTimeMillis();
					p_filename=String.format("%d_%s",tm,p_filename);
					
					f = new File(absPath,p_filename);
				}
				System.out.printf("새로 등록하는 이미지 이름 :%s\n",p_filename);
				sb.append(p_filename);
				sb.append("*");
				
				post_image.transferTo(f); //MultipartFile에 임시로 저장된 파일을 내가 설정한 경로로 복사
			}
		}
		if(sb.toString().endsWith("*")) {
			full_image_name=sb.toString().substring(0,sb.toString().length()-1);
		}
		postVo.setPost_image(full_image_name);

		//post에 등록된 post_product 삭제 처리 후 다시 등록
		int res = 1;
		List<PostProductVo> ppv=postDao.selectPostProductOne(postVo.getPost_idx());
		System.out.printf("		postProduct테이블에서 데이터 있는지 체크 : %s\n",ppv);
		if(ppv!=null&&!ppv.isEmpty()) {
			res =res*postDao.deletePostProduct(postVo.getPost_idx());
			if(res==0) { 
				System.out.println("post_product 테이블에서 삭제 실패");
				throw new Exception("deletePostProduct()_not");
			}
		};
		if(postVo.getProduct_idx_array()!=null){
			for(int product_idx:postVo.getProduct_idx_array()) {
				postVo.setProduct_idx(product_idx);
				// post_product 목록 테이블에저장
				res=res * (postDao.postProductInsert(postVo));
				if(res==0) { 
					System.out.println("postProductInsert 실패");
					throw new Exception("postProductInsert()_not");
				}
			}
		}
		
		
		//해시태그 name으로 조회 해서 있으면 넘어가고 없으면 새로 추가 (수정된 버전)
		System.out.printf(" 카테고리 => %s\n", postVo.getPost_category());

		if (!postVo.getPost_category().equals("review")) {
		    // 1. 기존 해시태그 모두 삭제 (항상 실행)
		    res = res * hashtagDao.deletePostHashtagByPost(postVo.getPost_idx());
		    if (res == 0) {
		        throw new Exception("deletePostHashtagByPost()_not");
		    }

		    // 2. 새로 받은 해시태그 처리 (null이어도 안전)
		    List<String> hashtagNameList = new ArrayList<>();
		    List<HashtagVo> hashtagIdxList = new ArrayList<>();
		    Map<String, Object> map = new HashMap<>();
		    map.put("post_idx", postVo.getPost_idx());

		    if (post_hashtag_array != null && post_hashtag_array.length > 0) {
		        for (String hashtag : post_hashtag_array) {
		            if (hashtag != null && !hashtag.trim().isEmpty()) {
		                String cleanTag = hashtag.trim().replaceFirst("^#", "");
		                hashtagNameList.add(cleanTag);
		            }
		        }
		    }

		    // 해시태그가 하나도 없으면 → 삭제만 하고 끝! (insert 안 함)
		    if (hashtagNameList.isEmpty()) {
		        System.out.println("해시태그 없음 → 기존 삭제만 하고 추가 안 함 (정상 동작)");
		    } else {
		        // 해시태그 있을 때만 기존 로직 실행
		        List<HashtagVo> existingTags = hashtagDao.selectByNames(hashtagNameList);
		        Map<String, HashtagVo> existingMap = new HashMap<>();
		        for (HashtagVo vo : existingTags) {
		            existingMap.put(vo.getHashtag_name(), vo);
		        }

		        List<String> newTagsToInsert = new ArrayList<>();
		        for (String name : hashtagNameList) {
		            if (!existingMap.containsKey(name)) {
		                System.out.printf("존재하지 않는 해시태그 발견 → 등록 예정: %s\n", name);
		                newTagsToInsert.add(name);
		            } else {
		                System.out.printf("이미 존재하는 해시태그: %s\n", name);
		                hashtagIdxList.add(existingMap.get(name));
		            }
		        }

		        if (!newTagsToInsert.isEmpty()) {
		            hashtagDao.insert(newTagsToInsert);
		            List<HashtagVo> justInserted = hashtagDao.selectByNames(newTagsToInsert);
		            hashtagIdxList.addAll(justInserted);
		        }

		        map.put("hashtag_list", hashtagIdxList);
		        System.out.printf(" hashtag_list : %s\n", hashtagIdxList);
		        res = res * hashtagDao.insertPostHashtag(map);
		        if (res == 0) {
		            throw new Exception("insertPostHashtag()_not");
		        }
		    }
		}
		System.out.printf("		수정할 postVo:%s\n",postVo);
		res=res*postDao.updatePostVo(postVo);
		if(res==0) { 
			throw new Exception("updatePostVo()_not");
		}
		
		return res;
	}
	

	
	
}
