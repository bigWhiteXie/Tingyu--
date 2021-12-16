package com.codeXie.controller;

import com.codeXie.pojo.MarriedPerson;
import com.codeXie.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("personController")
public class MarriedPersonController {
    @Autowired
    PersonService service;

    @RequestMapping("personReg")
    public String personReg(MarriedPerson marriedPerson, String userCode, HttpSession session){
        int i=0;
        if(userCode.equals((String) session.getAttribute("code"))){
            i = service.registerService(marriedPerson);
        }
        return i>0?"redirect:/success.jsp":"redirect:/error.jsp";
    }

}
