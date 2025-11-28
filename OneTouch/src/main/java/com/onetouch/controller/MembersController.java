package com.onetouch.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.service.MemService;
import com.onetouch.vo.MemVo;

@Controller
@RequestMapping("/admin")
public class MembersController {

    @Autowired
    private MemService memService; // 서비스 주입

    // 관리자 회원관리 페이지
    @GetMapping("/admin_members")
    public String adminPage(@RequestParam Map<String, Object> params, Model model) {
        // 서비스 호출 → 회원 목록 가져오기
        List<MemVo> members = memService.getMemberList(params);
        // JSP에 전달
        model.addAttribute("members", members);
        return "admin/admin_members"; //jsp경로
    }
}
