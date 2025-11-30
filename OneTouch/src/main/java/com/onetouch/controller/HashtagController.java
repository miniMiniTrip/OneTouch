package com.onetouch.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.dao.HashtagDao;
import com.onetouch.dao.PostDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.vo.HashtagVo;
import com.onetouch.vo.PostVo;
import com.onetouch.vo.ProductVo;


@Controller
public class HashtagController {
	
	@Autowired
	HashtagDao hashtag_dao;
	
	@Autowired
	ProductDao product_dao;
	
	@Autowired
	PostDao post_dao;
	
	@RequestMapping("/hashtag/list.do")
	public String list(Model model) {
		List<HashtagVo> hashtag_list = hashtag_dao.selectList();
		model.addAttribute("hashtag_list", hashtag_list);
		return "hashtag/hashtag_list";
	};
	
	@RequestMapping("/hashtag/insert_form.do")
	public String insert_form() {
		return "hashtag/hashtag_insert_form";
	};
	
	
	@RequestMapping("/hashtag/insert.do")
	public String insertOne(HashtagVo vo) {
		String hashtag_name = vo.getHashtag_name().trim();
		vo.setHashtag_name(hashtag_name);
		
		System.out.println(hashtag_name);
		int res = hashtag_dao.insertOne(vo);

		return "redirect:list.do";
	};
	
	@RequestMapping("/hashtag/delete.do")
	public String delete(int hashtag_idx) {
		int res = hashtag_dao.delete(hashtag_idx);
		return "redirect:list.do";
	};

	@RequestMapping("/hashtag/search.do")
    public String searchProductsByHashtag(@RequestParam("hashtag_idx") int hashtag_idx, 
            Model model) {
		HashtagVo hashtag = hashtag_dao.selectOne(hashtag_idx);
		
		//상품 리스트 조회
		List<Integer> product_idx_list = hashtag_dao.selectProductByHashtag(hashtag_idx);
		List<ProductVo> product_list = new ArrayList<>();
		if(product_idx_list != null && !product_idx_list.isEmpty()) {
			product_list = product_dao.selectByIds(product_idx_list);
		}
		
		for(ProductVo p : product_list) {
			System.out.printf("      - 상품 [%d] %s, 이미지: %s\n", 
				p.getProduct_idx(), 
				p.getProduct_name(), 
				p.getProduct_image_url());
		}
		
		//커뮤니티 글 리스트 조회
	    List<Integer> post_idx_list = hashtag_dao.selectPostByHashtag(hashtag_idx);
	    List<PostVo> post_list = new ArrayList<>();
	    if(post_idx_list != null && !post_idx_list.isEmpty()) {
	        post_list = post_dao.selectByIds(post_idx_list); // 이 메서드 필요
	    }
		
		model.addAttribute("hashtag",hashtag);
		model.addAttribute("product_list",product_list);
		model.addAttribute("post_list", post_list);
		model.addAttribute("search_type","hashtag");
		
    	return "hashtag/search_result";
   }
    

    // 단일 해시태그로 게시글 검색 (클릭) not yet
    public List<Integer> searchPostsByHashtag(int hashtag_idx) {
        return hashtag_dao.selectPostByHashtag(hashtag_idx);
    }
    

    // 여러 해시태그로 상품 추천 (문진) //test OK

    public List<Integer> recommendProductsByHashtags(
            List<Integer> hashtagIds, int minMatch, Integer limit) {
        
        if (hashtagIds == null || hashtagIds.isEmpty()) {
            return new ArrayList<>();
        }
        
        Map<String, Object> params = new HashMap<>();
        params.put("hashtag_list", hashtagIds);
        params.put("min_match", minMatch);
        params.put("limit", limit);
        
        return hashtag_dao.selectProductsByHashtags(params);
    }
    

    
    
    
    //여러 해시태그로 게시글 추천 (문진) not yet

    public List<Integer> recommendPostsByHashtags(
            List<Integer> hashtagIds, int minMatch, Integer limit) {
        
        if (hashtagIds == null || hashtagIds.isEmpty()) {
            return new ArrayList<>();
        }
        
        Map<String, Object> params = new HashMap<>();
        params.put("hashtag_list", hashtagIds);
        params.put("min_match", minMatch);
        params.put("limit", limit);
        
        return hashtag_dao.selectPostsByHashtags(params);
    }
    

	
}
