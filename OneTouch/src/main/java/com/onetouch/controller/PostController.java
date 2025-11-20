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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onetouch.common.MyConstant;
import com.onetouch.dao.PostDao;
import com.onetouch.service.PostService;
import com.onetouch.util.Paging;
import com.onetouch.vo.MemVo;
import com.onetouch.vo.PostProductVo;
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
	public String postFormList(Model model,@RequestParam(name="page",defaultValue="1")int nowPage) {
		System.out.println("	[PostController] postFormList() ");
		
//		Map<String,Object>map =new HashMap<String, Object>();
//		map.put("nowPage", nowPage);
//		
//		//커뮤니티 리스트 가져오기
//		map=postService.selectPostList(map);
//		List<PostVo> postVo_array=(List<PostVo>) map.get("postVo_array");
//		System.out.printf("			[전체_%d]%s\n",postVo_array.size(),postVo_array);
//				
//				
//		
//		//스킨에디터 리스트 가져오기
//		map=postService.selectTipList(map);
//		List<PostVo> postTip_array=(List<PostVo>) map.get("postTip_array");
//		System.out.printf("			[스킨에디터_%d]%s\n",postTip_array.size(),postTip_array);
//		//리뷰 리스트 가져오기
//		map=postService.selectReviewList(map);
//		List<PostVo> postReview_array=(List<PostVo>) map.get("postReview_array");
//		System.out.printf("			[리뷰_%d]%s\n",postReview_array.size(),postReview_array);
//		//자유게시판 리스트 가져오기
//		map=postService.selectFreeBoard(map);
//		List<PostVo> postFreeBoard_array=(List<PostVo>) map.get("postFreeBoard_array");
//		System.out.printf("			[자유게시판_%d]%s\n",postFreeBoard_array.size(),postFreeBoard_array);
//		model.addAttribute("postVo_array",postVo_array);
//		model.addAttribute("postSkin_array",postTip_array);
//		model.addAttribute("postReview_array",postReview_array);
//		model.addAttribute("postFree_array",postFreeBoard_array);
//		
		System.out.println("	[PostController] return : /post/post.jsp ");
		System.out.println("");
		return "/post/post";
	}
	
	//커뮤니티 전체목록 열기
	@RequestMapping("/post/all_list")
	@ResponseBody
	public Map<String,Object> postFormAllList(Model model,@RequestParam(name="page",defaultValue="1")int nowPage
			,String tabType) {
		System.out.println("	[PostController-@ResponseBody] postFormList() ");
		System.out.printf("		카테고리:%s\n",tabType);
		Map<String,Object>map =new HashMap<String, Object>();
		
		map.put("login_mem_idx", 0);
		MemVo memVo=(MemVo)httpsesion.getAttribute("user");
		if(memVo!=null) {
		int mem_idx=memVo.getMem_idx();
		map.put("login_mem_idx", mem_idx);
		}
		map.put("nowPage", nowPage);
		
		//커뮤니티 리스트 가져오기
		map=postService.selectPostList(map);
		List<PostVo> postVo_array=(List<PostVo>) map.get("postVo_array");
		System.out.printf("			[전체_%d]%s\n",postVo_array.size(),postVo_array);
				
				
		
		//스킨에디터 리스트 가져오기
		map=postService.selectTipList(map);
		List<PostVo> postTip_array=(List<PostVo>) map.get("postTip_array");
		System.out.printf("			[스킨에디터_%d]%s\n",postTip_array.size(),postTip_array);
		//리뷰 리스트 가져오기
		map=postService.selectReviewList(map);
		List<PostVo> postReview_array=(List<PostVo>) map.get("postReview_array");
		System.out.printf("			[리뷰_%d]%s\n",postReview_array.size(),postReview_array);
		//자유게시판 리스트 가져오기
		map=postService.selectFreeBoard(map);
		List<PostVo> postFreeBoard_array=(List<PostVo>) map.get("postFreeBoard_array");
		System.out.printf("			[자유게시판_%d]%s\n",postFreeBoard_array.size(),postFreeBoard_array);
		
		System.out.println("	[PostController] return : map ");
		System.out.println("");
		return map;
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
	public String postModify(PostVo postVo) throws Exception {
		System.out.printf("	[PostController] postModify()\n");
		System.out.printf("		%s\n",postVo);
		int res=postService.updatePostVo(postVo);
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
		int res = postDao.deletePost(map);
		map.put("post_delete",res==1);
		System.out.printf("	[PostController] return : map(post_idx,post_delete)\n");
		return map;
	}
	
	
	
	
}
