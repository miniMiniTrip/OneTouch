package com.onetouch.vo;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("MemVo")
public class MemVo {
	int    mem_idx;				//회원번호
	String mem_id; 				//아이디
	String mem_pw;				//비밀번호
	String mem_name;			//이름
	String mem_postal;			//우편번호
	String mem_addr;			//주소
	String mem_addr_more;		//상세주소          
	String mem_email;			//이메일
	String mem_roll;			//권한
	String mem_birth;			//생년월일
	String mem_phone;			//전화
	String mem_time;			//회원가입일자
	String mem_update_time;		//회원정보수정일자
	String mem_image_url;		//회원이미지
	MultipartFile mem_image;	//회원가입시 jsp에서 받아온데이터
	
}