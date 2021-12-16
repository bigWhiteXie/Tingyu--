package com.codeXie.controller;

import com.codeXie.pojo.Admin;
import com.codeXie.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @ResponseBody
    @RequestMapping("adminLogin")
    public Boolean adminLogin(String aname, String apwd, HttpSession session){
        Admin admin = adminService.loginService(aname, apwd);
        if(admin != null){
            session.setAttribute("admin",admin);

        }
        return admin!=null;
    }

    @RequestMapping("adminOut")
    public String adminOut(HttpSession session){
        session.invalidate();
        return "redirect:/login.jsp";
    }
}
