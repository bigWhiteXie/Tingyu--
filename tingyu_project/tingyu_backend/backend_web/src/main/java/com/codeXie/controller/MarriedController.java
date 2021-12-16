package com.codeXie.controller;

import com.codeXie.mapper.MarriedMapper;
import com.codeXie.pojo.MarriedCondition;
import com.codeXie.pojo.MarriedPerson;
import com.codeXie.pojo.PageBean;
import com.codeXie.service.MarriedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("married")
public class MarriedController {
    @Autowired
    MarriedService marriedService;

    @ResponseBody
    @RequestMapping("marriedPersonInfo")
    public PageBean<MarriedPerson> marriedPersonInfo(MarriedCondition condition, Integer rows, Integer page){
        condition.setSize(rows);
        condition.setIndex(page);
        PageBean<MarriedPerson> pageBean = marriedService.selPersonService(condition);
        return pageBean;
    }

    @CrossOrigin
    @ResponseBody
    @RequestMapping("personLogin")
    public MarriedPerson personLogin(String pname,String ppwd){
        MarriedPerson person = marriedService.personLoginService(pname,ppwd);
        return person;
    }
}
