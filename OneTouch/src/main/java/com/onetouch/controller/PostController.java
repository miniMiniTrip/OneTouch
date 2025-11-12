package com.onetouch.controller;

import java.util.List;

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
		System.out.printf("			[전체]%s\n",postVo_array);
		
		//스킨에디터 리스트 가져오기
		List<PostVo> postTip_array=postService.selectTipList();
		System.out.printf("			[스킨에디터]%s\n",postTip_array);
		//리뷰 리스트 가져오기
		List<PostVo> postReview_array=postService.selectReviewList();
		System.out.printf("			[리뷰]%s\n",postReview_array);
		//자유게시판 리스트 가져오기
		List<PostVo> postFreeBoard_array=postService.selectFreeBoard();
		System.out.printf("			[자유게시판]%s\n",postFreeBoard_array);
		model.addAttribute("postVo_array",postVo_array);
		model.addAttribute("postTip_array",postTip_array);
		model.addAttribute("postTip_array",postReview_array);
		model.addAttribute("postTip_array",postFreeBoard_array);
		
		System.out.println("	[PostController] return : /post/post.jsp ");
		System.out.println("");
		return "/post/post";
	}
	
	//post 등록 폼
	@GetMapping("/post/insert")
	public String postInsertForm() {
		System.out.println("	[PostController] postInsertForm() ");
		
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
		postService.postInsert(postVo);
		System.out.println("		"+postVo);
		
		System.out.println("	[PostController] redirect:/post/list");
		System.out.println("");
		return"redirect:/post/list";
	}
	
	//스킨케어팁 목록 화면 출력 열기
	@RequestMapping("/post/tiplist")
	@ResponseBody
	public String postTipList() {
		return "";
	}
	@RequestMapping("/post/reviewlist")
	@ResponseBody
	public String postReviewList() {
		return "";
	}
	@RequestMapping("/post/freeboard")
	@ResponseBody
	public String postFreeBoard() {
		return "";
	}
	
	
	
	
//	//모달창
//	@RequestMapping("/post/detail")
//	
//	public String postDetail() {
//		return "";
//	}
	
	
}
