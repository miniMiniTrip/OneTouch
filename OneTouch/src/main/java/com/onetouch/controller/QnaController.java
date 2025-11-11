package com.onetouch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.dao.QnaDao;
import com.onetouch.vo.MemVo;
import com.onetouch.vo.QnaVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class QnaController {

    @Autowired
    private QnaDao qnaDao;

    @Autowired
    private HttpSession session;
    
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
    	MemVo user=(MemVo)session.getAttribute("user");
    	int mem_idx=user.getMem_idx();
        List<QnaVo> qna_list = qnaDao.selectQnaList(mem_idx);
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
		System.out.printf("qna추가 vo:%s\n",vo);
	    qnaDao.insertQna(vo);
	    return "redirect:/qna/list"; //목록으로 이동
	}
    
	
	//4. 수정 폼 보기
	@GetMapping("/qna/modify")
	public String modifyForm(@RequestParam int qna_idx, Model model) {
	    QnaVo qna = qnaDao.selectQnaDetail(qna_idx);
	    
	    // 답변이 완료된 경우 수정 불가 (선택사항)
	    if (qna.isQna_answered()) {
	        return "redirect:/qna/detail?qna_idx=" + qna_idx;
	    }
	    
	    model.addAttribute("qna", qna);
	    return "qna/qna_modify";  // ✅ qna_modify.jsp
	}

	// 수정 처리
	@PostMapping("/qna/modify")
	public String modify(QnaVo vo) {
	    qnaDao.updateQna(vo);
	    return "redirect:/qna/detail?qna_idx=" + vo.getQna_idx();
	}
	
	// 삭제 처리
	@GetMapping("/qna/delete")
	public String delete(@RequestParam int qna_idx) {
	    System.out.println("=== QnA 삭제 ===");
	    System.out.println("삭제할 번호: " + qna_idx);
	    
	    qnaDao.deleteQna(qna_idx);
	    return "redirect:/qna/list";
	}
}
