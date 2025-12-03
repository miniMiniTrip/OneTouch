package com.onetouch.controller;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onetouch.dao.HashtagDao;
import com.onetouch.dao.PostDao;
import com.onetouch.dao.ReplyDao;
import com.onetouch.service.PostService;
import com.onetouch.service.ReplyService;
import com.onetouch.vo.MemVo;
import com.onetouch.vo.PostProductVo;
import com.onetouch.vo.PostVo;
import com.onetouch.vo.ProductVo;
import com.onetouch.vo.ReplyVo;
import com.onetouch.vo.ReviewVo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Controller
public class PostController {

	@Autowired
	PostService postService;
	
	@Autowired
	HttpSession httpsesion;
	
	@Autowired
	PostDao postDao;
	

	@Autowired
	ReplyDao replyDao;
	
	@Autowired
	ReplyService replyService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	HashtagDao hashtagDao;
	
	//커뮤니티 전체목록 열기 (동기로 구현)
	@RequestMapping("/post/list")
	public String postFormList(
	        Model model,
	        @RequestParam(name="page", defaultValue="1") int nowPage,
	        @RequestParam(name="tab", required=false) String tab,
	        @RequestParam(name="post_idx", required=false) Integer targetPostIdx
	        ,@RequestParam(name="posts" ,defaultValue = "") String posts) {
	    
	    System.out.println("[PostController] postFormList()");

	    System.out.printf("		posts => %s\n",posts);
//	    String[] postsArray = posts.split(",");
	    
	    // JSP에 전달할 데이터만 설정
	    if (tab != null && !tab.isEmpty()) {
	        model.addAttribute("defaultTab", tab);
	        System.out.println("기본 탭: " + tab);
	    }
	    
	    if (targetPostIdx != null) {
	        model.addAttribute("targetPostIdx", targetPostIdx);
	        
	        System.out.println("타겟 포스트: " + targetPostIdx);
	    }
	    model.addAttribute("postsArray", posts);
	    System.out.println("[PostController] return : /post/post.jsp");
	    System.out.println("");
	    return "/post/post";
	}

	
	//커뮤니티 전체목록 열기(비동기로 구현)
	@RequestMapping("/post/all_list")
	@ResponseBody
	public Map<String,Object> postFormAllList(Model model,@RequestParam(name="page",defaultValue="1")int nowPage
			,String tabType,String mypage,@RequestParam(defaultValue = "") String postsArray) {
		System.out.println("	[PostController-@ResponseBody] postFormList() ");
		System.out.printf("		카테고리:%s\n",tabType);
		System.out.printf("		페이지:%s\n",nowPage);
		System.out.printf("		마이페이지 여부 => %s\n",mypage);
		System.out.printf("		postsArray => %s\n",postsArray);
		
		List<String> postsList =  Arrays.asList(postsArray.split(","));  
		System.out.printf("		postsList.size() => %d\n",postsList.size());
		System.out.printf("		postsList.isEmpty => %s\n",postsList.isEmpty());
		boolean hasValue = false;

		if (postsList != null) {
		    for (int i = 0; i < postsList.size(); i++) {
		        String s = postsList.get(i);
		        if (s != null && !s.isEmpty()) {
		            hasValue = true;
		            break; // 하나라도 값이 있으면 확인 끝
		        }
		    }
		}

		if (hasValue) {
		    System.out.println("실제 값 있음");
		} else {
		    System.out.println("값 없음 또는 빈 리스트");
		    postsList=null;
		}

		System.out.printf("		postsList => %s\n",postsList);
		Map<String,Object>map =new HashMap<String, Object>();
		map.put("postsList",postsList );
		map.put("post_category",tabType);
		map.put("login_mem_idx", 0);
		map.put("mypage",mypage);
		MemVo memVo=(MemVo)httpsesion.getAttribute("user");
		if(memVo!=null) {
		int mem_idx=memVo.getMem_idx();
		map.put("login_mem_idx", mem_idx);
		}
		map.put("nowPage", nowPage);
		

		if(tabType.equals("all")) {
			//커뮤니티 리스트 가져오기
			map=postService.selectPostList(map);
			List<PostVo> postVo_array=(List<PostVo>) map.get("postVo_array");
			System.out.printf("			[전체_%d]%s\n",postVo_array.size(),postVo_array);
			
		}else if(tabType.equals("skin")) {
			//스킨에디터 리스트 가져오기
			map=postService.selectTipList(map);
			List<PostVo> postTip_array=(List<PostVo>) map.get("postTip_array");
			System.out.printf("			[스킨에디터_%d]%s\n",postTip_array.size(),postTip_array);
		}else if(tabType.equals("review")) {
			//리뷰 리스트 가져오기
			map=postService.selectReviewList(map);
			List<PostVo> postReview_array=(List<PostVo>) map.get("postReview_array");
			System.out.printf("			[리뷰_%d]%s\n",postReview_array.size(),postReview_array);
		}else if(tabType.equals("free")) {
			//자유게시판 리스트 가져오기
			map=postService.selectFreeBoard(map);
			List<PostVo> postFreeBoard_array=(List<PostVo>) map.get("postFreeBoard_array");
			System.out.printf("			[자유게시판_%d]%s\n",postFreeBoard_array.size(),postFreeBoard_array);
			
		}
		
		
		System.out.println("	[PostController] return : map ");
		System.out.println("");
		return map;
	}
	
