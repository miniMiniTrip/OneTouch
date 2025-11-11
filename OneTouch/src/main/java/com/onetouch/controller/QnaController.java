package com.onetouch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.dao.QnaDao;
import com.onetouch.vo.QnaVo;

@Controller
public class QnaController {

    @Autowired
    private QnaDao qnaDao;

    
    
    // 1️ Q&A 목록 페이지
//    @GetMapping("/qna/list")
//    public String list(Model model) {
//        List<QnaVo> qnaList = qnaDao.selectQnaList();
//        
//        System.out.println("QnA 목록 개수: " + qnaList.size());  // 디버깅용
//        
//        model.addAttribute("qna_list", qnaList);  // ✅ qna_list로 변경
//        return "qna/qna_list";
//    }
//    
    
    
    
    @GetMapping("/qna/list")
    public String list(Model model) {
        List<QnaVo> qna_list = qnaDao.selectQnaList();
        System.out.println("QnA 목록 개수: " + qna_list.size());
        model.addAttribute("qna_list", qna_list); // ✅ 스네이크 표기
        return "qna/qna_list";
    }
    
    
    
    // 2️ Q&A 상세 페이지
//    @GetMapping("/qna/detail")
//    public String detail(int qna_idx, Model model) {
//        QnaVo qna = qnaDao.selectQnaDetail(qna_idx);
//        
//        
//        
//        model.addAttribute("qna", qna);
//        return "qna/qna_detail";
//    }
    
//    @GetMapping("/qna/view")
//    public String detail(@RequestParam int qna_idx, Model model) {
//        QnaVo qna = qnaDao.selectQnaDetail(qna_idx);
//        model.addAttribute("qna", qna);
//        return "qna/qna_detail"; // JSP 이름
//    }
    
    

    // 상세보기
    @GetMapping("/qna/detail")  // ✅ detail로 통일
    public String detail(@RequestParam int qna_idx, Model model) {
        QnaVo qna = qnaDao.selectQnaDetail(qna_idx);
        
        System.out.println("=== QnA 상세 조회 ===");
        System.out.println("번호: " + qna_idx);
        System.out.println("데이터: " + qna);
        
        model.addAttribute("qna", qna);
        return "qna/qna_detail";
    }
    

//    @GetMapping("/qna/view")  // "/qna/view"로 변경
//    public String detail(int qna_idx, Model model) {
//        QnaVo qna = qnaDao.selectQnaDetail(qna_idx);
//        model.addAttribute("qna", qna);
//        return "qna/qna_detail";
//    }
//    
    
    
    
    //--------------------------------이게맞나----------------------------------
    // 3️ Q&A 작성 폼 이동

	@GetMapping("/qna/write")
	public String writeForm() {
		System.out.println("qna/write");
		
		return "qna/qna_write";
		
	}
	
	
	
	@PostMapping("/qna/write")   // <-- 폼 action과 동일하게
	public String insertQna(QnaVo vo) {
	    qnaDao.insertQna(vo);
	    return "redirect:/qna/list"; //목록으로 이동
	}
    

	
}
