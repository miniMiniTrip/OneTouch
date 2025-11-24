package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.onetouch.dao.QnaDao;
import com.onetouch.service.QnaService;
import com.onetouch.vo.MemVo;
import com.onetouch.vo.QnaVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserQnaController {

	   
		@Autowired
	    private QnaDao qnaDao;
	    @Autowired
	    private HttpSession session;
	    @Autowired
	    private QnaService qnaService;
	    
	    // 1️ 관리자 Q&A 목록 페이지
	    @GetMapping("mypage/qna_list")
	    public String list(Model model) {
	    	System.out.println("	[QnaController] list() ");
	    	
	    	// 세션에서 로그인 정보 가져오기
	    	MemVo user = (MemVo) session.getAttribute("user");
	        
	        // ✅ 로그인하지 않은 경우 - 로그인 안내만 표시
	        if (user == null) {
	            model.addAttribute("needLogin", true);
	            return "redirect:/user/login";
	        }
	        
	        // 로그인한 사용자의 글만 조회
	        int mem_idx = user.getMem_idx();
	        String mem_roll = user.getMem_roll();
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("mem_idx", mem_idx);
	        map.put("mem_roll", mem_roll);
	        
	        List<QnaVo> qna_list = qnaDao.selectQnaList(map);
	        
	        System.out.println("QnA 목록 개수: " + qna_list.size());
	        
	        model.addAttribute("qna_list", qna_list);
	        model.addAttribute("needLogin", false);
	        
	        System.out.println("	[QnaController] return : qna/qna_list.jsp ");
	        System.out.println("");
	        return "qna/qna_list";
	    }
	    
	    
	 // 관리자 Q&A 답변 작성 폼 이동
	    @GetMapping("/mypage/qna_write")
	    public String qnaWrite(HttpSession session) {

	    	 // 로그인 체크
	        MemVo user = (MemVo) session.getAttribute("user");
	        
	        if (user == null) {
	            return "redirect:/user/login";
	        }
	        
	        
	        return "qna/qna_write"; // 관리자용 글쓰기 / 답변 폼
	    }
	    
	    
	    
	    
	 // 관리자 Q&A 작성 처리
	    @PostMapping("/mypage/qna_write")
	    public String insertQna(QnaVo vo) {
	        // 로그인 체크
	        MemVo user = (MemVo) session.getAttribute("user");
	        
	        if (user == null) {
	            return "redirect:/user/login";
	        }
	        
	        // 작성자 정보 설정
	        vo.setMem_idx(user.getMem_idx());
	        
	        System.out.printf("qna추가 vo:%s\n", vo);
	        qnaDao.insertQna(vo);
	        
	        return "redirect:/qna/qna_list";
	    }
	   
	    
	    
	    
	    
	    
	
	    
	
}