	//post 등록 폼
	@GetMapping("/post/insert")
	public String postInsertForm(Model model,@RequestParam(defaultValue = "skin") String category,@RequestParam(defaultValue = "0") int product_idx,@RequestParam(defaultValue = "0") int order_item_id) {
		System.out.println("	[PostController] postInsertForm() ");
		System.out.println("	리뷰 => " +category);
		System.out.println("	상품 idx => " +product_idx);
		
		// 주문 내역 확인하기
		// mem_idx product_idx
		MemVo memVo=(MemVo)httpsesion.getAttribute("user");
		int mem_idx=memVo.getMem_idx();
		System.out.println("	회원idx => " +mem_idx);
		if(category.equals("review")) {
			//오더 정보 가져오기 
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mem_idx", mem_idx);
			map.put("product_idx", product_idx);
			map.put("order_item_id", order_item_id);
			ReviewVo reviewOrderVo=postDao.selectReviewOrderOne(map); // 주문 정보 가져오기
			System.out.printf("		reviewOrderVo => %s\n",reviewOrderVo);
			// 주문 내역이 있는지 체크
			if(reviewOrderVo==null) {
				System.out.printf("주문 내역이 없음 체크\n");
				return"redirect:/product/detail?id="+product_idx+"&msg=not_order";
			}
			// post 에도 있는지 체크
			PostVo postOrderItemIdCheck=postDao.selectPostOrderItemOne(reviewOrderVo.getOrder_item_id());
			if(postOrderItemIdCheck!=null) {
				System.out.printf("		post에 내역 있음 => %s\n",postOrderItemIdCheck);
				return "redirect:/product/detail?id="+product_idx+"&msg=use_post_review";
				
			}else {
				System.out.printf("		post에 내역 없음\n");
				model.addAttribute("reviewOrderVo", reviewOrderVo);
			}
		}
		
		
		//등록 페이지 갈때 상품 목록데이터 보내주기
		List<ProductVo> product_list_array=postDao.selectProductList();
		model.addAttribute("product_idx",product_idx);
		System.out.printf("		productList(%d):%s\n",product_list_array.size(),product_list_array);
		model.addAttribute("product_list_array", product_list_array);
		model.addAttribute("mem_idx", mem_idx);
		model.addAttribute("review_product_idx", product_idx);
		model.addAttribute("category",category);
		System.out.println("	[PostController] /post/post_insert.jsp ");
		System.out.println("");
		return "/post/post_insert";
	}
	
	//post 등록하기
	@PostMapping("/post/insert")
	public String postInsert(PostVo postVo,String[] post_hashtag_array,int review_product_idx,@RequestParam(defaultValue = "0") int order_item_id ) throws Exception {
		System.out.println("	[PostController] postInsert() ");
		  if (post_hashtag_array != null) {
		        for (int i = 0; i < post_hashtag_array.length; i++) {
		            if (post_hashtag_array[i] != null) {
		                // 앞뒤 공백 제거 + 문자 사이 공백 제거
		                post_hashtag_array[i] = post_hashtag_array[i].trim().replaceAll("\\s+", "");
		            }
		        }
		    }
		if(postVo.getPost_category().equals("review")) {
		//받아온 오더 아이템 정보 체크
		System.out.printf("		order_item_id => %d\n",order_item_id);
		postVo.setOrder_item_id(order_item_id);
		}
		MemVo memVo=(MemVo)httpsesion.getAttribute("user");
		postVo.setMem_idx(memVo.getMem_idx());
		postVo.setPost_content(postVo.getPost_content().replaceAll("\n", "<br>"));
		System.out.println("		"+postVo);
		//받아온 해시정보 체크
		
		postService.postInsert(postVo,post_hashtag_array);
		
		
		if(order_item_id>0) {
			System.out.println("	[PostController] redirect:/product/detail?id=product_idx");
			System.out.println("");
			return "redirect:/product/detail?id="+review_product_idx;
		}
		System.out.println("	[PostController] redirect:/post/list");
		System.out.println("");
		return"redirect:/post/list";
	}
		
