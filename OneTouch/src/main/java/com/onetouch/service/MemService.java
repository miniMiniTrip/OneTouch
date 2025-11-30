package com.onetouch.service;

import java.util.List;
import java.util.Map;

import com.onetouch.vo.MemVo;

public interface MemService {

	Map<String,Object> loginCheck(Map<String, Object> map);

	int insert(MemVo memVo) throws Exception;
	
	String findUserId(String name,String email);
	/**아이디와 이메일로 memVo가져오기*/
	MemVo findUserForPwReset(String mem_id, String mem_email);

	int userUpdate(MemVo memVo) throws Exception;
	
	// 관리자 회원관리 부분
		List<MemVo> getMemberList(Map<String, Object> params);
		int getMemberCount(Map<String, Object> params);  // 추가
		int updateMemberRoll(Map<String, Object> params);  // 추가

		int userDelete();
	}
	
	
	
	
	
	

