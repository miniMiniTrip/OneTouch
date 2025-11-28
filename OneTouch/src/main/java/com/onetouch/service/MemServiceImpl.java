package com.onetouch.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onetouch.dao.MemDao;
import com.onetouch.vo.MemVo;

import jakarta.servlet.ServletContext;

@Service
public class MemServiceImpl implements MemService {

	@Autowired
	MemDao memDao;
	@Autowired
	ServletContext application;
	
//	@Autowired
//	PasswordEncoder passwordEncoder;

	//로그인시 아이디와 비밀번호 체크하는 기능
	@Transactional(rollbackFor = Exception.class)
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

	// 회원가입
	@Override
	public int insert(MemVo memVo) throws Exception {
		//회원 이미지
		String webPath = "/images/mem/";
		String absPath = application.getRealPath(webPath);
		String p_filename="no_file";
		if(memVo.getMem_image()!=null) {
			p_filename=memVo.getMem_image().getOriginalFilename();
			System.out.printf("파일명 => \s\n",p_filename);
			File f = new File(absPath,p_filename); // 저장할 파일 정보(경로,파일이름)
			if(f.exists()){ // 같은 파일명이 존재하면
				long tm =System.currentTimeMillis();
				p_filename=String.format("%d_%s",tm,p_filename);
				
				f = new File(absPath,p_filename);
			}
			
			memVo.getMem_image().transferTo(f);
		}
		
		memVo.setMem_image_url(p_filename);
		
		int res=memDao.insert(memVo);
		return res;
	}
	
	// 아이디 찾기
	@Override
	public String findUserId(String name,String email) {
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("mem_name", name);
		map.put("mem_email", email);
		String mem_id=memDao.findUserId(map);
		return mem_id;
	}
	
	
	
	@Override
	/**아이디와 이메일로 memVo가져오기*/ 
    public MemVo findUserForPwReset(String mem_id, String mem_email) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mem_id", mem_id);
        map.put("mem_email", mem_email);
        return memDao.findUserForPwReset(map);
    }
	
	
	
	// 관리자 회원관리 부분
	@Override
	public List<MemVo> getMemberList(Map<String, Object> params) {
	    return memDao.getMemberList(params);
	}

	@Override
	public int getMemberCount(Map<String, Object> params) {
	    return memDao.getMemberCount(params);
	}

	@Override
	public int updateMemberRoll(Map<String, Object> params) {
	    return memDao.updateMemberRoll(params);
	}
}


