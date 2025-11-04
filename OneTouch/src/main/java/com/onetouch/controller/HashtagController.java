package com.onetouch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.dao.HashtagDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HashtagController {
	
	@Autowired
	HashtagDao hashtag_dao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/hashtag/list.do")
	public String list() {
		return "";
	};
	
	@RequestMapping("/hashtag/insert_form.do")
	public String insert_form() {
		return "";
	};
	
	@RequestMapping("/hashtag/insert.do")
	public String insert() {
		return "";
	};
	
	@RequestMapping("/hashtag/insert_form.do")
	public String modify_form() {
		return "";
	};
	
	@RequestMapping("/hashtag/insert_form.do")
	public String modify() {
		return "";
	};
	
	@RequestMapping("/hashtag/insert_form.do")
	public String delete() {
		return "";
	};
	
	
	
}
