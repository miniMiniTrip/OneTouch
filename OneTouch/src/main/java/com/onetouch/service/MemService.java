package com.onetouch.service;

import java.util.Map;

import com.onetouch.vo.MemVo;

public interface MemService {

	Map<String,Object> loginCheck(Map<String, Object> map);

	int insert(MemVo memVo) throws Exception;
	
	String findUserId(String name,String email);
	/**아이디와 이메일로 memVo가져오기*/
	MemVo findUserForPwReset(String mem_id, String mem_email);

	
}
