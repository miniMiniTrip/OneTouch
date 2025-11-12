package com.onetouch.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onetouch.dao.PostDao;
import com.onetouch.vo.PostVo;

import jakarta.servlet.ServletContext;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostDao postDao;
	@Autowired
	ServletContext application;
	
	@Override
	public List<PostVo> selectPostList() {
		List<PostVo> postVo_array=postDao.selectPostList();
		return postVo_array;
	}

	@Override
	public List<PostVo> selectTipList() {
		List<PostVo> postTip_array=postDao.selectTipList();
		return postTip_array;
	}

	@Override
	public List<PostVo> selectReviewList() {
		List<PostVo> postReview_array=postDao.selectReviewList();
		return postReview_array;
	}

	@Override
	public List<PostVo> selectFreeBoard() {
		List<PostVo> postFreeBoard_array=postDao.selectFreeBoard();
		return postFreeBoard_array;
	}

	@Override
	public int postInsert(PostVo postVo) throws Exception {
		
		//이미지 등록처리
		String webPath = "/images/";
		String absPath = application.getRealPath(webPath);
		//System.out.printf("		파일 저장 절대경로:%s\n",absPath);
		String p_filename="no_file";
		String full_image_name="";
		StringBuilder sb = new StringBuilder();
		if(postVo.getPost_images()!=null) {
			for(MultipartFile post_image:postVo.getPost_images()){
				p_filename=post_image.getOriginalFilename(); // 저장할 순수한 파일명
				
				File f = new File(absPath,p_filename); // 저장할 파일 정보(경로,파일이름)
				if(f.exists()){ // 같은 파일명이 존재하면
					long tm =System.currentTimeMillis();
					p_filename=String.format("%d_%s",tm,p_filename);
					
					f = new File(absPath,p_filename);
				}
				sb.append(p_filename);
				
				sb.append("*");
				
				post_image.transferTo(f); //MultipartFile에 임시로 저장된 파일을 내가 설정한 경로로 복사
			}
		}
		if(sb.toString().endsWith("*")) {
			full_image_name=sb.toString().substring(0,sb.toString().length()-1);
		}
		postVo.setPost_image(full_image_name);		
		
		int res =postDao.postInsert(postVo);
		
		return res;
	}
	

}
