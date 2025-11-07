package com.onetouch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/hashtag/modify_form.do")
	public String modify_form() {
		return "hashtag/hashtag_modify_form";
	};
	
	@RequestMapping("/hashtag/modify.do")
	public String modify() {
		
		
		return "hashtag/hashtag_modify";
	};
	
	@RequestMapping("/hashtag/delete.do")
	public String delete() {
		return "hashtag/hashtag_delete";
	};
	
	
	
}
