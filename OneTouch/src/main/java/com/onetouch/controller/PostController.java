package com.onetouch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onetouch.service.PostService;
import com.onetouch.vo.PostVo;

@Controller
public class PostController {

	@Autowired
	PostService postService;
	
	//커뮤니티 전체목록 열기
	@RequestMapping("/post/list")
	public String postFormList(Model model) {
		System.out.println("	[PostController] postFormList() ");
		
		//커뮤니티 리스트 가져오기
		List<PostVo> postVo_array=postService.selectPostList();
		
		model.addAttribute("postVo_array",postVo_array);
		System.out.println("	[PostController] return : /post/post.jsp ");
		return "/post/post";
	}
	
	//
}
