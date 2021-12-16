package com.codeXie.controller;

import com.codeXie.pojo.*;
import com.codeXie.service.CompanyService;
import org.graalvm.compiler.lir.alloc.lsra.LinearScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("company")
public class CompanyController {
    @Autowired
    private CompanyService service;

    @ResponseBody
    @RequestMapping("companyInfo")
    public PageBean<Company> companyInfo(Condition condition,Integer page,Integer rows){
        condition.setIndex(page);
        condition.setSize(rows);
        PageBean<Company> pageBean = service.selCompanyService(condition);
        return pageBean;
    }

    @ResponseBody
    @RequestMapping("companyAdd")
    public Boolean hostAdd(Company company){
        int i = service.addCompanyService(company);
        return i>0;
    }

    @ResponseBody
    @RequestMapping("companyStatus")
    public Boolean hostStatus(String hids,String status){
        String[] hidArray = hids.split(",");

        int i = service.updStatusService(hidArray, status);
        return i>0;
    }

    @ResponseBody
    @RequestMapping("companyUpdate")
    public Boolean companyUpdate(Company company, String cid){
        int i = service.updCompanyService(cid, company);
        return i>0;
    }

    @ResponseBody
    @RequestMapping("plannerInfo")
    public List<Planner> plannerInfo(Integer cid){
        return service.plannerInfoService(cid);
    }

}
