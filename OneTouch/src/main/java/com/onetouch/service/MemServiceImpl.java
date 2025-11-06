package com.onetouch.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.dao.MemDao;
import com.onetouch.vo.MemVo;

@Service
public class MemServiceImpl implements MemService {

	@Autowired
	MemDao memDao;
	

	@Override
	public Map<String,Object> loginCheck(Map<String, Object> map) {
		String mem_id=(String) map.get("mem_id");
		MemVo memVo=memDao.selectMemIdOne(mem_id);
		if(memVo==null) {
			map.put("mem_id_check", false);
			return map;
		}else {
		map.put("memVo",memVo);
		map.put("mem_id_check", true);
		}
		
		String mem_pwd_check=(String)map.get("mem_pwd_check");
		if(memVo.getMem_pw().equals(mem_pwd_check)) {
			map.put("mem_pw_check",true);
		}else{
			map.put("mem_pw_check",false);
		}
		
		return map;
	}
	
}
