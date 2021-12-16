package com.codeXie.service.Impl;

import com.codeXie.mapper.MarriedMapper;
import com.codeXie.pojo.MarriedCondition;
import com.codeXie.pojo.MarriedPerson;
import com.codeXie.pojo.PageBean;
import com.codeXie.service.MarriedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MarriedServiceImpl implements MarriedService {
    @Autowired
    MarriedMapper marriedMapper;
    @Override
    public PageBean<MarriedPerson> selPersonService(MarriedCondition condition) {
        //创建pagebean并初始化size，index
        PageBean<MarriedPerson> pageBean = new PageBean<>();
        pageBean.setIndex(condition.getIndex());
        pageBean.setSize(condition.getSize());
        //获取查询的数据总数
        int count = marriedMapper.selCountMapper(condition);
        //设置数据总数，并得到起始记录索引
        pageBean.setTotal(count);
        condition.setStart(pageBean.getStartRow());
        List<MarriedPerson> list = marriedMapper.selMarriedMapper(condition);
        pageBean.setRows(list);
        return pageBean;
    }
    @Override
    public MarriedPerson personLoginService(String pname, String ppwd){
        return  marriedMapper.selPersonMapper(pname,ppwd);
    }

}
