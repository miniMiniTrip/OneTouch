package com.onetouch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.onetouch.dao.QnaDao;
import com.onetouch.vo.QnaVo;

@Controller
public class QnaController {

    @Autowired
    private QnaDao qnaDao;

    
    
    // 1️ Q&A 목록 페이지
    @GetMapping("/qna/list")
    public String list(Model model) {
        List<QnaVo> qnaList = qnaDao.selectQnaList();
        
        System.out.println("qna/list");
        
        model.addAttribute("qnaList", qnaList);
        return "qna/qna_list";  // /WEB-INF/views/qna/qna_list.jsp
    }

    // 2️ Q&A 상세 페이지
    @GetMapping("/qna/detail")
    public String detail(int qna_idx, Model model) {
        QnaVo qna = qnaDao.selectQnaDetail(qna_idx);
        
        
        
        model.addAttribute("qna", qna);
        return "qna/qna_detail";
    }

    
    //--------------------------------이게맞나----------------------------------
    // 3️ Q&A 작성 폼 이동

//	@GetMapping("/qna/write")
//	public String writeForm() {
//		System.out.println("qna/write");
//		return "qna/qna_write";
//	}
//
//	
//	
//	@PostMapping("/qna/write")   // <-- 폼 action과 동일하게
//	public String insertQna(QnaVo vo) {
//	    qnaDao.insertQna(vo);
//	    return "redirect:/qna/list";
//	}
    
    @PostMapping("/qna/write")
    public String insertQna(QnaVo vo) {
        int result = qnaDao.insertQna(vo); // 등록 건수 반환
        if(result > 0) {
            return "redirect:/qna/list"; // 성공하면 리스트로 이동
        } else {
            return "qna/qna_write"; // 실패하면 작성 페이지 유지
        }
    }
	
}
