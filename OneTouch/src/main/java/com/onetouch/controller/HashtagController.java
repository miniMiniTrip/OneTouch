package com.onetouch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onetouch.dao.HashtagDao;
import com.onetouch.vo.HashtagVo;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HashtagController {
	
	
	@RequestMapping("/hashtag/list.do")
	public String list(Model model) {
		//Map<String,Object> map = new HashMap<String, Object>();
		//관리자한테 필요할까?
		return "hashtag/hashtag_list";
	};
	
	@RequestMapping("/hashtag/insert_form.do")
	public String insert_form() {
		return "hashtag/hashtag_insert_form";
	};
	
	@RequestMapping("/hashtag/insert.do")
	public String insert(HashtagVo vo) {
		return "hashtag/hashtag_insert";
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
