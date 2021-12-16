package com.codeXie.service.Impl;

import com.codeXie.mapper.HostMapper;
import com.codeXie.mapper.companyMapper;
import com.codeXie.pojo.*;
import com.codeXie.service.CompanyService;
import com.codeXie.service.HostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    companyMapper mapper;

    @Override
    public PageBean<Company> selCompanyService(Condition condition) {
        //1.创建pagebean并初始化index和size
        PageBean<Company> pageBean = new PageBean<>();
        pageBean.setIndex(condition.getIndex());
        pageBean.setSize(condition.getSize());

        //2.查询记录数量
        int count = mapper.selCountMapper(condition);
        pageBean.setTotal(count);
        //3.获取记录起始索引
        condition.setStart(pageBean.getStartRow());
        //4.查询记录列表
        List<Company> rows = mapper.selCompanyMapper(condition);
        pageBean.setRows(rows);
        return  pageBean;
    }

    @Override
    public Integer addCompanyService(Company company) {
        return mapper.addCompanyMapper(company);
    }

    @Override
    public Integer updStatusService(String[] cidArray, String status) {
        return mapper.updStatusMapper(cidArray,status);
    }

    @Override
    public Integer updCompanyService(String cid, Company company) {
        return mapper.updCompanyMapper(cid,company);
    }


    @Override
    public List<Planner> plannerInfoService(Integer cid) {
        return mapper.selPlannerMapper(cid);
    }
}
