package com.codeXie.service;

import com.codeXie.pojo.*;

import java.util.List;

public interface CompanyService {
    PageBean<Company> selCompanyService(Condition condition);

    Integer addCompanyService(Company company);

    Integer updStatusService(String[] cidArray,String status);

    Integer updCompanyService(String cid, Company company);


    List<Planner> plannerInfoService(Integer cid);
}
