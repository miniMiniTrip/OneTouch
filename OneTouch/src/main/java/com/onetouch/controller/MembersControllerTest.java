package com.onetouch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class MembersControllerTest {

    @GetMapping("/admin_members")
    public String adminPage() {
        return "admin/admin_members";
    }
}