	//좋아요 ajax 통신을 통해서 좋아요 추가 좋아요 삭제 처리
	@RequestMapping("/post/postLike")
	@ResponseBody
	public Map<String, Object> postLikeUpdate(String post_idx){
		System.out.println("	[PostController-@ResponseBody] postLikeUpdate() ");
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.printf("		post_idx:%s\n",post_idx);
		map.put("post_idx", post_idx);
		MemVo memVo=(MemVo)httpsesion.getAttribute("user");
		System.out.printf("		memVo:%s\n",memVo);
		
		if(memVo==null) {
			System.out.println("memVo가 null 입니다.");
			map.put("bMemVo", false);
			return map;
		}else {
			map.put("bMemVo",true);
		}
		int mem_idx=memVo.getMem_idx();
		map.put("mem_idx", mem_idx);
		try {
			map = postService.postLikeUpdate(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("error",e.getMessage() );
		}
		System.out.println("	[PostController-@ResponseBody] return : map");
		System.out.println("");
		return map;
	}
	
	//post 수정하기 페이지로 이동
	@GetMapping("/post/modify")
	public String postModifyForm(int post_idx,Model model) {
		System.out.printf("	[PostController] postModifyForm(post_idx=%d)\n",post_idx);
		MemVo memVo=(MemVo)httpsesion.getAttribute("user");
		PostVo postVo=postDao.selectPostOne(post_idx);
		if(postVo.getMem_idx()==memVo.getMem_idx()) {
			
		postVo.setPost_content(postVo.getPost_content().replaceAll("<br>", "\n"));
		System.out.printf("		postVo => %s\n",postVo);
		List<PostProductVo> postProductVo=postDao.selectPostProductOne(post_idx);
		System.out.printf("		postProductVo =>%s\n",postProductVo);
		
		
		//등록 페이지 갈때 상품 목록데이터 보내주기
		List<ProductVo> product_list_array=postDao.selectProductList();
		System.out.printf("		productList(%d개):%s\n",product_list_array.size(),product_list_array);
		
		//post_idx 기준으로 해시태그 정보 1개 가져오기
		List<String> hasgtagVo_list_array=hashtagDao.selectHashNamesByPost(post_idx);
		System.out.printf("		hasgtagVo_list_array(%d개):%s\n",hasgtagVo_list_array.size(),hasgtagVo_list_array);
		
		
		model.addAttribute("hasgtagVo_list_array", hasgtagVo_list_array);
		model.addAttribute("product_list_array", product_list_array);
		model.addAttribute("postVo", postVo);
		model.addAttribute("postProductVo", postProductVo);
		}else {
			return"redirect:/post/list";
		}
		
		
		
		System.out.println("	[PostController] return : /post/post_modify");
		System.out.println("");
		return"/post/post_modify";
	}
	
	//post modify 버튼 클릭시 수정처리
	@PostMapping("/post/modify")
	public String postModify(PostVo postVo,String[] post_hashtag_array,RedirectAttributes ra)  {
		System.out.printf("	[PostController] postModify()\n");
		//공백제거  
		if (post_hashtag_array != null) {
		        for (int i = 0; i < post_hashtag_array.length; i++) {
		            if (post_hashtag_array[i] != null) {
		                // 앞뒤 공백 제거 + 문자 사이 공백 제거
		                post_hashtag_array[i] = post_hashtag_array[i].trim().replaceAll("\\s+", "");
		            }
		        }
		    }
		
		System.out.printf("		postVo => %s\n",postVo);
		int hashtagLength = (post_hashtag_array != null) ? post_hashtag_array.length : 0;
	    System.out.printf(" 	post_hashtag_array 갯수 => %d (null 가능)\n", hashtagLength);
		
		try {
			int res=postService.updatePostVo(postVo,post_hashtag_array);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ra.addAttribute("error","db_not");
			ra.addAttribute("post_idx",postVo.getPost_idx());
			System.out.println("에러메세지"+e.getMessage());
			return "redirect:/post/modify";
		}
		System.out.println("	[PostController] return : /post/post_modify");
		System.out.println("");
		return "redirect:/post/list";
	}
	
	//post delete 버튼클릭시 삭제처리
	@RequestMapping("/post/delete")
	@ResponseBody
	public Map<String,Object>  postDeleteOne(int post_idx) {
		System.out.printf("	[PostController] postDeleteOne()\n");
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("post_idx", post_idx);
		PostVo postVo=postDao.selectPostOne(post_idx);
		System.out.println(postVo);
		String post_image=postVo.getPost_image();
		String[] post_images=post_image.split("\\*");
		String absPath=application.getRealPath("/images/posts");
		for(String imageName : post_images) {
			File f=new File(absPath,imageName);
			System.out.println(imageName);
			f.delete();
		}
		int res = postDao.deletePost(map);
		
		
		
		map.put("post_delete",res==1);
		System.out.printf("	[PostController] return : map(post_idx,post_delete)\n");
		return map;
	}
	
	// post 댓글 목록 가져오기
	@RequestMapping("/post/reply_list")
	@ResponseBody
	public Map<String, Object> postReplyList(int post_idx, String post_category, @RequestParam(defaultValue = "1") int nowReplyPage){
		System.out.printf("		[PostController-@ResponseBody] postReplyList()\n");
		System.out.printf("post_idx => %d , post_category => %s , nowReplyPage => %d\n",post_idx,post_category,nowReplyPage);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("post_idx", post_idx);
		map.put("post_category", post_category);
		map.put("nowReplyPage", nowReplyPage);
		map=replyService.selectReplyList(map);
		
		
		System.out.printf("		[PostController-@ResponseBody] return : map\n");
		System.out.printf("\n");
		return map;
	}
	
	//post 댓글 등록 처리
	@RequestMapping("/post/reply")
	@ResponseBody
	public Map<String,Object> postReplyInsert(ReplyVo replyVo){
		System.out.printf("	[PostController-@ResponseBody] postReplyInsert()\n");
		Map<String,Object> map = new HashMap<String, Object>();
		int post_idx=replyVo.getPost_idx();
		System.out.printf("		post_idx=>%d\n",post_idx);
		int login_mem_idx=replyVo.getMem_idx();
		System.out.printf("		login_mem_idx=>%d\n",login_mem_idx);
		String reply_content=replyVo.getReply_content();
		System.out.printf("		reply_content=>%s\n",reply_content);
		//map.put("post_idx", post_idx);
		//map.put("login_mem_idx",login_mem_idx);
		//map.put("reply_content",reply_content);
		replyDao.insertPostReply(replyVo);
		
		System.out.printf("	[PostController] return : map");
		System.out.printf("\n");
		return map;
	}
	
	//댓글 수정 버튼 클릭
	@RequestMapping("/post/reply_modify")
	@ResponseBody
	public Map<String,Object> postReplyModify(ReplyVo replyVo){
		System.out.printf("	[PostController-@ResponseBody] postReplyModify()\n");
		System.out.printf("		reply_idx => %d\n",replyVo.getReply_idx());
		System.out.printf("		reply_content => %s\n",replyVo.getReply_content());
		
		Map<String,Object> map = new HashMap<String, Object>();
		int res=replyDao.updatePostReply(replyVo);
		map.put("res", res==1);
		System.out.printf("	[PostController-@ResponseBody] return map \n");
		System.out.printf("	\n");
		return map;
		
	}

	//댓글 삭제 버튼 클릭
	@RequestMapping("/post/reply_delete")
	@ResponseBody
	public Map<String,Object> postReplyDelete(int reply_idx){
		System.out.printf("	[PostController-@ResponseBody] postReplyDelete()\n");
		System.out.printf("		reply_idx => %d\n",reply_idx);
		
		Map<String,Object> map = new HashMap<String, Object>();
		int res=replyDao.deletePostReply(reply_idx);
		map.put("res", res==1);
		System.out.printf("	[PostController-@ResponseBody] return map \n");
		System.out.printf("	\n");
		return map;
		
	}
	
	// 나의 post 목록
	@RequestMapping("/post/mypost_list")
	public String myPostList() {
		System.out.printf("	[PostController] myPostList()\n");
		System.out.printf("	[PostController] return : /post/post_mypage_list\n");
		return "/post/post_mypage_list";
	}
	
	
}
