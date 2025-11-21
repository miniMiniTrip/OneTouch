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
public class QnaController {

   
	@Autowired
    private QnaDao qnaDao;
    @Autowired
    private HttpSession session;
    @Autowired
    private QnaService qnaService;
    
   
    
    // 1️ 관리자 Q&A 목록 페이지
    @GetMapping("/admin/qna_list")
    public String list(Model model) {
    	System.out.println("	[QnaController] list() ");
    	
    	// 세션에서 로그인 정보 가져오기
    	MemVo user = (MemVo) session.getAttribute("user");
        
        // ✅ 로그인하지 않은 경우 - 로그인 안내만 표시
        if (user == null) {
            model.addAttribute("needLogin", true);
            //return "/admin/qna_list";
            return "redirect:/user/login ";
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
        return "admin/admin_qna_list";
    }
    
  
    
    
    
    // 2️⃣ 관리자 Q&A 상세 페이지
    @GetMapping("/admin/qna/detail")
    public String detail(@RequestParam int qna_idx, Model model, RedirectAttributes redirectAttributes) {
        // 로그인 체크
        MemVo user = (MemVo) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:admin/qna_list";
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
            return "redirect:admin/qna_list";
        }
        
        model.addAttribute("qna", qna);
        return "/admin/admin_qna_detail";
    }
    
   
    
    
 // 관리자 Q&A 답변 작성 폼 이동
    @GetMapping("/admin/qna/write")
    public String adminQnaWrite(HttpSession session) {

    	 // 로그인 체크
        MemVo user = (MemVo) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/admin/qna_list";
        }
        
        
        return "admin/admin_qna_write"; // 관리자용 글쓰기 / 답변 폼
    }
    
    
    
    
    // 관리자 Q&A 작성 처리
    @PostMapping("/admin/qna_write")
    public String insertQna(QnaVo vo) {
        // 로그인 체크
        MemVo user = (MemVo) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/qna/list";
        }
        
        // 작성자 정보 설정
        vo.setMem_idx(user.getMem_idx());
        
        System.out.printf("qna추가 vo:%s\n", vo);
        qnaDao.insertQna(vo);
        
        return "redirect:/admin/qna_list";
    }
   
    
    
    // 4️⃣ 수정 폼 보기
    @GetMapping("/qna/modify")
    public String modifyForm(@RequestParam int qna_idx, Model model, RedirectAttributes redirectAttributes) {
        // 로그인 체크
        MemVo user = (MemVo) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/qna/list";
        }
        
        QnaVo qna = qnaDao.selectQnaDetail(qna_idx);
        
        // 본인의 글인지 확인
        if (qna == null || qna.getMem_idx() != user.getMem_idx()) {
            redirectAttributes.addFlashAttribute("errorMessage", "접근 권한이 없습니다.");
            return "redirect:/qna/list";
        }
        
        // 답변이 완료된 경우 수정 불가
        if (qna.isQna_answered()) {
            redirectAttributes.addFlashAttribute("errorMessage", "답변 완료된 문의는 수정할 수 없습니다.");
            return "redirect:/qna/detail?qna_idx=" + qna_idx;
        }
        
        model.addAttribute("qna", qna);
        return "qna/qna_modify";
    }

  
    
    
    
    //    관리자 폼에서 답변 등록 처리
    @PostMapping("/admin/qna_answer")
    public String answerQna(
            @RequestParam("qna_idx") int qna_idx,
            @RequestParam("qna_answer_content") String qna_answer_content,
            RedirectAttributes redirectAttributes) {
        
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
        
        return "redirect:/admin/qna/detail?qna_idx=" + qna_idx;
    }


    
    // 관리자 Q&A 답변 삭제
    @GetMapping("/admin/qna/deleteAnswer")
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

        return "redirect:/admin/qna/detail?qna_idx=" + qna_idx;
    }
    
    
    
    
    
    
    
    
    
    
    // 유저  수정 처리
    @PostMapping("/qna/modify")
    public String modify(QnaVo vo, RedirectAttributes redirectAttributes) {
        // 로그인 체크
        MemVo user = (MemVo) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/qna/list";
        }
        
        // 기존 데이터 조회하여 본인 글인지 확인
        QnaVo qna = qnaDao.selectQnaDetail(vo.getQna_idx());
        
        if (qna == null || qna.getMem_idx() != user.getMem_idx()) {
            redirectAttributes.addFlashAttribute("errorMessage", "접근 권한이 없습니다.");
            return "redirect:/qna/list";
        }
        
        qnaDao.updateQna(vo);
        return "redirect:/qna/detail?qna_idx=" + vo.getQna_idx();
    }
    
    
    
