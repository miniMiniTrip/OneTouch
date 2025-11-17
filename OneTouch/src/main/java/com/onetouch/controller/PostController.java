package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onetouch.dao.PostDao;
import com.onetouch.service.PostService;
import com.onetouch.vo.MemVo;
import com.onetouch.vo.PostVo;
import com.onetouch.vo.ProductVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class PostController {

	@Autowired
	PostService postService;
	
	@Autowired
	HttpSession httpsesion;
	
	@Autowired
	PostDao postDao;
	
	
	
	//커뮤니티 전체목록 열기
	@RequestMapping("/post/list")
	public String postFormList(Model model) {
		System.out.println("	[PostController] postFormList() ");
		//커뮤니티 리스트 가져오기
		List<PostVo> postVo_array=postService.selectPostList();
		System.out.printf("			[전체_%d]%s\n",postVo_array.size(),postVo_array);
		//스킨에디터 리스트 가져오기
		List<PostVo> postTip_array=postService.selectTipList();
		System.out.printf("			[스킨에디터_%d]%s\n",postTip_array.size(),postTip_array);
		//리뷰 리스트 가져오기
		List<PostVo> postReview_array=postService.selectReviewList();
		System.out.printf("			[리뷰_%d]%s\n",postReview_array.size(),postReview_array);
		//자유게시판 리스트 가져오기
		List<PostVo> postFreeBoard_array=postService.selectFreeBoard();
		System.out.printf("			[자유게시판_%d]%s\n",postFreeBoard_array.size(),postFreeBoard_array);
		model.addAttribute("postVo_array",postVo_array);
		model.addAttribute("postSkin_array",postTip_array);
		model.addAttribute("postReview_array",postReview_array);
		model.addAttribute("postFree_array",postFreeBoard_array);
		
		System.out.println("	[PostController] return : /post/post.jsp ");
		System.out.println("");
		return "/post/post";
	}
	
	//post 등록 폼
	@GetMapping("/post/insert")
	public String postInsertForm(Model model) {
		System.out.println("	[PostController] postInsertForm() ");
		
		//등록 페이지 갈때 상품 목록데이터 보내주기
		List<ProductVo> product_list_array=postDao.selectProductList();
		System.out.printf("		productList(%d):%s\n",product_list_array.size(),product_list_array);
		model.addAttribute("product_list_array", product_list_array);
		
		System.out.println("	[PostController] /post/post_insert.jsp ");
		System.out.println("");
		return "/post/post_insert";
	}
	
	//post 등록하기
	@PostMapping("/post/insert")
	public String postInsert(PostVo postVo) throws Exception {
		System.out.println("	[PostController] postInsert() ");
		MemVo memVo=(MemVo)httpsesion.getAttribute("user");
		postVo.setMem_idx(memVo.getMem_idx());
		postVo.setPost_content(postVo.getPost_content().replaceAll("\n", "<br>"));
		System.out.println("		"+postVo);
		postService.postInsert(postVo);
		
		
		System.out.println("	[PostController] redirect:/post/list");
		System.out.println("");
		return"redirect:/post/list";
	}
	
	
	//좋아요 ajax 통신을 통해서 좋아요 추가 좋아요 삭제 처리
	@RequestMapping("/post/postLike")
	@ResponseBody
	public Map<String, Object> postLikeUpdate(String post_idx){
		System.out.println("	[PostController] postLikeUpdate() ");
		System.out.println("		[@ResponseBody] ");
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.printf("		post_idx:%s\n",post_idx);
		map.put("post_idx", post_idx);
		MemVo memVo=(MemVo)httpsesion.getAttribute("user");
		System.out.printf("		memVo:%s\n",memVo);
		int mem_idx=memVo.getMem_idx();
		map.put("mem_idx", mem_idx);
		try {
			map = postService.postLikeUpdate(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("error",e.getMessage() );
		}
		System.out.println("	[PostController] return : map");
		System.out.println("");
		return map;
	}
	@RequestMapping("/post/postLikeNotUser")
	public String postLikeNotUser() {
		return "";
	}
	
	
	
	
	
}
