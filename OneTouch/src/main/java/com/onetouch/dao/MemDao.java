package com.onetouch.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.MemVo;

@Mapper
public interface MemDao {
	public MemVo selectMemIdOne(String mem_id);
	public int insert(MemVo memVo);
	public MemVo selectMemEmailOne(String mem_email);
	public MemVo selectMemIdxOne(int mem_idx);
	/**회원 정보 수정*/
	int updateMem(MemVo memVo);
	
	//아이디 찾기
	String findUserId(Map<String,Object>map);
	
	/**아이디와 이메일로 memVo 정보가져오기*/
    MemVo findUserForPwReset(Map<String, Object> map);

    
    
    
   //관리자 회원관리 부분==========
 // 관리자 회원 목록 조회 (검색 포함)
    List<MemVo> getMemberList(Map<String, Object> params);

}