//  
//  // 3️⃣ Q&A 작성 폼 이동
//  @GetMapping("/qna/write")
//  public String writeForm() {
//      // 로그인 체크
//      MemVo user = (MemVo) session.getAttribute("user");
//      
//      if (user == null) {
//          return "redirect:/qna/list";
//      }
//      
//      System.out.println("qna/write");
//      return "qna/qna_write";
//  }
  
  
//    // 마이페이지 삭제 처리
//    @GetMapping("/qna/delete")
//    public String delete(@RequestParam int qna_idx, RedirectAttributes redirectAttributes) {
//        // 로그인 체크
//        MemVo user = (MemVo) session.getAttribute("user");
//        
//        if (user == null) {
//            return "redirect:/qna/list";
//        }
//        
//        // 본인의 글인지 확인
//        QnaVo qna = qnaDao.selectQnaDetail(qna_idx);
//        
//        if (qna == null || qna.getMem_idx() != user.getMem_idx()) {
//            redirectAttributes.addFlashAttribute("errorMessage", "접근 권한이 없습니다.");
//            return "redirect:/qna/list";
//        }
//        
//        System.out.println("=== QnA 삭제 ===");
//        System.out.println("삭제할 번호: " + qna_idx);
//        
//        qnaDao.deleteQna(qna_idx);
//        return "redirect:/qna/list";
//    }
//    

        

//    // 마이페이지 답변 등록 처리
//    @PostMapping("/qna/answer")
//    public String answerQna(
//            @RequestParam("qna_idx") int qna_idx,
//            @RequestParam("qna_answer_content") String qna_answer_content,
//            RedirectAttributes redirectAttributes) {
//        
//        try {
//            // 디버깅용 로그 (개발 완료 후 제거)
//            System.out.println("=== 답변 등록 요청 ===");
//            System.out.println("qna_idx: " + qna_idx);
//            System.out.println("qna_answer_content: " + qna_answer_content);
//            
//            // 답변 등록
//            int result = qnaService.updateAnswer(qna_idx, qna_answer_content);
//            
//            if (result > 0) {
//                redirectAttributes.addFlashAttribute("message", "답변이 등록되었습니다.");
//            } else {
//                redirectAttributes.addFlashAttribute("error", "답변 등록에 실패했습니다.");
//            }
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//            redirectAttributes.addFlashAttribute("error", "답변 등록 중 오류가 발생했습니다.");
//        }
//        
//        // 상세 페이지로 리다이렉트
//        return "redirect:/qna/detail?qna_idx=" + qna_idx;
//    }

    
 

    
    
    
    
    //________ 마이페이지 .~!!관리자 일 경우 썻던 답변 삭제 하기 삭제 한 후 공백으로 만드는)
//    
// // Controller에 추가
//    @GetMapping("/qna/deleteAnswer")
//    public String deleteAnswer(
//        @RequestParam("qna_idx") int qnaIdx,
//        HttpSession session,
//        RedirectAttributes redirectAttributes) {
//        
//        try {
//            // 관리자 권한 확인
//            MemVo user = (MemVo) session.getAttribute("user");
//            if (user == null || !"admin".equals(user.getMem_roll())) {
//                redirectAttributes.addFlashAttribute("error", "권한이 없습니다.");
//                return "redirect:/qna/detail?qna_idx=" + qnaIdx;
//            }
//            
//            int result = qnaService.deleteAnswer(qnaIdx);
//            
//            if(result > 0) {
//                redirectAttributes.addFlashAttribute("message", "답변이 삭제되었습니다.");
//            } else {
//                redirectAttributes.addFlashAttribute("error", "답변 삭제에 실패했습니다.");
//            }
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//            redirectAttributes.addFlashAttribute("error", "답변 삭제 중 오류가 발생했습니다.");
//        }
//        
//        return "redirect:/qna/detail?qna_idx=" + qnaIdx;
//    }
    



//    // 관리자 Q&A 글 삭제
//    @GetMapping("/admin/qna/delete")
//    public String deleteQna(@RequestParam("qna_idx") int qna_idx,
//                            RedirectAttributes redirectAttributes) {
//        try {
//            int result = qnaService.deleteQna(qna_idx);
//            if (result > 0) {
//                redirectAttributes.addFlashAttribute("message", "글이 삭제되었습니다.");
//            } else {
//                redirectAttributes.addFlashAttribute("error", "삭제에 실패했습니다.");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            redirectAttributes.addFlashAttribute("error", "삭제 중 오류가 발생했습니다.");
//        }
//
//        return "redirect:/admin/qna_list";
//    }

    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
 
 
    
}
    
    
