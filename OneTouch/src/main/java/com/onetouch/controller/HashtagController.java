package com.onetouch.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onetouch.dao.HashtagDao;
import com.onetouch.vo.HashtagVo;



@Controller
public class HashtagController {
	
	@Autowired
	HashtagDao hashtag_dao;
	
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
		System.out.println("작동은 했니?");
		String hashtag_name = vo.getHashtag_name().trim();
		vo.setHashtag_name(hashtag_name);
		
		System.out.println(hashtag_name);
		int res = hashtag_dao.insertOne(vo);
		
		System.out.println("잘 됐을걸");
		return "redirect:list.do";
	};
	
	@RequestMapping("/hashtag/delete.do")
	public String delete(int hashtag_idx) {
		int res = hashtag_dao.delete(hashtag_idx);
		return "redirect:list.do";
	};
	
	@GetMapping("/api/list")
	@ResponseBody
	public List<HashtagVo> getHashtagList() {
		return hashtagService.selectList();
	}
	

	@GetMapping("/api/post/{post_idx}")
	@ResponseBody
	public List<String> getHashtagsByPost(@PathVariable("post_idx") int post_idx) {
		return hashtagService.getHashtagNamesByPost(post_idx);
	}


     //단일 해시태그로 상품 검색 (클릭)
    public List<Integer> searchProductsByHashtag(int hashtag_idx) {
        return hashtag_dao.selectProductsByHashtag(hashtag_idx);
    }
    

    // 단일 해시태그로 게시글 검색 (클릭)
    public List<Integer> searchPostsByHashtag(int hashtag_idx) {
        return hashtag_dao.selectPostsByHashtag(hashtag_idx);
    }
    

    // 여러 해시태그로 상품 추천 (문진)

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
    

    //여러 해시태그로 게시글 추천 (문진)

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
