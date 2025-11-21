package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	    
	    
	    
	    
	 // mypage Q&A 작성 처리
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
	        
	        return "redirect:/mypage/qna_list";
	    }
	   
	    
	    //// mypage Q&A 상세 페이지
	    @GetMapping("/mypage/detail")
	    public String detail(@RequestParam int qna_idx, Model model, RedirectAttributes redirectAttributes) {
	    	System.out.println("   [UserQnaController]detail()");
	        // 로그인 체크
	        MemVo user = (MemVo) session.getAttribute("user");
	        
	        if (user == null) {
	            return "redirect:/user/login"; 
	        }
	        
	        // Q&A 정보 조회
	        QnaVo qna = qnaDao.selectQnaDetail(qna_idx);
	        
	        System.out.println("=== QnA 상세 조회 ===");
	        System.out.println("번호: " + qna_idx);
	        System.out.println("데이터: " + qna);
	        
	        // 본인의 글인지 확인
	        System.out.println(!user.getMem_roll().equals("admin"));
	        if (qna == null || (qna.getMem_idx() != user.getMem_idx() && !"admin".equals(user.getMem_roll()))) {
	            System.out.println("접근 권한 없음 - 작성자: " + (qna != null ? qna.getMem_idx() : "null") + ", 현재 사용자: " + user.getMem_idx());
	            redirectAttributes.addFlashAttribute("errorMessage", "접근 권한이 없습니다.");
	            System.out.println("   [UserQnaController] redirect:mypage/qna_list (본인글 아닐때)");
		        System.out.println("");
	            return "redirect:mypage/qna_list";
	        }
	        
	        model.addAttribute("qna", qna);
	        System.out.println("   [UserQnaController] return : /qna/qna_detail.jsp ");
	        System.out.println("");
	        return "/qna/qna_detail";
	    }
	    
	   
	 
	    
//	   마이페이지  폼에서 답변 등록 처리
	    
	    @PostMapping("/mypage/qna_answer")
	    public String answerQna(
	            @RequestParam("qna_idx") int qna_idx,
	            @RequestParam("qna_answer_content") String qna_answer_content,
	            RedirectAttributes redirectAttributes) {
	        System.out.println("   [UserQnaController]answerQna()");
	        // 로그인 체크
	        MemVo user = (MemVo) session.getAttribute("user");
	        
	        if (user == null) {
	            return "redirect:/user/login"; 
	        }
	        try {
	            int result = qnaService.updateAnswer(qna_idx, qna_answer_content);
	            
	            if (result > 0) {
	                redirectAttributes.addFlashAttribute("message", "답변이 등록되었습니다.");
	            } else {
	                redirectAttributes.addFlashAttribute("error", "답변 등록에 실패했습니다.");
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            redirectAttributes.addFlashAttribute("error", "답변 등록 중 오류가 발생했습니다.");
	       
	        }
	       
	        System.out.println("   [UserQnaController] redirect:/mypage/detail?qna_idx=\" + qna_idx ");
	        System.out.println("");
	        return "redirect:/mypage/detail?qna_idx=" + qna_idx;
	    }
	    
	 // 관리자 Q&A 답변 삭제
	    @GetMapping("/mypage/qna_deleteAnswer")
	    public String deleteAnswer(@RequestParam("qna_idx") int qna_idx,
	                               RedirectAttributes redirectAttributes) {
	        
	        try {
	            int result = qnaService.deleteAnswer(qna_idx);
	            if (result > 0) {
	                redirectAttributes.addFlashAttribute("message", "답변이 삭제되었습니다.");
	            } else {
	                redirectAttributes.addFlashAttribute("error", "삭제에 실패했습니다.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            redirectAttributes.addFlashAttribute("error", "삭제 중 오류가 발생했습니다.");
	        }

	        return "redirect:/mypage/detail?qna_idx=" + qna_idx;  // ★ 수정된 부분
	    }
	
	    
	
}
