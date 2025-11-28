package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onetouch.service.MemService;
import com.onetouch.vo.MemVo;

@Controller
@RequestMapping("/admin")
public class MembersController {

    @Autowired
    private MemService memService;

    // 관리자 회원관리 페이지
    @GetMapping("/admin_members")
    public String adminPage(@RequestParam(defaultValue = "1") int page,
                           @RequestParam Map<String, Object> params, 
                           Model model) {
        
        int pageSize = 5; // 한 페이지에 5개씩
        int offset = (page - 1) * pageSize;
        
        params.put("limit", pageSize);
        params.put("offset", offset);
        
        // 회원 목록 조회
        List<MemVo> members = memService.getMemberList(params);
        
        // 전체 개수 조회
        int totalCount = memService.getMemberCount(params);
        
        // 전체 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        
        model.addAttribute("members", members);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);
        
        // 검색 파라미터 유지
        model.addAttribute("keyword", params.get("keyword"));
        model.addAttribute("searchType", params.get("searchType"));
        model.addAttribute("roll", params.get("roll"));
        
        return "admin/admin_members";
    }
    
    // 회원 권한 변경 (AJAX)
    @PostMapping("/updateMemberRoll")
    @ResponseBody
    public Map<String, Object> updateMemberRoll(@RequestParam String mem_id, 
                                                 @RequestParam String mem_roll) {
        Map<String, Object> result = new HashMap<>();
        Map<String, Object> params = new HashMap<>();
        
        params.put("mem_id", mem_id);
        params.put("mem_roll", mem_roll);
        
        try {
            int res = memService.updateMemberRoll(params);
            if (res > 0) {
                result.put("success", true);
                result.put("message", "권한이 변경되었습니다.");
            } else {
                result.put("success", false);
                result.put("message", "권한 변경에 실패했습니다.");
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "오류가 발생했습니다: " + e.getMessage());
        }
        
        return result;
    }
}